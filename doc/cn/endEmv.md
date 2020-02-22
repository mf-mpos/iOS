# endEmv

### 接口功能
> 结束EMV流程操作

### 函数原型

```objective-c
-(NSInteger) endEmv;
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
-(void) didEndEmvResp;
```

- #### 返回参数
> 空


### 参考相关函数
[接口列表](../README.md) | [readPosInfoEx](readPosInfoEx.md) | [setDatetime](setDatetime.md) | [getDatetime](getDatetime.md) | [mPosTradeEx](mPosTradeEx.md) | [icDealOnline](icDealOnline.md) | [calcMac2](calcMac2.md) | [getRandomNum](getRandomNum.md)

