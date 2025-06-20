
# rfsoc_reg 寄存器文档
segment address : 0x8010

## DAC 寄存器

| 名称           | 地址        | 位宽/位域 | 读写属性 | 描述        |
| -------------- | ----------- | --------- | -------- | ----------- |
| dac_start_addr | 0x8010_0000 | [31:0]    | R/W      | DAC起始地址 |
| dac_cap_size   | 0x8010_0004 | [31:0]    | R/W      | DAC采集长度 |
| dac_reset      | 0x8010_0008 | [1]       | R/W      | DAC复位     |
| dac_start      | 0x8010_0008 | [0]       | R/W      | DAC启动     |

## ADC 寄存器

| 名称           | 地址        | 位宽/位域 | 读写属性 | 描述        |
| -------------- | ----------- | --------- | -------- | ----------- |
| adc_start_addr | 0x8010_000C | [31:0]    | R/W      | ADC起始地址 |
| adc_cap_size   | 0x8010_0010 | [31:0]    | R/W      | ADC采集长度 |
| adc_reset      | 0x8010_0014 | [1]       | R/W      | ADC复位     |
| adc_start      | 0x8010_0014 | [0]       | R/W      | ADC启动     |
| adc_cap_done   | 0x8010_0014 | [8]       | RO       | ADC采集完成 |

## GTY 寄存器

| 名称         | 地址        | 位宽/位域 | 读写属性 | 描述          |
| ------------ | ----------- | --------- | -------- | ------------- |
| gty_ram_wren | 0x8010_0018 | [12]      | R/W      | GTY RAM写使能 |
| gty_chn      | 0x8010_0018 | [11:8]    | R/W      | GTY通道选择   |
| gty_ram_addr | 0x8010_0018 | [7:0]     | R/W      | GTY RAM地址   |
| gty_ram_data | 0x8010_001C | [31:0]    | R/W      | GTY RAM数据   |
| gty_reset    | 0x8010_0020 | [1]       | R/W      | GTY复位       |
| gty_start    | 0x8010_0020 | [0]       | R/W      | GTY启动       |

## 状态与只读寄存器

| 名称                   | 地址        | 位宽/位域 | 读写属性 | 描述              |
| ---------------------- | ----------- | --------- | -------- | ----------------- |
| dac_read_mm2s_err      | 0x8010_0100 | [16]      | RO       | DAC读错误标志     |
| dac_run_cycles         | 0x8010_0100 | [15:8]    | RO       | DAC运行周期计数   |
| dac_datamover_status   | 0x8010_0100 | [7:0]     | RO       | DAC DataMover状态 |
| dac_current_addr       | 0x8010_0104 | [31:0]    | RO       | DAC当前地址       |
| adc_wr_mm2s_err        | 0x8010_0108 | [16]      | RO       | ADC写错误标志     |
| adc_run_cycles         | 0x8010_0108 | [15:8]    | RO       | ADC运行周期计数   |
| adc_datamover_status   | 0x8010_0108 | [7:0]     | RO       | ADC DataMover状态 |
| adc_current_addr       | 0x8010_010C | [31:0]    | RO       | ADC当前地址       |
| c0_init_calib_complete | 0x8010_0110 | [1]       | RO       | DDR初始化校准完成 |
| gt_powergood           | 0x8010_0110 | [0]       | RO       | GT电源良好状态    |

## 中断相关寄存器

| 名称          | 地址        | 位宽/位域 | 读写属性 | 描述                        |
| ------------- | ----------- | --------- | -------- | --------------------------- |
| irq_enable    | 0x8010_0114 | [1:0]     | R/W      | 中断使能                    |
| irq_dm_status | 0x8010_0114 | [8]       | R/W      | DataMover中断状态,写1清状态 |
| irq_rf_status | 0x8010_0114 | [9]       | R/W      | 射频中断状态,写1清状态      |

---
