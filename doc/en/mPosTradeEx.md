# mPosTradeEx

### Interface functions
> MPOS card reader interface

### Prototype

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

- #### Parameter
| Name | Type | Description |
| :-------- | :--------| :------ |
| cardType| [MFEU_READCARD_TYPE](enum.md#MFEU_READCARD_TYPE) | Read card type |
| cardTimeout| unsigned char | Card reading timeout (unit: second) |
| tradeDes| NSString | Screen display content |
| tradeAmt| int | Transaction amount |
| tradeType| [MFEU_TRADE_TYPE](enum.md#MFEU_TRADE_TYPE) | Transaction Type |
| pboc| [MFEU_PBOC_FLOW](enum.md#MFEU_PBOC_FLOW) | PBOC Process instructions |
| ecash| [MFEU_ECASH_TRADE](enum.md#MFEU_ECASH_TRADE) | Whether to support electronic cash |
| online| [MFEU_IC_ONLINE](enum.md#MFEU_IC_ONLINE) | Force online identification |
| pinreq| [MFEU_PINREQ](enum.md#MFEU_PINREQ) | PIN input flag |
| nPwdMaxLength| unsigned char | Maximum password length <=0x0C |
| nPwdTimeout| unsigned char | Input password timeout(1-255，单位：秒） |
| failback| [MFEU_FAILBACK](enum.md#MFEU_FAILBACK) | Whether downgrade is allowed |
| flowNo| NSString | Flow number |
| orderNo| NSString | Order number |
| tagList| NSString | Custom tag list（default: nil） |

- #### Return| Value | Description |
| :--------| :------ |
| -1 | Bluetooth not connected |
| else | send data length via BT |

### Delegate- ###### didMPosTradeResult:

```objective-c
-(void) didMPosTradeResult:(NSDictionary *)dicResult;
```

- #### Return parameter
| Name | Value | Description |
| :-------- | :--------| :------ |
| dicResult| NSDictionary | Read card result |

- #### Read card result NSDictionary *

| Name | 类型 | 说明 |
| :-------- | :--------| :------ |
| MPOS_KEY_CARDRESP | MFEU_MPOS_RESP | Card reading method |
| MPOS_KEY_MASKEDPAN | NSString | PAN |
| MPOS_KEY_EXPIRYDATE | NSString | Expiration date |
| MPOS_KEY_SERVICECODE | NSString | Service code |
| MPOS_KEY_TRACK2LENGTH | int | The second track data length |
| MPOS_KEY_TRACK3LENGTH | int | The third track data length |
| MPOS_KEY_TRACK2DATA | NSString | The second track data |
| MPOS_KEY_TRACK3DATA | NSString | The third track data |
| MPOS_KEY_RANDOMNUMBER | NSString | Card random number(BCD) |
| MPOS_KEY_RANDOMNUMSTR | NSString | Card random number |
| MPOS_KEY_PLAINLENGTH | int | Account plaintext length |
| MPOS_KEY_ENABLEFAILBACK | int | Whether to downgrade |
| MPOS_KEY_PWDLENGTH | int | Enter password length |
| MPOS_KEY_SERIALNUM | NSString | Serial Num |
| MPOS_KEY_KSN | NSString | KSN |
| MPOS_KEY_MAC | NSString | MAC result |
| MPOS_KEY_MACRANDOM | NSString | MAC random number(BCD) |
| MPOS_KEY_CARDHOLDER | NSString | CARD HOLDER |


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
static NSString* MPOS_KEY_CARDHOLDER = @"cardHolder";
```

### See also
[Home](../README.md) | [resetPos](resetPos.md) | [inputPin](inputPin.md) | [getRandomNum](getRandomNum.md) | [icDealOnline](icDealOnline.md) | [calcMac](calcMac.md) | [calcMac2](calcMac.md)

