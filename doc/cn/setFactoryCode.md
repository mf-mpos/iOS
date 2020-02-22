# setFactoryCode

### 接口功能

> 设置终端时间

### 函数原型

```objective-c
-(NSInteger) setFactoryCode:(NSInteger)factoryid;
```

- #### 参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| factoryid| NSInteger | 厂商ID，开机默认为0，设置重启后失效 |

- #### 返回值
| 参数类型 | 参数说明 |
| :--------| :------ |
| -1 | 蓝牙未连接 |
| else | 返回蓝牙发送字节数 |

###### 备注
本条指令，当前时间会自动设置到终端上

### 相关回调函数

```objective-c
-(void) didSetDatetimeResp;
```

- #### 返回参数
> 空

### 参考相关函数
[接口列表](../README.md) | [readPosInfoEx](readPosInfoEx.md) | [setDatetime](setDatetime.md) | [getDatetime](getDatetime.md) | [getDeviceState](getDeviceState.md)
