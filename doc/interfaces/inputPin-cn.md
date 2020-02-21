# inputPin

###### 接口功能
> 停止扫描蓝牙设备

###### 函数原型

```objective-c
-(NSInteger) inputPin: (NSInteger) maxlen
              timeOut: (NSInteger)timeout
            maskedPAN: (NSString *)pan;
```

###### 参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| maxlen| NSInteger | 输入密码最大长度 |
| timeout| NSInteger | 输入密码的超时时间 |
| pan| NSString | 主账号 |

###### 返回值
| 参数类型 | 参数说明 |
| :--------| :------ |
| NSInteger | 正常返回蓝牙发送字节数，-1 表示：蓝牙未准备好 |


### 相关回调函数
- ###### didInputPinResp:pwdLength:pwdText
回调时机：停止蓝牙设备搜索
```objective-c
-(void) didInputPinResp: (MFEU_MSR_KEYTYPE) type
              pwdLength: (NSInteger) len
                pwdText: (NSString *)text;
```

#### 返回参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| type| [MFEU_MSR_KEYTYPE](enum-cn.md#MFEU_MSR_KEYTYPE) | 按键返回值 |
| pwdLength| NSInteger | 输入密码长度 |
| pwdText| NSString | 返回pinblock |

