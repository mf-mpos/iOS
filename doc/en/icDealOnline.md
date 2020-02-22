# icDealOnline

### Interface functions
> IC card secondary authorization request

### Prototype

```objective-c
-(NSInteger) icDealOnline:(NSString *)data
             onlineResult:(MFEU_ONLINE_RESULT)result;
```

- #### Parameter
| Name | Type | Description |
| :-------- | :--------| :------ |
| data| NSString | Request tag list data |
| result| [MFEU_ONLINE_RESULT](enum.md#MFEU_ONLINE_RESULT) | Online result |

- #### Return
| Value | Description |
| :--------| :------ |
| -1 | Bluetooth not connected |
| else | send data length via BT |


### Delegate

```objective-c
-(void) didIcDealOnlineResp:(MFEU_MSR_REAUTH_RESP)resp;
```

- #### Return parameter
| Name | Value | Description |
| :-------- | :--------| :------ |
| resp| [MFEU_MSR_REAUTH_RESP](enum.md#MFEU_MSR_REAUTH_RESP) | Return result from MPOS |

### See also
[Home](../README.md) | [resetPos](resetPos.md) | [mPosTradeEx](mPosTradeEx.md) | [inputPin](inputPin.md) | [getRandomNum](getRandomNum.md) | [calcMac](calcMac.md) | [calcMac2](calcMac.md)

