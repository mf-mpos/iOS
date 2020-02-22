# inputPin

### 接口功能

> 发起密码输入请求

### 函数原型

```objective-c
-(NSInteger) inputPin: (NSInteger) maxlen
              timeOut: (NSInteger)timeout
            maskedPAN: (NSString *)pan;
```

- #### 参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| maxlen| NSInteger | 输入密码最大长度 |
| timeout| NSInteger | 输入密码的超时时间 |
| pan| NSString | 主账号 |

- #### 返回值
| 参数类型 | 参数说明 |
| :--------| :------ |
| -1 | 蓝牙未连接 |
| else | 返回蓝牙发送字节数 |


### 相关回调函数

```objective-c
-(void) didInputPinResp: (MFEU_MSR_KEYTYPE) type
              pwdLength: (NSInteger) len
                pwdText: (NSString *)text;
```

- #### 返回参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| type| [MFEU_MSR_KEYTYPE](enum.md#MFEU_MSR_KEYTYPE) | 按键返回值 |
| pwdLength| NSInteger | 输入密码长度 |
| pwdText| NSString | 返回pinblock |

### 参考相关函数
[接口列表](../README.md) | [resetPos](resetPos.md) | [mPosTradeEx](mPosTradeEx.md) | [inputPin](inputPin.md) | [getRandomNum](getRandomNum.md) | [icDealOnline](icDealOnline.md) | [calcMac](calcMac.md) | [calcMac2](calcMac.md)

