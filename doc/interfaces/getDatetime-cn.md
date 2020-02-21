# getDatetime

###### 接口功能
> 获取终端当前时间

###### 函数原型

```objective-c
-(NSInteger) getDatetime;
```

###### 参数
> 空

###### 返回值
| 参数类型 | 参数说明 |
| :--------| :------ |
| NSInteger | 正常返回蓝牙发送字节数，-1 表示：蓝牙未准备好 |


### 相关回调函数
- ###### didGetDatetimeResp:

```objective-c
-(void) didGetDatetimeResp:(NSString *)datetime;
```

#### 返回参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| datetime| NSString | 当前时间(YYYYMMDDhhmmss) |

### 参考相关函数
[接口列表](../README-cn.md) | [readPosInfoEx](readPosInfoEx-cn.md) | [setDatetime](setDatetime-cn.md) | [setFactoryCode](setFactoryCode-cn.md) | [getDeviceState](getDeviceState-cn.md)
