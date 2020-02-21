# icDealOnline

###### 接口功能
> IC卡二次授权请求

###### 函数原型

```objective-c
-(NSInteger) icDealOnline:(NSString *)data
             onlineResult:(MFEU_ONLINE_RESULT)result;
```

###### 参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| data| NSString | 二次授权tag列表数据 |
| result| [MFEU_ONLINE_RESULT](enum-cn.md#MFEU_ONLINE_RESULT) | 是否联机成功 |

###### 返回值
| 参数类型 | 参数说明 |
| :--------| :------ |
| NSInteger | 正常返回蓝牙发送字节数，-1 表示：蓝牙未准备好 |


### 相关回调函数
- ###### didIcDealOnlineResp:

```objective-c
-(void) didIcDealOnlineResp:(MFEU_MSR_REAUTH_RESP)resp;
```

#### 返回参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| resp| [MFEU_MSR_REAUTH_RESP](enum-cn.md#MFEU_MSR_REAUTH_RESP) | 终端上的结果返回 |

