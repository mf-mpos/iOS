# calcMac

#### 接口功能
> MAC计算请求

#### 函数原型

```objective-c
-(NSInteger) calcMac:(NSString *)data
              macAlg:(MFEU_MAC_ALG)macAlg;
```

#### 参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| data| NSString | 源数据 |
| macAlg| [MFEU_MAC_ALG](enum-cn.md#MFEU_MAC_ALG) | 指定MAC算法 |


#### 返回值
| 参数类型 | 参数说明 |
| :--------| :------ |
| NSInteger | 正常返回蓝牙发送字节数，-1 表示：蓝牙未准备好 |

### 相关回调函数
- ###### didCalcMacResp:string:randomNumber:randomNumstr

```objective-c
-(void) didCalcMacResp:(NSString *)mac
                string:(NSString *)text
          randomNumber:(NSString *)randNumber
          randomNumstr:(NSString *)randNumstr;
```

#### 返回参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| mac| NSString | MAC数据(BCD格式) |
| string| NSString | MAC数据 |
| randNumber| NSString | MAC随机数(BCD格式) |
| randNumstr| NSString | MAC随机数 |


### 参考相关函数
[接口列表](../README-cn.md) | [readPosInfoEx](readPosInfoEx-cn.md) | [setDatetime](setDatetime-cn.md) | [getDatetime](getDatetime-cn.md) | [mPosTradeEx](mPosTradeEx-cn.md) | [calcMac2](calcMac2-cn.md) | [getRandomNum](getRandomNum-cn.md)

