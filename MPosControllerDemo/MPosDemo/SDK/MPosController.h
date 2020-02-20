//
//  MPosController.h
//  MPosClient
//
//  Created by ChenJiaqi on 15/3/19.
//  Mail: chenjq@morefun-et.com
//  Copyright (c) 2015-2017 MoreFun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#include "MPosDefine.h"

typedef NS_ENUM(NSInteger, MFDeviceType) {
    DeviceType_Unknown = 0,
    DeviceType_M60A1,  // 音频刷卡头
    DeviceType_M60A2,  // 蓝牙刷卡头
    DeviceType_M60B,   // 蓝牙ＭＰＯＳ
};

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
static NSString* MPOS_KEY_TRACKFLAG = @"trackFlag";

@protocol MPosDelegate;

@interface MPosController : NSObject

@property (assign, nonatomic) id <MPosDelegate> delegate;

/// Instance object
+(id) sharedInstance;

#pragma mark - Audio reader

/// Open & Connect audio reader
/**
 * @see Delegate: MPosDelegate::didDevicePlugged:
 * @see Delegate: MPosDelegate::didDeviceUnplugged:
 * @see Delegate: MPosDelegate::didInterrupted:
 * @see close:
 */
-(void) open;

/// Close connect audio reader
/**
 * @see open:
 */
-(void) close;

/// Get device status
/*
 * @param  void
 * @return NSInteger <BR>
            <p>Audio: -1=No insert, 0=No connect, 1=Connected<br>
            BLE: 0=No connect, 1=Connected</p>
 */
-(NSInteger) getDeviceState;

/// Get device model
/*
 * @param  Void
 * @return MFDeviceType <BR>
 */
-(MFDeviceType) getDeviceType;

/// Open BLE device
/**
 * @param   Set repair connect flag
 * @see openBtDevice
 * @see scanBtDevice:
 * @see stopScan
 * @see connectBtDevice:
 * @see disconnectBtDevice
 */
-(void) initBtDevice: (BOOL)isRepairConnect;
/**
 * @see scanBtDevice:
 * @see stopScan
 * @see connectBtDevice:
 * @see disconnectBtDevice
 */
-(void) openBtDevice;

/// Scan BLE devices
/**
 * @param timeout Scan timeout time(Unit: second)
 * @see Delegate: MPosDelegate::didFoundBtDevice:
 * @see openBtDevice
 * @see stopScan
 * @see connectBtDevice:
 * @see disconnectBtDevice
 */
-(void) scanBtDevice:(NSInteger)timeout;
-(void) scanBtDevice:(NSInteger)timeout filterName: (NSString *)strName;

/// Stop BLE scan
/**
 * @see Delegate: MPosDelegate::didStopScanBtDevice
 * @see openBtDevice
 * @see scanBtDevice:
 * @see connectBtDevice:
 * @see disconnectBtDevice
 */
-(void) stopScan;

/// Connect BLE device
/**
 * @param btDevice BLE name
 * @see Delegate: MPosDelegate::didConnected:
 * @see openBtDevice
 * @see scanBtDevice:
 * @see stopScan
 * @see disconnectBtDevice
 */
-(void) connectBtDevice:(NSString *)btDevice;

/// Connect BLE device
/**
 * @param btDevice BLE name
 * @param timeout Connect timeout time(Unit: second)
 * @see Delegate: MPosDelegate::didConnected:
 * @see openBtDevice
 * @see scanBtDevice:
 * @see stopScan
 * @see disconnectBtDevice
 */
-(void) connectBtDevice:(NSString *)btDevice connectTimeout:(NSInteger) timeout;

-(void) connectBT:(CBPeripheral *)peripheral connectTimeout:(NSInteger)connectTimeout;

/// Disconnect BLE device
/**
 * @see 相关消息回调: MPosDelegate::didDisconnect:
 * @see openBtDevice
 * @see scanBtDevice:
 * @see stopScan
 * @see connectBtDevice
 */
-(void) disconnectBtDevice;

/// Get SDK version
-(NSString *) getVersion;

/// Set recvice timeout time
/**
 * @param timeout   [IN]    Timeout time(Unit: second)
 * @see cancel
 **/
-(void) setTimeout: (NSInteger) timeout;

/// Cancel swipt card
/**
 * @see setTimeout:
 */
-(void) cancel;

/// Set factory code
/**
 * @param factory     [IN]    Factory code
 * @see Delegate: MPosDelegate::didSetDatetimeResp
 * @see setDatetime:factoryId:
 */
-(NSInteger)setFactoryCode: (NSInteger)fCode;

