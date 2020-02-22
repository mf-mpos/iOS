# getDatetime

### 接口功能

> 获取终端当前时间

### 函数原型

```objective-c
-(NSInteger) getDatetime;
```

- #### 参数
> 空

- #### 返回值
| 参数类型 | 参数说明 |
| :--------| :------ |
| -1 | 蓝牙未连接 |
| else | 返回蓝牙发送字节数 |


### 相关回调函数

```objective-c
-(void) didGetDatetimeResp:(NSString *)datetime;
```

- #### 返回参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| datetime| NSString | 当前时间(YYYYMMDDhhmmss) |

### 参考相关函数
[接口列表](../README.md) | [readPosInfoEx](readPosInfoEx.md) | [setDatetime](setDatetime.md) | [setFactoryCode](setFactoryCode.md) | [getDeviceState](getDeviceState.md)
