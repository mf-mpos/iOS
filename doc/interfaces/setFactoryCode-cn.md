# setFactoryCode

###### 接口功能
> 设置终端时间

###### 函数原型

```objective-c
-(NSInteger) setFactoryCode:(NSInteger)factoryid;
```

###### 参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| factoryid| NSInteger | 厂商ID，开机默认为0，设置重启后失效 |

###### 返回值
| 参数类型 | 参数说明 |
| :--------| :------ |
| NSInteger | 正常返回蓝牙发送字节数，-1 表示：蓝牙未准备好 |

###### 备注
本条指令，当前时间会自动设置到终端上

### 相关回调函数
- ###### didSetDatetimeResp

```objective-c
-(void) didSetDatetimeResp;
```

#### 返回参数
> 空

### 参考相关函数
[接口列表](../README-cn.md) | [readPosInfoEx](readPosInfoEx-cn.md) | [setDatetime](setDatetime-cn.md) | [getDatetime](getDatetime-cn.md) | [getDeviceState](getDeviceState-cn.md)