/// KEK download
/**
 * @param key       [IN]    KEK(40 bits), Format: key(32bits)+check value(8bits)
 * @param len       [IN]    Key type
 * @return int      <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didLoadKekResp:
 * @see loadMainKey:encryptMethod:keyIndex:keyLength:
 * @see loadWorkKey:macKey:trackKey:keyIndex:
 * @see setKeyIndex:
 */
-(NSInteger)loadKek: (NSString *)kek keyLength: (MFEU_KEY_LENGTH)len;

/// MasterKey download
/**
 * @param method    [IN]    Encrypt method
 * @param mainKey   [IN]    MasterKey(40 bits), Format: key(32bits)+check value(8bits)
 * @param index     [IN]    Key index
 * @param len       [IN]    Key type
 * @return int      <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didLoadMainKeyResp:
 * @see loadKek:keyLength:
 * @see loadWorkKey:macKey:trackKey:keyIndex:
 * @see setKeyIndex:
 */
-(NSInteger)loadMainKey: (NSString *)mainKey encryptMethod: (MFEU_ENCRYPT_METHOD)method keyIndex: (MFEU_KEY_INDEX)index keyLength: (MFEU_KEY_LENGTH)len;

-(NSInteger)loadMasterKey: (NSString *)mainKey keyIndex: (MFEU_KEY_INDEX)index keyLength: (MFEU_KEY_LENGTH)len;
/// WorkKey download
/**
 * @param workKey   [IN]    WorkKey(120bits, PIN+MAC+TRACK key)
 * @param index     [IN]    Key index
 * @param len       [IN]    Key type
 * @return int      <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didLoadWorkKeyResp:
 * @see loadKek:keyLength:
 * @see loadMainKey:encryptMethod:keyIndex:keyLength:
 * @see loadWorkKey:macKey:trackKey:keyIndex:
 * @see setKeyIndex:
 */
-(NSInteger)loadWorkKey: (NSString *)workKey keyIndex: (MFEU_KEY_INDEX)index keyLength: (MFEU_KEY_LENGTH)len;

/// WorkKey download
/**
 * @param pin       [IN]    pin key(40 bits), Format: key(32bits)+check value(8bits)
 * @param mac       [IN]    mac key(40 bits), Format: key(32bits)+check value(8bits)
 * @param track     [IN]    track key(40 bits), Format: key(32bits)+check value(8bits)
 * @param index     [IN]    Key index
 * @return int      <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didLoadWorkKeyResp:
 * @see loadKek:keyLength:
 * @see loadMainKey:encryptMethod:keyIndex:keyLength:
 * @see loadWorkKey:keyIndex:keyLength:
 * @see setKeyIndex:
 */
-(NSInteger)loadWorkKey: (NSString *)pin
                 macKey: (NSString *)mac
               trackKey: (NSString *)track
               keyIndex: (MFEU_KEY_INDEX)index;

/// WorkKey download
/**
 * @param key       [IN]    pin/mac/track key(40 bits), Format: key(32bits)+check value(8bits)
 * @param keyType   [IN]    Key type(pin or mac or track)
 * @param index     [IN]    Key index
 * @return int      <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didLoadWorkKeyExResp:
 * @see loadKek:keyLength:
 * @see loadMainKey:encryptMethod:keyIndex:keyLength:
 * @see loadWorkKey:keyIndex:keyLength:
 * @see setKeyIndex:
 */
-(NSInteger)loadWorkKeyEx: (NSString *)key
                  keyType: (MFEU_WKEY_TYPE)type
                 keyIndex: (MFEU_KEY_INDEX)index;
/// Key select
/**
 * @param index     [IN]    Key index
 * @return int      <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didSetKeyIndexResp:
 * @see loadKek:keyLength:
 * @see loadMainKey:encryptMethod:keyIndex:keyLength:
 * @see loadWorkKey:keyIndex:keyLength:
 * @see loadWorkKey:macKey:trackKey:keyIndex:
 */
-(NSInteger) setKeyIndex: (MFEU_KEY_INDEX)index;

/// Input PIN
/**
 * @param maxlen    [IN]    Maximum length of password
 * @param timeout   [IN]    Opertation timeout time
 * @param pan       [IN]    Card account number
 * @return int      <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didInputPinResp:pwdLength:pwdText:
 * @see calcMac:macAlg
 * @see pinEncrypt:maskedPAN
 */
-(NSInteger) inputPin: (NSInteger) maxlen timeOut: (NSInteger)timeout maskedPAN: (NSString *)pan;

/// MAC Calculate
/**
 * @param data      [IN]    Data to be calculated (ASC format)
 * @param macAlg    [IN]    MAC Algorithm
 * @return int      <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didCalcMacResp:
 * @see calcMac2:macAlg
 * @see inputPin:timeOut:maskedPAN
 * @see pinEncrypt:maskedPAN
 */
-(NSInteger) calcMac: (NSString *)data macAlg: (MFEU_MAC_ALG)macAlg;

