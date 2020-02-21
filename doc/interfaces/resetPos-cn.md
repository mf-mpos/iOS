# resetPos

#### 接口功能
> 取消当前读卡操作

#### 函数原型

```objective-c
-(NSInteger) resetPos;
```

#### 参数
> 空

#### 返回值
| 参数类型 | 参数说明 |
| :--------| :------ |
| NSInteger | 正常返回蓝牙发送字节数，-1 表示：蓝牙未准备好 |

### 相关回调函数
- ###### didResetPosResp:
回调时机：搜索到一个蓝牙设备时
```objective-c
-(void) didResetPosResp:([MFEU_MSR_RESP](enum-cn.md#MFEU_MSR_RESP))resp;
```

#### 返回参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| resp| MFEU_MSR_RESP | 终端上的结果返回 |
