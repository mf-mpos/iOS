# scanBtDevice

#### 接口功能
> 扫描附近蓝牙设备

#### 函数原型

```objective-c
-(void) scanBtDevice:(NSInteger)timeout;
```

#### 参数
> 空

#### 返回值
> 空

### 相关回调函数
- ###### didFoundBtDevice:
回调时机：搜索到一个蓝牙设备时
```objective-c
-(void) didFoundBtDevice:(NSString *)btDevice;
```

#### 返回参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| btDevice| NSString | 当前搜索到一个蓝牙设备名称 |

### 参考相关函数
[接口列表](../README-cn.md) | [openBtDevice](openBtDevice-cn.md) | [stopScan](stopScan-cn.md) | [connectBtDevice](connectBtDevice-cn.md) | [disconnectBtDevice](disconnectBtDevice-cn.md)
