# 读卡交易一般步骤

| **读卡交易流程** |
| :------ |
| 扫描蓝牙设备([scanBtDevice](scanBtDevice.md)) |
| 连接蓝牙设备([connectBtDevice](connectBtDevice.md)) |
| 设置厂商ID([setFactoryCode](setFactoryCode.md)) |
| 下载主密钥([loadMasterKey](loadMasterKey.md)) |
| 下载工作密钥([loadWorkKey](loadWorkKey.md)) |
| 调用读卡接口([mPosTradeEx](mPosTradeEx.md)) |
| 数据包MAC计算([calcMac2](calcMac2.md)) |
| 组包通讯 |
| 等待通讯结果 |
| **交易结束** |

### 参考相关函数
[接口列表](../README.md)
[openBtDevice](openBtDevice.md) | [scanBtDevice](scanBtDevice.md) | [connectBtDevice](connectBtDevice.md) | [mPosTradeEx](mPosTradeEx.md) | [resetPos](resetPos.md) | [inputPin](inputPin.md) | [getRandomNum](getRandomNum.md) | [icDealOnline](icDealOnline.md) | [calcMac](calcMac.md) | [calcMac2](calcMac.md) | [endEmv](endEmv.md)
