# inputPin

### Interface functions
> 

### Prototype

```objective-c
-(NSInteger) inputPin: (NSInteger) maxlen
              timeOut: (NSInteger)timeout
            maskedPAN: (NSString *)pan;
```

- #### Parameter
| Name | Type | Description |
| :-------- | :--------| :------ |
| maxlen| NSInteger | Maximum password length |
| timeout| NSInteger | Enter password timeout |
| pan| NSString | PAN(card account) |

- #### Return
| Value | Description |
| :--------| :------ |
| -1 | Bluetooth not connected |
| else | send data length via BT |


### Delegate

```objective-c
-(void) didInputPinResp: (MFEU_MSR_KEYTYPE) type
              pwdLength: (NSInteger) len
                pwdText: (NSString *)text;
```

- #### Return parameter
| Name | Value | Description |
| :-------- | :--------| :------ |
| type| [MFEU_MSR_KEYTYPE](enum.md#MFEU_MSR_KEYTYPE) | Key press return |
| pwdLength| NSInteger | Enter password length |
| pwdText| NSString | Pinblock result |

### See also
[Home](../README.md) | [resetPos](resetPos.md) | [mPosTradeEx](mPosTradeEx.md) | [inputPin](inputPin.md) | [getRandomNum](getRandomNum.md) | [icDealOnline](icDealOnline.md) | [calcMac](calcMac.md) | [calcMac2](calcMac.md)

