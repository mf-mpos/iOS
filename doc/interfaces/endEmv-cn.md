# endEmv

#### 接口功能
> 结束EMV流程操作

#### 函数原型

```objective-c
-(NSInteger) endEmv;
```

#### 参数
> 空

#### 返回值
| 参数类型 | 参数说明 |
| :--------| :------ |
| NSInteger | 正常返回蓝牙发送字节数，-1 表示：蓝牙未准备好 |

### 相关回调函数
- ###### didEndEmvResp

```objective-c
-(void) didEndEmvResp;
```

#### 返回参数
> 空


### 参考相关函数
[接口列表](../README-cn.md) | [readPosInfoEx](readPosInfoEx-cn.md) | [setDatetime](setDatetime-cn.md) | [getDatetime](getDatetime-cn.md) | [mPosTradeEx](mPosTradeEx-cn.md) | [icDealOnline](icDealOnline-cn.md) | [calcMac2](calcMac2-cn.md) | [getRandomNum](getRandomNum-cn.md)

