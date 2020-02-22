# resetPos

### 接口功能
> 取消当前读卡操作

### 函数原型

```objective-c
-(NSInteger) resetPos;
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
-(void) didResetPosResp:(MFEU_MSR_RESP)resp;
```

- #### 返回参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| resp| [MFEU_MSR_RESP](enum.md#MFEU_MSR_RESP) | 终端上的结果返回 |

### 参考相关函数
[接口列表](../README.md) | [readPosInfoEx](readPosInfoEx.md) | [mPosTradeEx](mPosTradeEx.md) | [inputPin](inputPin.md) | [getDeviceState](getDeviceState.md)