/// MAC Calculate
/**
 * @param data      [IN]    Data to be calculated (ASC format)
 * @param macAlg    [IN]    MAC Algorithm
 * @return int      <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didCalcMacResp:
 * @see calcMac:macAlg
 * @see inputPin:timeOut:maskedPAN
 * @see pinEncrypt:maskedPAN
 */
-(NSInteger) calcMac2: (NSString *)data macAlg: (MFEU_MAC_ALG)macAlg;


/// PIN encrypt
/**
 * @param data      [IN]    Data to be encrypt (ASC format)
 * @param pan       [IN]    card number(<=19bits)
 * @return int      <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didCalcMacResp:
 * @see calcMac:macAlg
 * @see inputPin:timeOut:maskedPAN
 */
-(NSInteger) pinEncrypt: (NSString *)data maskedPAN: (NSString *)pan;


/// PIN encrypt
/**
 * @param type          [IN]    Algorithm type
 * @param exdata        [IN]    extern data
 * @param indata        [IN]    Data to be encrypt (ASC format)
 * @param pan           [IN]    card number(<=19bits)
 * @return int          <0, Bluetooth is not ready
 */
-(NSInteger) pinEncrypt2: (MFEU_PIN_ENCRYPT)type exData: (NSString *)exdata inData: (NSString *)indata maskedPAN: (NSString *)pan;

/// Open cardreader
/**
 * @param tradeDescript [IN]    Transaction type description
 * @param amount        [IN]    Transcation amount(Unit：fen)
 * @param timeout       [IN]    Timeout time
 * @param type          [IN]    Readcard type
 * @param msg           [IN]    Reserve field
 * @return int          <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didOpenCardResp:
 * @see readMagcard:panMask:
 * @see startEmv:otherAmount:tradeType:ecashTrade:pbocFlow:icOnline:
 * @see endEmv:
 */
-(NSInteger) openCardReader: (NSString *)tradeDescript aMount: (NSInteger)amount timeOut: (NSInteger) timeout readType: (MFEU_READCARD_TYPE)type showMsg: (NSString *)msg;


/// Read magcard
/**
 * @param mode      [IN]    Read data method
 * @param hide      [IN]    Show/hidden account number
 * @return int      <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didReadMagcardResp:maskedPAN:expiryDate:serivceCode:track2Length:track3Length:encTrack2:encTrack3:randomNumber:
 * @see openCardReader:aMount:timeOut:readType:showMsg:
 * @see inputPin:timeOut:maskedPAN:
 * @see pinEncrypt:maskedPAN:
 */
-(NSInteger) readMagcard: (MFEU_READCARD_MODE)mode panMask: (MFEU_READCARD_PANMASK)hide;

/// Clear IC public key
-(void) clearIcKey;

/// Add IC public key
/**
 * @param str       [IN]    Key data
 * @return int      <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didSetICKeyResp:totalCount:
 * @see clearIcKey
 * @see setIcKey:
 */
-(void) addIcKeyStr: (NSString *)str;

/// Set IC public keys
/**
 * @param data      [IN]    All IC public key
 * @return int      <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didSetICKeyResp:totalCount:
 * @see setIcAid:
 */
-(void) setIcKey: (NSArray *)dataArray;

/// Clean AID parameters
-(void) clearIcAid;

/// Add AID parameter
/**
 * @param str      [IN]    AID data
 * @return int      <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didSetICKeyResp:totalCount:
 * @see clearIcAid
 * @see setIcAid:
 */
-(void) addIcAidStr: (NSString *)str;

/// Set AID parameters
/**
 * @param data      [IN]    AID parameters
 * @return int      <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didSetAidResp:totalCount:
 * @see setIcKey:
 */
-(void) setIcAid: (NSArray *)dataArray;

/// Get PBOC EMV data
/**
 * @param data      [IN]    IC transaction tag list(ASC)
 * @return int      <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didGetEmvDataResp:beforeLength:randomNumber:
 * @see startEmv:otherAmount:tradeType:ecashTrade:pbocFlow:icOnline:
 * @see endEmv:
 * @see getICData
 * @see getEmvDataEx:
 * @see getEmvDataEx2:
 */
-(NSInteger) getEmvData: (NSString *)data;

/// Get PBOC EMV data
/**
 * @see Delegate: MPosDelegate::didGetICDataResp:maskedPAN:encTrack:expiryDate:
 * @see startEmv:otherAmount:tradeType:ecashTrade:pbocFlow:icOnline:
 * @see endEmv:
 * @see getEmvData:
 * @see getEmvDataEx:
 * @see getEmvDataEx2:
 **/
-(NSInteger) getICData;

