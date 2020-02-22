# updatePos

### 接口功能

> MPOS固件更新

### 函数原型

```objective-c
-(NSInteger) updatePos: (NSString *)upgradeFilename;
```

- #### 参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| upgradeFilename| NSString | 指定固件文件可访问的路径 |

- #### 返回值
| 参数类型 | 参数说明 |
| :--------| :------ |
| -1 | 蓝牙未连接 |
| else | 返回蓝牙发送字节数 |


### 相关回调函数

```objective-c
-(void) didUpgradeResp:(NSInteger) pos
                  size:(NSInteger) length;
```

- #### 返回参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| pos| NSInteger | 当前下载进度 |
| length| NSInteger | 固件文件大小 |

### 参考相关函数
[接口列表](../README.md) | [setTimeout](setTimeout.md) | [readPosInfoEx](readPosInfoEx.md) | [getVersion](getVersion.md)

