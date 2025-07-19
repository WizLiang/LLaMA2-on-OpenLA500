
LA32R_GCC     := loongarch32r-linux-gnusf-gcc
LA32R_AS      := loongarch32r-linux-gnusf-as
LA32R_GXX     := loongarch32r-linux-gnusf-g++
LA32R_OBJDUMP := loongarch32r-linux-gnusf-objdump
LA32R_GDB     := loongarch32r-linux-gnusf-gdb
LA32R_AR      := loongarch32r-linux-gnusf-ar
LA32R_OBJCOPY := loongarch32r-linux-gnusf-objcopy
LA32R_READELF := loongarch32r-linux-gnusf-readelf

.PHONY: all
all: $(TARGET)

#TODO: 根据Cache实际情况调整has_cache宏，以在start.S中生成正确的Cache初始化代码
CFLAGS += -Dhas_cache=0
CFLAGS += -Dcache_index_depth=0x100 -Dcache_offset_width=0x4 -Dcache_way=4
CFLAGS += -ffunction-sections -fdata-sections
CFLAGS += -nostartfiles -nostdlib -nostdinc -static -fno-builtin 
CFLAGS += -DCLOCKS_PER_SEC=CORE_CLOCKS_PER_SEC -D_CLOCKS_PER_SEC_=CORE_CLOCKS_PER_SEC
CFLAGS += -DUSE_CPU_CLOCK_COUNT

#若使用 newlib , 将下面的 -lsemihost 替换为 -lgloss
LDFLAGS +=  	-T $(LINKER_SCRIPT) \
				-Wl,--gc-sections -Wl,--check-sections \
				-lsemihost -lc -lm -lg -lgcc -L$(PICOLIBC_DIR)/lib	#changed

LINKER_SCRIPT := $(COMMON_DIR)/env/separate.lds

ASM_SRCS += $(COMMON_DIR)/env/start.S 

ifeq ($(TARGET), RTThread_Nano)

else
ASM_SRCS += $(COMMON_DIR)/env/trap_handler.S 
endif

C_SRCS   += $(COMMON_DIR)/drivers/confreg_time.c
C_SRCS   += $(COMMON_DIR)/drivers/core_time.c
C_SRCS   += $(COMMON_DIR)/drivers/common_func.c

INCLUDES += -I./ \
			-I$(COMMON_DIR)/include \
			-I$(PICOLIBC_DIR)/include \
			-I$(GCC_DIR)/lib/gcc/loongarch32r-linux-gnusf/8.3.0/include \
			-I$(GCC_DIR)/lib/gcc/loongarch32r-linux-gnusf/8.3.0/include-fixed

ASM_OBJS := $(ASM_SRCS:.S=.o)
C_OBJS := $(C_SRCS:.c=.o)

LINK_OBJS += $(ASM_OBJS) $(C_OBJS)
LINK_DEPS += $(LINKER_SCRIPT)

CLEAN_OBJS += $(OBJDIR)/$(TARGET).elf $(LINK_OBJS) $(OBJDIR)/$(TARGET).s $(OBJDIR)/$(TARGET).bin $(OBJDIR)/convert $(OBJDIR)/axi_ram.coe $(OBJDIR)/axi_ram.mif $(OBJDIR)/rom.vlog

$(TARGET): $(LINK_OBJS) $(LINK_DEPS) convert Makefile
	$(LA32R_GCC) $(CFLAGS) $(INCLUDES) $(LINK_OBJS) -o $(OBJDIR)/$@.elf $(LDFLAGS)
	$(LA32R_OBJCOPY) -O binary $(OBJDIR)/$@.elf $(OBJDIR)/$@.bin
	$(LA32R_OBJDUMP) --disassemble-all -S $(OBJDIR)/$@.elf > $(OBJDIR)/$@.s
	$(OBJDIR)/convert $@.bin $(OBJDIR)/
	cp ./$(OBJDIR)/axi_ram.mif $(COMMON_DIR)/../../
	cp ./$(OBJDIR)/axi_ram.mif $(CICIEC_WINDOWS_HOME)/sdk
	cp ./$(OBJDIR)/$@.bin $(COMMON_DIR)/../../
	cp ./$(OBJDIR)/$@.bin $(CICIEC_WINDOWS_HOME)/sdk
	rm -f $(LINK_OBJS)
	rm -f $(OBJDIR)/convert

$(ASM_OBJS): %.o: %.S
	$(LA32R_GCC) $(CFLAGS) $(INCLUDES) -c -o $@ $< 

$(C_OBJS): %.o: %.c
	$(LA32R_GCC) $(CFLAGS) $(INCLUDES) -c -o $@ $< 

convert: $(COMMON_DIR)/env/convert.c
	mkdir -p $(OBJDIR)/
	gcc -o $(OBJDIR)/convert $(COMMON_DIR)/env/convert.c

.PHONY: clean
clean:
	rm -f $(CLEAN_OBJS)