/// Through tag to obtain EMV data, card number and other information is to obtain encrypted data through the getICData interface
/**
 * @param eTransType        [IN]    Transaction type
 * @return int              <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didGetEmvDataExResp:beforeLength:randomNumber:serialNumber:maskedPAN:encTrack:expiryDate:
 * @see startEmv:otherAmount:tradeType:ecashTrade:pbocFlow:icOnline:
 * @see endEmv:
 * @see getEmvData:
 * @see getICData:
 * @see getEmvDataEx2:
 */
-(NSInteger) getEmvDataEx: (MFEU_TRADE_TYPE)eTransType;

/// Through the tag to obtain EMV data, card number and other information, but also through tag to obtain unencrypted data
/**
 * @param eTransType        [IN]    Transaction type
 * @return int              <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didGetEmvDataExResp:beforeLength:randomNumber:serialNumber:maskedPAN:encTrack:expiryDate:
 * @see startEmv:otherAmount:tradeType:ecashTrade:pbocFlow:icOnline:
 * @see endEmv:
 * @see getEmvData:
 * @see getICData:
 * @see getEmvDataEx:
 */
-(NSInteger) getEmvDataEx2: (MFEU_TRADE_TYPE)eTransType;

/// Start PBOC EMV
/**
 * @param amount        [IN]    Authorization amount(Unit: fen)
 * @param omount        [IN]    Other amount(Unit: fen)
 * @param type          [IN]    Transaction type
 * @param ecash         [IN]    allow to eCash
 * @param pboc          [IN]    PBOC option
 * @param online        [IN]    allow to online
 * @return int          <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didStartEmvResp:pinReq:
 * @see getEmvData:
 * @see getICData:
 * @see getEmvData:
 * @see getEmvDataEx:
 * @see icDealOnline:onlineResult:
 * @see endEmv:
 */
-(NSInteger) startEmv: (NSInteger)amount otherAmount: (NSInteger)oamount tradeType: (MFEU_TRADE_TYPE)type ecashTrade: (MFEU_ECASH_TRADE)ecash pbocFlow: (MFEU_PBOC_FLOW)pboc icOnline: (MFEU_IC_ONLINE)online;


/// IC re-authorization
/**
 * @param data      [IN]    Transaction data(ASC)
 * @param result    [IN]    Online result
 * @return int      <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didIcDealOnlineResp:
 * @see startEmv:otherAmount:tradeType:ecashTrade:pbocFlow:icOnline:
 * @see endEmv:
 * @see getEmvData:
 * @see getICData:
 * @see getEmvData:
 * @see getEmvDataEx:
 */
-(NSInteger) icDealOnline: (NSString *)data onlineResult: (MFEU_ONLINE_RESULT)result;


/// End IC PBOC EMV
/**
 * @return int      <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didEndEmvResp
 * @see startEmv:otherAmount:tradeType:ecashTrade:pbocFlow:icOnline:
 * @see icDealOnline:onlineResult:
 * @see getEmvData:
 * @see getICData:
 * @see getEmvData:
 * @see getEmvDataEx:
 */
-(NSInteger) endEmv;

/// IC card power on
-(NSInteger) ICPoweron;

/// IC card power off
-(NSInteger) ICPoweroff;

/// RF card power on
-(NSInteger) RFPoweron;

/// RF card power off
-(NSInteger) RFPoweroff;

-(NSInteger) ICExchange: (NSString *)str;
-(NSInteger) RFExchange: (NSString *)str;

/// Read POS Information
/**
 * @return int          <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didReadPosInfoResp:status:battery:app_ver:data_ver:custom_info:
 * @see readPosInfoEx
 * @see setDatetime:factoryId:
 * @see setFactoryCode:
 */
-(NSInteger) readPosInfo;

/// Get a random number
/**
 * @return int          <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didGetRandNumResp:
 */
-(NSInteger) getRandomNum;


/// Set Merchant & Terminal number
/**
 * @param pszShop       [IN]    Merchant(<=15bits)
 * @param pszDevice     [IN]    Terminal(<=15bits)
 * @return int          <0, Bluetooth is not ready
 */
-(NSInteger) setMTCode: (NSString *)shop devId: (NSString *)devid;

/// Get Merchant & Terminal number
/**
 * @return int          <0, Bluetooth is not ready
 */
-(NSInteger) getMTCode;

/// Beep
/**
 * @param times     [IN]    Beep times
 * @param freq      [IN]    Beep frequency(Unit: hz)
 * @param duration  [IN]    Beep duration time(Unit: ms)
 * @param step      [IN]    Beep interval(Unit: ms)
 * @return int      <0, Bluetooth is not ready
 */
-(NSInteger) beep: (NSInteger)times freq: (NSInteger)freq duration: (NSInteger)duration step: (NSInteger) step;

