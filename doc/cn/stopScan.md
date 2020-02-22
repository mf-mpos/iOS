# stopScan

### 接口功能

> 停止扫描蓝牙设备

### 函数原型

```objective-c
-(void) stopScan;
```

- #### 参数
> 空

- #### 返回值
> 空

### 相关回调函数

> ##### 回调时机：停止蓝牙设备搜索

```objective-c
-(void) didStopScanBtDevice;
```

- #### 返回参数
> 空

> ##### 回调时机：停止蓝牙设备搜索，并返回设备列表

```objective-c
-(void) didStopScanBtDevice: (NSMutableArray *)deviceArray;
```
- #### 返回参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| deviceArray| NSMutableArray | 搜索到所有的蓝牙设备列表（包括名称+UUID） |

### 参考相关函数
[接口列表](../README.md) | [openBtDevice](openBtDevice.md) | [scanBtDevice](scanBtDevice.md) | [connectBtDevice](connectBtDevice.md) | [disconnectBtDevice](disconnectBtDevice.md)
