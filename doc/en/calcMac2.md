# calcMac2

### Interface functions
> The MAC of incoming messages is calculated based on the work key stored(MK/SK) in MPOS.

### Prototype

```objective-c
-(NSInteger) calcMac2:(NSString *)data
               macAlg:(MFEU_MAC_ALG)macAlg;
```

- #### Paramter
| Name | Type | Description |
| :-------- | :--------| :------ |
| data| NSString | Source data(Format: BCD) |
| macAlg| [MFEU_MAC_ALG](enum.md#MFEU_MAC_ALG) | MAC Algorithm |


- #### Return
| Value | Description |
| :--------| :------ |
| -1 | Bluetooth not connected |
| else | send data length via BT |

### Delegate
- ###### didCalcMacResp:string:randomNumber:randomNumstr

```objective-c
-(void) didCalcMacResp:(NSString *)mac
                string:(NSString *)text
          randomNumber:(NSString *)randNumber
          randomNumstr:(NSString *)randNumstr;
```

- #### Return parameter
| Name | Value | Description |
| :-------- | :--------| :------ |
| mac| NSString | MAC result(Format: BCD) |
| string| NSString | MAC result |
| randNumber| NSString | MAC random number(Format: BCD) |
| randNumstr| NSString | MAC random number |


### See also
[Home](../README.md) | [readPosInfoEx](readPosInfoEx.md) | [setDatetime](setDatetime.md) | [getDatetime](getDatetime.md) | [mPosTradeEx](mPosTradeEx.md) | [calcMac](calcMac.md) | [getRandomNum](getRandomNum.md)

