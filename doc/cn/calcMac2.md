# calcMac2

### 接口功能
> MAC计算请求

### 函数原型

```objective-c
-(NSInteger) calcMac2:(NSString *)data
               macAlg:(MFEU_MAC_ALG)macAlg;
```

- #### 参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| data| NSString | 源数据(BCD格式) |
| macAlg| [MFEU_MAC_ALG](enum.md#MFEU_MAC_ALG) | 指定MAC算法 |


- #### 返回值
| 参数类型 | 参数说明 |
| :--------| :------ |
| -1 | 蓝牙未连接 |
| else | 返回蓝牙发送字节数 |

### 相关回调函数

```objective-c
-(void) didCalcMacResp:(NSString *)mac
                string:(NSString *)text
          randomNumber:(NSString *)randNumber
          randomNumstr:(NSString *)randNumstr;
```

- #### 返回参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| mac| NSString | MAC数据(BCD格式) |
| string| NSString | MAC数据 |
| randNumber| NSString | MAC随机数(BCD格式) |
| randNumstr| NSString | MAC随机数 |


### 参考相关函数
[接口列表](../README.md) | [readPosInfoEx](readPosInfoEx.md) | [setDatetime](setDatetime.md) | [getDatetime](getDatetime.md) | [mPosTradeEx](mPosTradeEx.md) | [calcMac](calcMac.md) | [getRandomNum](getRandomNum.md)