/// Set datetime
/**
 * @param datetime  [IN]    Datetime(format: YYYYMMDDHHMMSS, 14bits)
 * @param factoryid [IN]    Factory code
 * @return int      <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didSetDatetimeResp
 * @see getDatetime
 */
-(NSInteger) setDatetime: (NSString *)datetime factoryId: (NSInteger)factoryid;

/// Get the MPOS datetime
/**
 * @return int      <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didGetDatetimeResp:
 * @see setDatetime:factoryId:
 */
-(NSInteger) getDatetime;

/// Cancel card operate
/**
 * @return int      <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didResetPosResp:
 * @see setDatetime:factoryId:
 * @see updatePos:
 */
-(NSInteger) resetPos;

/// Close device
/**
 * @param option    [IN]    Close option
 * @return int      <0, Bluetooth is not ready
 */
-(NSInteger) poweroffPos: (MFEU_CLOSE_ACTION)action;

/// Fireware updates
/**
 * @param pUpgradeFilename  [IN]    Update filename(include path)
 * @return int              <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didUpgradeResp:size:
 * @see setDatetime:factoryId:
 * @see resetPos
 */
-(NSInteger) updatePos: (NSString *)upgradeFilename;

/// Encrypt data
/**
 * @param data      [IN]
 * @param key       [IN]
 * @return int      <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didDataEncodeResp:
 */
-(NSInteger) dataEncode: (NSString *)data encryptKey: (NSString *)key;

/// Write data to MPOS
/**
 * @param data      [IN]    Write data(Maximum size 1K bytes)
 * @param method    [IN]    Clear or not
 * @return int      <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didDataWriteResp:
 * @see dataRead
 */
-(NSInteger) dataWrite: (NSString *)data clearFlag: (MFEU_DATA_WRITE)method;

/// Write data to MPOS
/**
 * @param data      [IN]    Write data(Maximum size 1K bytes)
 * @param start     [IN]    Data write location
 * @return int      <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didDataWriteResp:
 * @see dataRead
 */
-(NSInteger) dataWriteEx: (NSData *)data start: (NSInteger)pos;

/// Read data from MPOS
/**
 * @return int      <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didDataReadResp:
 * @see dataWrite:
 */
-(NSInteger) dataRead;

/// Read data from MPOS
/**
 * @param start     [IN]    Data read location
 * @param size      [IN]    read size
 * @return int      <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didDataReadResp:
 * @see dataWrite:
 */
-(NSInteger) dataReadEx: (NSInteger) start length: (NSInteger)size;

/// Read POS Information
/**
 * @return int      <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didReadPosInfoResp:status:battery:app_ver:data_ver:custom_info:
 * @see readPosInfo
 * @see setDatetime:factoryId:
 * @see setFactoryCode:
 */
-(NSInteger) readPosInfoEx;

/// Read KSN
/**
 * @return int      <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didGetKsnResp:psam:
 * @see readPosInfoEx
 */
-(NSInteger) getKsn;

/**
 * MPOS Trade Process
 *
 * @param cardType      Support card type
 * @param cardTimeout   Waiting timeout time(unit: second)
 * @param pszTradeType  Show message
 * @param pszMoney      Transaction amount(unit: fen)
 * @param tradeType     Transaction type
 * @param pboc          PBOC process instructions
 * @param ecash         allow to ecash
 * @param online        allow to online
 * @param pinreq        PIN input instructions
 * @param nPwdMaxLength Maximum length of password ( <=0x0C )
 * @param nPwdTimeout   Input password timeout time(unit: second)
 * @param failback      Enable/disable allowed to downgrade
 * @param flowNo        Serial number(Maxlength: 6)
 * @param orderNo       Order number(Maxlegnth: 20)
 * @param tagList       Custom tag list（default: nil）
 */
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

/**
* MPOS 交易处理（针对韩国的接口）
*
* @param cardType                       读卡模式
* @param cardTimeout                 读卡超时时间(1-255，单位：秒）
* @param tradeDes                       界面标题
* @param tradeAmt                       交易金额
* @param tradeType                      交易类型
* @param pbocFlow                      PBOC 流程指示
* @param ecashTrade                    是否支持电子现金
* @param onlineTrade                    强制联机标识
* @param pinReq                              PIN输入指示
* @param pwdMaxLength             密码的最大长度 <=0x0C
* @param pwdTimeout                  密码超时时间(1-255，单位：秒）
* @param enableFailback               是否允许降级
* @param lineMsg                           底部文本显示
* @param showCardNumber          是否返回卡号
*/
-(int) mPosTradeKorea: (MFEU_READCARD_TYPE) cardType
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
              lineMsg: (NSString *)lineMsg
       showCardNumber: (BOOL) isShowCardNumber
              tagList: (NSString *)tagList;

-(int) getDataParam: (MFEU_DATAPARAM) param;

