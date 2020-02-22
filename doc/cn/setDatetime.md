# setDatetime

### 接口功能

> 设置终端时间

### 函数原型

```objective-c
-(NSInteger) setDatetime:(NSString *)datetime
               factoryId:(NSInteger)factoryid;
```

- #### 参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| datetime| NSString | 日期时间，格式: YYYYMMDDHHMMSS, 长度14位 |
| factoryid| NSInteger | 厂商ID，开机默认为0，设置重启后失效 |

- #### 返回值
| 参数类型 | 参数说明 |
| :--------| :------ |
| -1 | 蓝牙未连接 |
| else | 返回蓝牙发送字节数 |


### 相关回调函数

```objective-c
-(void) didSetDatetimeResp;
```

- #### 返回参数
> 空

### 参考相关函数
[接口列表](../README.md) | [readPosInfoEx](readPosInfoEx.md) | [setFactoryCode](setFactoryCode.md) | [getDatetime](getDatetime.md) | [getDeviceState](getDeviceState.md)
