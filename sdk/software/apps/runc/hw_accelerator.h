#ifndef HW_ACCELERATOR_H
#define HW_ACCELERATOR_H

//-------------------------------------------------
// 寄存器地址偏移量 (Register Offsets)
//-------------------------------------------------
#define REG_CTRL_ADDR       0x0000  // Control Register (RW)
#define REG_STATUS_ADDR     0x0004  // Status Register (RO) / Interrupt Ack (WO)
#define REG_ERR_CODE_ADDR   0x0008  // Error Code Register (RO)
#define REG_VI_BASE_ADDR    0x0010  // Input Vector (x) Base Address in DDR (RW)
#define REG_MI_BASE_ADDR    0x0014  // Input Matrix (w) Base Address in DDR (RW)
#define REG_VO_BASE_ADDR    0x0018  // Output Vector (xout) Base Address in DDR (RW)
#define REG_ROWS_ADDR       0x0020  // Matrix Rows Count (d) (RW)
#define REG_COLS_ADDR       0x0024  // Matrix Columns Count (n) (RW)

//-------------------------------------------------
// 控制寄存器 (CSR_CTRL) 的位定义
//-------------------------------------------------
#define CTRL_BIT_MAC_START  (1 << 0) // 写1启动MAC计算


//-------------------------------------------------
// DMA配置寄存器 (CSR_DMA_CONF) 的位定义
//-------------------------------------------------
#define CSR_CTRL_START_BIT  (1 << 0) // Write 1 to this bit to start the engine

#define CSR_STATUS_BUSY_BIT (1 << 0) // This bit is 1 if the engine is busy

#endif // HW_ACCELERATOR_H