-(int) setDataParam: (MFEU_DATAPARAM) param
          withValue: (NSString *)str;

-(int) getEmvResult;

-(int) inputAmount: (NSString *)msg
           timeout: (unsigned char) timeout;

-(int) inputNumber: (NSString *)msg
           timeout: (unsigned char) timeout
         maxLength: (unsigned char) length;

-(int) setDisplayText: (unsigned char)t text: (NSString *)text;

-(int) showQrcode: (NSString *)content
          timeout: (unsigned char) timeout;

#pragma mark - DUKPT interface
/// Load DUKPT key
/**
 * @param alg            [IN]    Key type
 * @param index        [IN]   Key index
 * @param key            [IN]   Key content(40bit)
 * @param ksn           [IN]   Default KSN(20bit)
 * @return int          <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didDukptLoadKeyResp:
 * @see dukptGetKey:withType
 * @see dukptGenKey
 * @see dukptDes:withOper:withMethod:withData
 */
-(int) dukptLoadKey: (MFEU_DUKPT_ALG)alg
          withIndex: (MFEU_KEY_INDEX)index
            withKey: (NSString *)key
            withKsn: (NSString*)ksn;

/// Get DUKPT key
/**
 * @param index        [IN]   Key index
 * @param type           [IN]  Key type(PIN/MAC/DATA)
 * @return int          <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didDukptGetKeyResp:
 * @see dukptLoadKey:withIndex:withKey:withKsn
 * @see dukptGenKey
 * @see dukptDes:withOper:withMethod:withData
 */
-(int) dukptGetKey: (MFEU_KEY_INDEX)index withType: (MFEU_DUKPT_TYPE)type;

/// Gen DUKPT key
/**
 *  This function will increase KSN(last 6bit add 1)
 * @param index        [IN]   Key index
 * @return int          <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didDukptGetKeyResp:
 * @see dukptLoadKey:withIndex:withKey:withKsn
 * @see dukptGetKey:withType
 * @see dukptDes:withOper:withMethod:withData
 */
-(int) dukptGenKey: (MFEU_KEY_INDEX)index;

/// Calc the DES of data value
/**
 * @param index        [IN]   Key index
 * @return int          <0, Bluetooth is not ready
 * @see Delegate: MPosDelegate::didDukptGetKeyResp:
 * @see dukptLoadKey:withIndex:withKey:withKsn
 * @see dukptGetKey:withType
 * @see dukptDes:withOper:withMethod:withData
 */
-(int) dukptDes: (MFEU_DUKPT_TYPE)type
       withOper: (MFEU_DUKPT_OPER)oper
     withMethod: (MFEU_DUKPT_METHOD)method
       withData: (NSString*)data;

@end

#pragma mark - protocol MPosDelegate
@protocol MPosDelegate <NSObject>

@optional

/// Error code when fail
/**
 * @param  errCode      Error code(see about MFEU_POS_RESULT)
 * @param  errorMessage Error description
 */
- (void)didError:(NSInteger)errorCode andMessage:(NSString *)errorMessage;

#pragma mark - Function delegate

/// Magnetic stripe swipe card detected
- (void)didWaitingForCardSwipe;

/// Cancel card operate
-(void) didReadCardCancel;

/// Operate card fail
/**
 * @param resp      return code
 */
-(void) didReadCardFail: (MFEU_MSR_OPENCARD_RESP) resp;

/// Insert IC card detected
- (void)didDetectIcc;

/// Insert RFIC card detected
- (void)didDetectRFIC;

/// Waitting IC read
- (void)didWaitingForICData;

/// Waitting for inputPin
-(void)didWaitingInputPin;

#pragma mark - BLE callback
/// Search for a Bluetooth device (every time a device is searched for it will be called back)
/**
 * @param  btDevice BLE name
 */
- (void)didFoundBtDevice:(NSString *)btDevice;

/// Stop Bluetooth search
-(void) didStopScanBtDevice;
/// Stop Bluetooth search
/**
 * @param  deviceArray          BLE devices list
 */
-(void) didStopScanBtDevice: (NSMutableArray *)deviceArray;

/// Connected a BLE device
/**
 * @param  devName      BLE name
 */
-(void) didConnected:(NSString *)devName;

/// Disconnected
-(void) didDisconnected;

/// Connect failure
-(void) didConnectFail;

#pragma mark - Audio reader callback

/// Audio insertion detected
-(void) didDevicePlugged;

/// Detected audio pull out
-(void) didDeviceUnplugged;

/// Audio interruption detected (eg: incoming call)
-(void) didInterrupted;

/////////////////////////////////////////////////////////////////////////////////////
#pragma mark - about communication delegate
/// Other return data
/**
 * @param sessionType           session type
 * @param responseCode          response code
 */
