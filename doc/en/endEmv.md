# endEmv

### Interface functions
> End EMV process operation

### Prototype

```objective-c
-(NSInteger) endEmv;
```

- #### Paramter
> void

- #### Return
| Value | Description |
| :--------| :------ |
| -1 | Bluetooth not connected |
| else | send data length via BT |

### Delegate

```objective-c
-(void) didEndEmvResp;
```

- #### Return parameter
> void

### See also
[Home](../README.md) | [readPosInfoEx](readPosInfoEx.md) | [setDatetime](setDatetime.md) | [getDatetime](getDatetime.md) | [mPosTradeEx](mPosTradeEx.md) | [icDealOnline](icDealOnline.md) | [calcMac2](calcMac2.md) | [getRandomNum](getRandomNum.md)

