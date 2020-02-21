# 读卡交易一般步骤

| **读卡交易流程** |
| :------ |
| 扫描蓝牙设备([scanBtDevice](scanBtDevice-cn.md)) |
| 连接蓝牙设备([connectBtDevice](connectBtDevice-cn.md)) |
| 设置厂商ID([setFactoryCode](setFactoryCode-cn.md)) |
| 下载主密钥([loadMasterKey](loadMasterKey-cn.md)) |
| 下载工作密钥([loadWorkKey](loadWorkKey-cn.md)) |
| 调用读卡接口([mPosTradeEx](mPosTradeEx-cn.md)) |
| 数据包MAC计算([calcMac2](calcMac2-cn.md)) |
| 组包通讯 |
| 等待通讯结果 |
| **交易结束** |

### 参考相关函数
[接口列表](../README-cn.md)
[openBtDevice](openBtDevice-cn.md) | [scanBtDevice](scanBtDevice-cn.md) | [connectBtDevice](connectBtDevice-cn.md) | [mPosTradeEx](mPosTradeEx-cn.md) | [resetPos](resetPos-cn.md) | [inputPin](inputPin-cn.md) | [getRandomNum](getRandomNum-cn.md) | [icDealOnline](icDealOnline-cn.md) | [calcMac](calcMac-cn.md) | [calcMac2](calcMac-cn.md) | [endEmv](endEmv-cn.md)
