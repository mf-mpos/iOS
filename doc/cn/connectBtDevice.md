# connectBtDevice

### 接口功能

> 连接指定的蓝牙设备

### 函数原型

```objective-c
-(void) connectBtDevice:(NSString *)btDevice;
```

- #### 参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| btDevice| NSString | 通过蓝牙名或UUID连接指定蓝牙设备 |

- #### 返回值
> 空

### 相关回调函数
> #### 回调时机：蓝牙设备连接成功
```objective-c
-(void) didConnected:(NSString *)devName;
```

- #### 返回参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| devName| NSString | 连接上的蓝牙设备名称 |


> #### 回调时机：蓝牙设备连接失败
```objective-c
-(void) didConnectFail;
```
- #### 返回参数
空

### 参考相关函数
[接口列表](../README.md) | [openBtDevice](openBtDevice.md) | [scanBtDevice](scanBtDevice.md) | [stopScan](stopScan.md) | [disconnectBtDevice](disconnectBtDevice.md)