-(void) didSessionResponse: (MFEU_POS_SESSION) sessionType returnCode: (MFEU_POS_RESULT) responceCode;

/// Receive timeout
-(void) didTimeout;

/// Delegate: KEK download
/**
 * @param resp              Response code
 */
-(void) didLoadKekResp: (MFEU_MSR_RESP)resp;

/// MasterKey download
/**
 * @param resp              Response code
 */
-(void) didLoadMainKeyResp: (MFEU_MSR_RESP)resp;

/// WorkKey download
/**
 * @param resp              Response code
 */
-(void) didLoadWorkKeyResp: (MFEU_MSR_RESP)resp;
-(void) didLoadWorkKeyExResp: (MFEU_MSR_RESP)resp;

/// Set key index
/**
 * @param resp              Response code
 */
-(void) didSetKeyIndexResp: (MFEU_MSR_RESP)resp;

/// Calculate Mac data
/**
 * @param mac               return data(Format: ASC）
 * @param text              return data(Format: Plain text)
 */
-(void) didCalcMacResp: (NSString *)mac
                string: (NSString *)text
          randomNumber: (NSString *)randNumber
          randomNumstr: (NSString *)randNumstr;

/// Input Pin
/**
 * @param type              Press key type
 * @param len               Password length
 * @param text              Encrypted pinblock(Format: ASC)
 */
-(void) didInputPinResp: (MFEU_MSR_KEYTYPE) type pwdLength: (NSInteger) len pwdText: (NSString *)text;

/// Pin encrypt
/**
 * @param pin              return data(Format: BCD）
 */
-(void) didPinEncryptResp: (NSString *)pin;

/// Open card reader
/**
 * @param resp              Response code
 */
-(void) didOpenCardResp: (MFEU_MSR_OPENCARD_RESP)resp;

/// Read magic card read
/**
 * @param resp              Read result code
 * @param pan               Card account nuber
 * @param exdate            Card period of validity
 * @param sCode             Card service code
 * @param t2Size            Track 2 data length
 * @param t3Size            Track 3 data length
 * @param t2data            Track 2 data
 * @param t3data            Track 3 data
 * @param randNum           Random number
 **/

-(void) didReadMagcardResp: (MFEU_MSR_READCARD_RESP)resp maskedPAN: (NSString *)pan expiryDate: (NSString *)exdate serivceCode: (NSString *)sCode track2Length: (NSInteger)t2Size track3Length: (NSInteger)t3Size encTrack2: (NSString *)t2data encTrack3: (NSString *)t3data randomNumber: (NSString *)randNum;

/// Set IC public key
/**
 * @param index             Current position
 * @param total             Total item count
 */
-(void) didSetICKeyResp: (NSInteger)index totalCount: (NSInteger)total;

/// Set AID parameters
/**
 * @param index             Current position
 * @param total             Total item count
 */
-(void) didSetAidResp: (NSInteger)index totalCount: (NSInteger)total;

/// StartEmv
/*
 * @param resp              Response code
 * @param pinReq            Pin request
 */
-(void) didStartEmvResp: (MFEU_MSR_EMV_RESP)resp pinReq: (MFEU_MSR_EMV_PIN)req;

/// GetEmvData
/*
 * @param data              EMV data(Format: ASC)
 * @param randNum           Random number(Format: ASC)
 */
-(void) didGetEmvDataResp: (NSString *)data beforeLength: (NSInteger)length randomNumber: (NSString *)randNum;

/// GetICData
/*
 * @param serial            Card serail number(Format: ASC)
 * @param pan               Card account number
 * @param track             Track2 encrypt data(Format: ASC)
 * @param date              Card period of validity
 */
-(void) didGetICDataResp: (NSString *)serial maskedPAN: (NSString *)pan encTrack: (NSString *)track expiryDate: (NSString *)date;

/// GetEmvDataEx
/*
 * @param data55            EMV encrypt data(Format: ASC)
 * @param len55             EMV source data length
 * @param randNum           Random number(Format: ASC)
 * @param serial            Card serial number(Format: ASC)
 * @param pan               Card account number
 * @param track             Track2 encrypt data(Format: ASC)
 * @param date              Card period of validity
 */
-(void) didGetEmvDataExResp: (NSString *)data55 beforeLength: (NSInteger)len55 randomNumber: (NSString *)randNum serialNumber: (NSString *)serial maskedPAN: (NSString *)pan encTrack: (NSString *)track expiryDate: (NSString *)date;

/// IC re-authorization
/*
 * @param resp              Response code
 */
-(void) didIcDealOnlineResp: (MFEU_MSR_REAUTH_RESP) resp;

/// End EMV
-(void) didEndEmvResp;

/// IC/RF card power result
/**
 * @param resp          MFEU_MSR_RESP
 */
