# mPosTradeEx

### 接口功能

> MPOS读卡接口

### 函数原型

```objective-c
-(int) mPosTradeEx: (MFEU_READCARD_TYPE) cardType
       cardTimeout: (unsigned char) cardTimeout
          tradeDes: (NSString *) tradeDes
          tradeAmt: (int) nAmt
         tradeType: (MFEU_TRADE_TYPE) tradeType
          pbocFlow: (MFEU_PBOC_FLOW) pboc
        ecashTrade: (MFEU_ECASH_TRADE) ecash
       onlineTrade: (MFEU_IC_ONLINE) online
            pinReq: (MFEU_PINREQ) pinreq
      pwdMaxLength: (unsigned char) nPwdMaxLength
        pwdTimeout: (unsigned char) nPwdTimeout
    enableFailback: (MFEU_FAILBACK) failback
            flowNo: (NSString *)flowNo
           orderNo: (NSString *)orderNo
           tagList: (NSString *)tagList;
```

- #### 参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| cardType| [MFEU_READCARD_TYPE](enum.md#MFEU_READCARD_TYPE) | 读卡类型 |
| cardTimeout| unsigned char | 读卡超时时间（单位：秒） |
| tradeDes| NSString | 屏幕显示内容 |
| tradeAmt| int | 交易金额 |
| tradeType| [MFEU_TRADE_TYPE](enum.md#MFEU_TRADE_TYPE) | 交易类型 |
| pboc| [MFEU_PBOC_FLOW](enum.md#MFEU_PBOC_FLOW) | PBOC 流程指示 |
| ecash| [MFEU_ECASH_TRADE](enum.md#MFEU_ECASH_TRADE) | 是否支持电子现金 |
| online| [MFEU_IC_ONLINE](enum.md#MFEU_IC_ONLINE) | 强制联机标识 |
| pinreq| [MFEU_PINREQ](enum.md#MFEU_PINREQ) | PIN输入指示 |
| nPwdMaxLength| unsigned char | 密码的最大长度 <=0x0C |
| nPwdTimeout| unsigned char | 输入密码超时时间(1-255，单位：秒） |
| failback| [MFEU_FAILBACK](enum.md#MFEU_FAILBACK) | 是否允许降级 |
| flowNo| NSString | 流水号 |
| orderNo| NSString | 订单号 |
| tagList| NSString | 自定义tag列表（默认nil） |

- #### 返回值
| 参数类型 | 参数说明 |
| :--------| :------ |
| -1 | 蓝牙未连接 |
| else | 返回蓝牙发送字节数 |

### 相关回调函数

```objective-c
-(void) didMPosTradeResult:(NSDictionary *)dicResult;
```

- #### 返回参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| dicResult| NSDictionary | 读卡返回结果 |

- ###### 读卡返回结果 NSDictionary *

| 参数 | 类型 | 说明 |
| :-------- | :--------| :------ |
| MPOS_KEY_CARDRESP | MFEU_MPOS_RESP | 读卡方式 |
| MPOS_KEY_MASKEDPAN | NSString | 卡号 |
| MPOS_KEY_EXPIRYDATE | NSString | 有效期 |
| MPOS_KEY_SERVICECODE | NSString | 服务代码 |
| MPOS_KEY_TRACK2LENGTH | int | 二磁数据长度 |
| MPOS_KEY_TRACK3LENGTH | int | 三磁数据长度 |
| MPOS_KEY_TRACK2DATA | NSString | 二磁数据 |
| MPOS_KEY_TRACK3DATA | NSString | 二磁数据 |
| MPOS_KEY_RANDOMNUMBER | NSString | 读卡随机数BCD |
| MPOS_KEY_RANDOMNUMSTR | NSString | 读卡随机数 |
| MPOS_KEY_PLAINLENGTH | int | 主账号明文长度 |
| MPOS_KEY_ENABLEFAILBACK | int | 是否降级(0: 无 1: 降级) |
| MPOS_KEY_PWDLENGTH | int | 输入密码长度 |
| MPOS_KEY_SERIALNUM | NSString | 卡片序列号 |
| MPOS_KEY_KSN | NSString | KSN |
| MPOS_KEY_MAC | NSString | MAC数据 |
| MPOS_KEY_MACRANDOM | NSString | MAC随机数(BCD) |
| MPOS_KEY_IDENCRYPT | NSString | 卡号密文(21号文) |
| MPOS_KEY_CARDHOLDER | NSString | 持卡人信息 |


```objective-c
static NSString* MPOS_KEY_CARDRESP = @"cardResp";
static NSString* MPOS_KEY_MASKEDPAN = @"maskedPAN";
static NSString* MPOS_KEY_EXPIRYDATE = @"expiryDate";
static NSString* MPOS_KEY_SERVICECODE = @"serviceCode";
static NSString* MPOS_KEY_TRACK2LENGTH = @"track2Length";
static NSString* MPOS_KEY_TRACK3LENGTH = @"track3Length";
static NSString* MPOS_KEY_TRACK2DATA = @"track2Data";
static NSString* MPOS_KEY_TRACK3DATA = @"track3Data";
static NSString* MPOS_KEY_RANDOMNUMBER = @"randomNumber";
static NSString* MPOS_KEY_RANDOMNUMSTR = @"randomNumstr";
static NSString* MPOS_KEY_PLAINLENGTH = @"plainLength";
static NSString* MPOS_KEY_DATA55 = @"data55";
static NSString* MPOS_KEY_ENABLEFAILBACK = @"enableFailback";
static NSString* MPOS_KEY_PWDLENGTH = @"pwdLength";
static NSString* MPOS_KEY_PINBLOCK = @"pinBlock";
static NSString* MPOS_KEY_SERIALNUM = @"serialNum";
static NSString* MPOS_KEY_KSN = @"KSN";
static NSString* MPOS_KEY_MAC = @"MAC";
static NSString* MPOS_KEY_MACRANDOM = @"MACRandom";
static NSString* MPOS_KEY_IDENCRYPT = @"idEncrypt";
static NSString* MPOS_KEY_CARDHOLDER = @"cardHolder";
```

### 参考相关函数
[接口列表](../README.md) | [resetPos](resetPos.md) | [inputPin](inputPin.md) | [getRandomNum](getRandomNum.md) | [icDealOnline](icDealOnline.md) | [calcMac](calcMac.md) | [calcMac2](calcMac.md)

