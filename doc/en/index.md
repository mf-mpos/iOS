# General steps of card transaction

| **Card read & transaction process** |
| :------ |
| Scan BT device([scanBtDevice](scanBtDevice.md)) |
| Connect the BT device([connectBtDevice](connectBtDevice.md)) |
| Set factory code([setFactoryCode](setFactoryCode.md)) |
| Inject master key([loadMasterKey](loadMasterKey.md)) |
| Inject work key([loadWorkKey](loadWorkKey.md)) |
| Call card & transaction interface([mPosTradeEx](mPosTradeEx.md)) |
| Package data & calcuate MAC([calcMac](calcMac.md) / [calcMac2](calcMac2.md)) |
| Request data communication |
| Wait result |
| **Transaction END** |

### See also
[Home](../README.md)
[openBtDevice](openBtDevice.md) | [scanBtDevice](scanBtDevice.md) | [connectBtDevice](connectBtDevice.md) | [mPosTradeEx](mPosTradeEx.md) | [resetPos](resetPos.md) | [inputPin](inputPin.md) | [getRandomNum](getRandomNum.md) | [icDealOnline](icDealOnline.md) | [calcMac](calcMac.md) | [calcMac2](calcMac.md) | [endEmv](endEmv.md)