-(void) didCardPowerResp: (MFEU_MSR_RESP)resp;

/// IC/RF card exchange data
/**
 * @param str           IC/RF response data
 */
-(void) didCardExchangeResp: (NSString *)str;

/*! ReadPosInfo
 \param ksn             KSN number
 \param status          Device key status
 \param battery         Battery status
 \param app_ver         Application version
 \param data_ver        Data version
 \param custom_info     Custom infomation
 \param dev_model       Device model
 */
-(void) didReadPosInfoResp:(NSString *)ksn status: (MFEU_MSR_DEVSTAT)status battery: (MFEU_MSR_BATTERY)battery app_ver: (NSString *)app_ver data_ver: (NSString *)data_ver custom_info: (NSString *)custom_info dev_model:(NSString *)model;

/// Get a random number
/**
 * @param randNum       Random number(Format: ASC)
 **/
-(void) didGetRandNumResp: (NSString *)randNum;

-(void) didGetRandNumRespEx: (NSString *)randNum data: (NSData *)data;

/// Get the MPOS datetime
/**
 * @param datetime      Current datetime(Format:YYYYMMDDhhmmss)
 **/
-(void) didGetDatetimeResp: (NSString *)datetime;

/// Set Merchant & Terminal number
-(void) didSetParamResp;

/// Get Merchant & Terminal number
-(void) didGetParamResp: (NSString *)shop devId: (NSString *)devid;

/// Set datetime Response
-(void) didSetDatetimeResp;

/// Beep response
-(void) didBeepResp;

/// Reset response
/**
 * @param resp          Response code
 **/
-(void) didResetPosResp: (MFEU_MSR_RESP)resp;

/// Close Device
-(void) didCloseDeviceResp;

/// Fireware update
/**
 * @param pos       Current position
 * @param length    Total file size
 **/
-(void) didUpgradeResp: (NSInteger) pos size: (NSInteger) length;

/// Update finish
-(void) didUpgradeFinish;

/// Encrypt data
/**
 * @param data      Response data(Format: ASC)
 */
-(void) didDataEncodeResp: (NSString *)data;

/// Write data to MPOS
/**
 * @param resp      MFEU_MSR_RESP
 */
-(void) didDataWriteResp: (MFEU_MSR_RESP)resp;

/// Read data from MPOS
/**
 * @param resp      MFEU_MSR_RESP
 * @param data      Read data(ASC)
 * @param str       Read data(Plain text)
 */
-(void) didDataReadResp: (MFEU_MSR_RESP)resp data: (NSData *)data string: (NSString *)str;

/// Get KSN number
/**
 * @param serialNo      Serial number
 * @param psamNo        PSAM number
 */
-(void) didGetKsnResp: (NSString *)serialNo psam: (NSString *)psamNo;

/// Get card data
/**
 * @param dicResult      card list data
 */
-(void)didMPosTradeResult:(NSDictionary *)dicResult;

-(void)didInitParamResp;

-(void)didGetEmvResult:(NSDictionary *)dicResult;

-(void)didGetEmvResultResp:(NSString *)strResult;

/// Get input amount result
/**
 * @param resp                      Response code
 * @param info                      Input content
 */
-(void)didInputAmountResp:(MFEU_MSR_POSRESP)resp content:(NSString *)info;

/// Get input number result
/**
 * @param resp                      Response code
 * @param info                      Number value
 */
-(void)didInputNumberResp:(MFEU_MSR_POSRESP)resp content:(NSString *)info;

/// Get displayText  result
/**
 * @param resp                      Response code
 */
-(void)didDisplayTextResp: (MFEU_MSR_DISPRESP)ret;

/// Get show QRCode  result
/**
 * @param resp                      Response code
 */
-(void)didShowQrcodeResp:(MFEU_MSR_DISPRESP)resp;

/// Get waitkey  result
/**
 * @param key                        Return press key value
 */
-(void)didWaitKeyevent: (unsigned char)key;

#pragma mark - DUKPT Delegate
/// Get load key  result
/**
 * @param resp                        Response code
 * @param kvc                          Return key value check
 */
-(void) didDukptLoadKeyResp: (MFEU_MSR_RESP)resp
                    withKvc: (NSString *)kvc;

/// Get key & ksn
/**
 * @param key                        Key(40bit)
 * @param ksn                        Current KSN(20bit)
 */
-(void) didDukptGetKeyResp: (NSString *)key withKsn: (NSString *)ksn;

/// Gen key & ksn
/**
 * @param ksn                        Current KSN(20bit)
 */
-(void) didDukptGenKeyResp: (NSString *)ksn;

/// Calculate the DES value of the data
/**
 * @param result                    DES value of the data
 */
-(void) didDukptDesResp: (NSString *)result;

@end

