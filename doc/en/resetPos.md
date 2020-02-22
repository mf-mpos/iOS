# resetPos

### Interface functions
> Cancel the current card reading operation

### Prototype

```objective-c
-(NSInteger) resetPos;
```

- #### Paramter
> void

- #### Return| Value | Description |
| :--------| :------ |
| -1 | Bluetooth not connected |
| else | send data length via BT |

### Delegate
```objective-c
-(void) didResetPosResp:(MFEU_MSR_RESP)resp;
```

- #### Return parameter
| Name | Value | Description |
| :-------- | :--------| :------ |
| resp| [MFEU_MSR_RESP](enum.md#MFEU_MSR_RESP) | Return result from MPOS |

### See also
[Home](../README.md) | [readPosInfoEx](readPosInfoEx.md) | [mPosTradeEx](mPosTradeEx.md) | [inputPin](inputPin.md) | [getDeviceState](getDeviceState.md)
