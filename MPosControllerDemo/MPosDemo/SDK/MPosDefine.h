//
//  MsrParam
//  MPosClient
//
//  Created by ChenJiaqi on 15/3/19.
//  Mail: chenjq@morefun-et.com
//  Copyright (c) 2015-2017 MoreFun. All rights reserved.
//

#ifndef ___MFPOS_DEFINE_H___
#define ___MFPOS_DEFINE_H___

typedef enum {
    MF_DDI_UNKNOWN = 0, //!< Unknown
    MF_DDI_BLE,         //!< BLE reader
    MF_DDI_AUDIO,       //!< Audio reader
} MFEU_DRIVER_INTERFACE;

// SESSION消息
typedef enum {
    MF_SESSION_UNKNOWN = 0,                //!> Unknown
    MF_SESSION_SCAN_START = 10,            //!> Start BT scan
    MF_SESSION_SCAN_STOP,                  //!> Stop BT scan
    MF_SESSION_SCAN_ONE,                   //!> Scanned a device
    MF_SESSION_CONN_FAIL,                  //!> connect failure
    MF_SESSION_CONN_VALID,                 //!> Connect valid device
    MF_SESSION_CONN_INVALID,               //!> Connect invalid device
    MF_SESSION_DISCONNECT,                 //!> Disconnect
    MF_SESSION_AUDIO_CONNECT,              //!> Audio connect
    MF_SESSION_AUDIO_DISCONNECT,           //!> Audio disconnect
    MF_SESSION_AUDIO_INTERRUPTED,          //!> Audo interrupted
    MF_SESSION_KEK_DOWNLOAD = 100,         //!> KEK download
    MF_SESSION_MKEY_DOWNLOAD,              //!> MasterKey download
    MF_SESSION_WKEY_DOWNLOAD,              //!> WorkKey download
    MF_SESSION_SELECT_PIN,                 //!> Key select
    MF_SESSION_INPUT_PIN,                  //!> Input PIN
    MF_SESSION_CALC_MAC,                   //!> MAC Calculate
    MF_SESSION_PIN_ENCRYPT,                //!> PIN encrypt
    MF_SESSION_PIN_ENCRYPT2,               //!> PIN encrypt2
    MF_SESSION_OPEN_CARD = 110,            //!> Open card reader
    MF_SESSION_READ_CARD,                  //!> Get magcard
    MF_SESSION_SET_ICKEY,                  //!> Set IC public key
    MF_SESSION_SET_AID,                    //!> Set AID parameter
    MF_SESSION_SET_ATTRIB,                 //!> Set trade attributive
    MF_SESSION_SET_DATA,                   //!> Set trade data
    MF_SESSION_START_EMV,                  //!> Start IC trade
    MF_SESSION_IC_REAUTH,                  //!> IC reauth
    MF_SESSION_END_EMV,                    //!> Stop IC trade
    MF_SESSION_GET_DEVINFO = 120,          //!> Read MPOS information
    MF_SESSION_GET_RANDNUM,                //!> Get a random number
    MF_SESSION_SET_PARAM,                  //!> Set Merchant & Termail number
    MF_SESSION_GET_PARAM,                  //!> Get Merchant & Termail number
    MF_SESSION_BEEP,                       //!> Beep
    MF_SESSION_SET_DATETIME,               //!> Set MPOS datetime
    MF_SESSION_GET_DATETIME,               //!> Get MPOS datetime
    MF_SESSION_RESET = 130,                //!> Cancel read card
    MF_SESSION_CLOSE_DEVICE,               //!> Close device
    MF_SESSION_UPGRADE,                    //!> Fireware updates
    MF_SESSION_DATA_ENCODE = 150,          //!> Encrypt data
    MF_SESSION_DATA_WRITE,                 //!> Write data to MPOS
    MF_SESSION_DATA_READ,                  //!> Read data from MPOS
    MF_SESSION_ICDATA,                     //!> Get IC data
    MF_SESSION_EMVDATA_EX,                 //!> Get IC data (8004)
    MF_SESSION_EMVDATA_EX2,                //!> Get IC data (从TAG中获取)
    MF_SESSION_JF_MAGCARD = 160,           //!> Get Magcard data (即JFPAY)
    MF_SESSION_JF_ICDATA,                  //!> Get IC data (JFPAY)
    MF_SESSION_JF_KSN,                     //!> Get KSN from MPOS
    MF_SESSION_GET_DEVINFO_EX,             //!> Get MPOS infomation（Ex）
    MF_SESSION_MPOS_TRADE,                 //!> MPOS trade
} MFEU_POS_SESSION;

/// 返回结果
typedef enum {
    MF_RET_NULL = 0,
    
    MF_RET_FAIL = -1,                   //!> Unknown
    MF_RET_FAIL_STX = -2,               //!> Field STX parse error
    MF_RET_FAIL_LEN = -3,               //!> Field LEN parse error
    MF_RET_FAIL_PATH = -4,              //!> Field PATH parse error
    MF_RET_FAIL_TYPE = -5,              //!> Field TYPE parse error
    MF_RET_FAIL_ID  = -6,               //!> Field ID dissimilarity
    MF_RET_FAIL_ETX = -7,               //!> Field ETX parse error
    MF_RET_FAIL_LRC = -8,               //!> Field LRC parse error
    // return code error
    MF_RET_FAIL_CMD = -11,              //!> Command not support
    MF_RET_FAIL_PARAM = -12,            //!> Parameter error
    MF_RET_FAIL_LENGTH = -13,           //!> Data size error
    MF_RET_FAIL_FORMAT = -14,           //!> Frame format error
    MF_RET_FAIL_GETLRC = -15,           //!> LRC error
    MF_RET_FAIL_OTHER = -16,            //!> Other error
    MF_RET_FAIL_TIMEOUT = -17,          //!> Timeout
    MF_RET_FAIL_STATUS = -18,           //!>
    MF_RET_FAIL_PACKAGE = -21,          //!> Recvice failure
    // reutrn package fail
    MF_RET_FAIL_WKEY = -100,           //!> Package fail
    MF_RET_FAIL_OPENCARD = -101,       //!>
    MF_RET_FAIL_SETICKEY = -102,       //!>
    MF_RET_FAIL_SETAID = -103,         //!>
    MF_RET_FAIL_ICCODE = -104,         //!>
    MF_RET_FAIL_ICDATA = -105,         //!>
    MF_RET_FAIL_EMV_START = -106,      //!>
    MF_RET_FAIL_EMV_END = -107,        //!>
    MF_RET_FAIL_GET_DEVINFO = -108,    //!>
    MF_RET_FAIL_SETPARAM = -109,
    MF_RET_FAIL_SETDATETIME = -110,    //!>
    MF_RET_FAIL_UPGRADE = -111,        //!>
    MF_RET_FAIL_PINENCRYPT = -112,     //!>
    MF_RET_FAIL_PINENCRYPT2 = -113,    //!>
   
    MF_RET_TIMEOUT = -200,              //!> Recvice Timeout
    MF_RET_VERSION_NULL = -201,         //!>
    MF_RET_VERSION_ERR = -202,          //!>
    MF_RET_FILE_NOT_FOUND = -203,       //!> Fireware file not found
    MF_RET_DEVICE_ERROR = -204,         //!>
    
    MF_RET_PACKAGE = 10,                //!> muti-message recvicing...
    MF_RET_USER_CANCEL = 20,            //!> User cancel
    
    MF_RET_RESULT = 99,                 //!> result response
    MF_RET_KEK_DOWNLOAD = 100,          //!> KEK download
    MF_RET_MKEY_DOWNLOAD,               //!> MasterKey download
    MF_RET_WKEY_DOWNLOAD,               //!> WorkKey download
    MF_RET_SELECT_KEY,                  //!> Key select
    MF_RET_INPUT_PIN,                   //!> Input PIN
    MF_RET_CALC_MAC,                    //!> MAC Calculate
    MF_RET_PIN_ENCRYPT,                 //!> PIN encrypt
    MF_RET_OPEN_CARD = 110,             //!> Open card reader
    MF_RET_READ_CARD,                   //!> 读磁条卡
    MF_RET_SET_ICKEY,                   //!> 设置IC公钥
    MF_RET_SET_AID,                     //!> 设置AID
    MF_RET_SET_ATTRIB,                  //!> 设置交易属性
    MF_RET_SET_DATA,                    //!> 设置交易数据
    MF_RET_START_EMV,                   //!> 开始IC交易流程
    MF_RET_IC_REAUTH,                   //!> IC二次授权
    MF_RET_END_EMV,                     //!> 结束IC交易流程
    MF_RET_GET_DEVINFO = 120,           //!> 读取设备信息
    MF_RET_GET_RANDNUM,                 //!> 获取随机数
    MF_RET_SET_PARAM,                   //!> 设置商终号
    MF_RET_GET_PARAM,                   //!> 读取商终号
    MF_RET_BEEP,                        //!> 蜂鸣器
    MF_RET_SET_DATETIME,                //!> 设置时间日期
    MF_RET_GET_DATETIME,                //!> 获取时间日期
    MF_RET_RESET = 130,                 //!> 取消/复位操作
    MF_RET_CLOSE_DEVICE,                //!> 关闭设备
    MF_RET_UPGRADE,                     //!> 升级应用/固件
    MF_RET_UPGRADE_FINISH,              //!> 升级结束
    MF_RET_VERSION,                     //!> 版本比较成功
    MF_RET_DATA_ENCODE = 150,           //!> 数据加密
    MF_RET_DATA_WRITE,                  //!> 自定义数据写入
    MF_RET_DATA_READ,                   //!> 自定义数据读取
    MF_RET_ICDATA,                      //!> 取IC卡数据
    MF_RET_JF_MAGCARD = 160,            //!> 读磁条卡(即富)
    MF_RET_JF_ICDATA,                   //!> 取IC卡交易数据(即富)
    MF_RET_JF_KSN,                      //!> 取KSN号(即富)
    MF_RET_GET_DEVINFO_EX,              //!> 读取设备信息（扩展）
    MF_RET_MPOS_TRADE,                  //!> MPOS交易处理
} MFEU_POS_RESULT;

/// 密钥长度
typedef enum {
    MF_LEN_SINGLE = 0x01,           //!< Haploid length
    MF_LEN_DOUBLE = 0x02,           //!< Double length
    MF_LEN_DOUBLEMAG = 0x03,        //!< Double & magcard track data
} MFEU_KEY_LENGTH;

/// 工作密钥类型
typedef enum {
    MF_WKEY_PIN = 0x01,             //!< PIN KEY
    MF_WKEY_MAC = 0x02,             //!< MAC KEY
    MF_WKEY_TRACK = 0x03,           //!< TRACK KEY
} MFEU_WKEY_TYPE;

/// 加密方式
typedef enum {
    MF_ENCRYPT_KEK = 0x00,          //!< KEK encrypt
    MF_ENCRYPT_MAINKEY = 0x01,      //!< encrypt self
    MF_ENCRYPT_PLAINTEXT = 0x02,    //!< plain text
    MF_ENCRYPT_C_FJPOSTAR = 0x03,   //!< PosStart mode
} MFEU_ENCRYPT_METHOD;

/// 密钥索引号
typedef enum {
    MF_KEY_IND_0 = 0x00,       //!< Index0
    MF_KEY_IND_1,              //!< Index1
    MF_KEY_IND_2,              //!< Index2
    MF_KEY_IND_3,              //!< Index3
    MF_KEY_IND_4,              //!< Index4
    MF_KEY_IND_5,              //!< Index5
    MF_KEY_IND_6,              //!< Index6
    MF_KEY_IND_7,              //!< Index7
    MF_KEY_IND_8,              //!< Index8
    MF_KEY_IND_9,              //!< Index9
} MFEU_KEY_INDEX;

/// MAC算法
typedef enum {
    MF_MACALG_UBC = 0x00,           //!< UBC
    MF_MACALG_X99,                  //!< X99/X919
    MF_MACALG_EBC,                  //!< EBC
    MF_MACALG_ENCRYPT_UPAY = 0x0A,  //!< UnionPay
    MF_MACALG_ENCRYPT_X99,          // X99
    MF_MACALG_ENCRYPT_X919,         // X919
    MF_MACALG_ENCRYPT_XOR           //!< XOR
} MFEU_MAC_ALG;

/// PIN Algorithm type
typedef enum {
    MF_PIN_ENCRYPT_TEXT = 0x00,    //!< PlainText
    MF_PIN_ENCRYPT_XOR,            //!< XOR
    MF_PIN_ENCRYPT_SNXOR,          //!< SN XOR
    MF_PIN_ENCRYPT_F1,             //!< FJPOSSTART
} MFEU_PIN_ENCRYPT;

/// MPOS response result
typedef enum{
    MF_MPOS_RESP_CANCEL = 0,            //!> UserCancel
    MF_MPOS_RESP_MAGTEK,                //!> Magnetic stripe card
    MF_MPOS_RESP_ICC,                   //!> IC card
    MF_MPOS_RESP_RFID,                  //!> RFID card
    MF_MPOS_RESP_FORCE_IC,              //!> Force IC card
    MF_MPOS_RESP_TIMEOVER,              //!> Swipt timeout
    MF_MPOS_RESP_CARD_FAIL,             //!> Fail
} MFEU_MPOS_RESP;

// Read card type
typedef enum {
    MF_READ_TRACK = 0x01,               //!< Read track information
    MF_IC_PRESENT = 0x02,               //!< Check IC present
    MF_COMBINED = (0x01 | 0x02),        //!< Check track + IC card
    MF_READ_RFID = 0x04,                //!< Check RFID
    MF_READ_ALL = (0x01 | 0x02 | 0x04)  //!< Check ALL
} MFEU_READCARD_TYPE;
    
// Read data method
typedef enum {
    MF_READ_TRACK_2 = 0x02,                     //!< Track2Data(Encrypt)
    MF_READ_TRACK_4 = 0x04,                     //!< Track3Data(Encrypt)
    MF_READ_TRACK_2_TEXT = 0x12,                //!< Track2Data(Plain Text)
    MF_READ_TRACK_4_TEXT = 0x14,                //!< Track3Data(Plain Text)
    MF_READ_TRACK_COMBINED = (0x02 | 0x04),     //!< Track 2&3 Data(Encrypt)
    MF_READ_TRACK_COMBINED_TEXT = (0x12 | 0x14) //!< Track 2&3 Data(Plain Text)
} MFEU_READCARD_MODE;
    
// Show/hidden account
typedef enum {
    MF_READ_NOMASK = 0x00,                      //!< Show account number
    MF_READ_MASK = 0x01,                        //!< Hidden account number
} MFEU_READCARD_PANMASK;

// IC public key
typedef enum {
    MF_IC_KEY_CLEARALL = 0x01,      //!< Clear all key
    MF_IC_KEY_ADD = 0x02,           //!< Add a key
    MF_IC_KEY_DEL = 0x03,           //!< Delete a key
    MF_IC_KEY_LIST = 0x04,          //!< Get key list
    MF_IC_KEY_READ = 0x05,          //!< Get a key
} MFEU_ICKEY_ACTION;

/// AID operation
typedef enum {
    MF_IC_AID_CLEARALL = 0x01,      //!< Clear all AID
    MF_IC_AID_ADD = 0x02,           //!< Add a AID
    MF_IC_AID_DEL = 0x03,           //!< Delete a AID
    MF_IC_AID_LIST = 0x04,          //!< Get AID list
    MF_IC_AID_READ = 0x05,          //!< Get a AID
} MFEU_ICAID_ACTION;
    
/// Electronic cash transaction indicator
typedef enum {
    MF_ECASH_FORBIT = 0x00,         //!< FORBIT
    MF_ECASH_PERMIT = 0x01,         //!< PERMIT
} MFEU_ECASH_TRADE;
    
/// PBOC process instructions
typedef enum {
    MF_PBOC_FULL = 0x06,           //!< Read Full data
    MF_PBOC_PART = 0x01,           //!< Read port data
} MFEU_PBOC_FLOW;

/// IC online
typedef enum {
    MF_ONLINE_NO = 0x00,           //!< Not Forced Online
    MF_ONLINE_YES = 0x01,          //!< Forced Online
} MFEU_IC_ONLINE;

/// Transaction type
typedef enum {
	MF_FUNC_BALANCE ,               //!< Balance query
	// Sale
	MF_FUNC_SALE,                   //!< Sale
	// pre-auth
	MF_FUNC_PREAUTH,				//!< pre-auth
	MF_FUNC_AUTHSALE,				//!< pre-auth request
	MF_FUNC_AUTHSALEOFF,			//!< pre-auth finish
	MF_FUNC_AUTHSETTLE,             //!< pre-auth settlement
	MF_FUNC_ADDTO_PREAUTH,			//!< pre-auth append
	// refund
	MF_FUNC_REFUND ,				//!< refund
	// undo
	MF_FUNC_VOID_SALE,              //!< undo sale
	MF_FUNC_VOID_AUTHSALE,			//!< undo pre-auth finish
	MF_FUNC_VOID_AUTHSETTLE,		//!< undo pre-auth settlement
	MF_FUNC_VOID_PREAUTH,			//!< undo pre-auth
	MF_FUNC_VOID_REFUND,			//!< undo refund
	// online
	MF_FUNC_OFFLINE,				//!< online settlement
	MF_FUNC_ADJUST,                 //!< Settlement adjustment
	// Electronic wallets
	MF_FUNC_EP_LOAD,				//!< EP transference
	MF_FUNC_EP_PURCHASE,			//!< EP PURCHASE
	MF_FUNC_CASH_EP_LOAD,			//!< Cash EP transference
	MF_FUNC_NOT_BIND_EP_LOAD,		//!< Non designated account transfer
	// Hire
	MF_FUNC_INSTALMENT,             //!< Hire purchase
	MF_FUNC_VOID_INSTALMENT,		//!< Undo hire
	//
	MF_FUNC_BONUS_IIS_SALE,         //!<
	MF_FUNC_VOID_BONUS_IIS_SALE,	//!<
	MF_FUNC_BONUS_ALLIANCE,         //!<
	MF_FUNC_VOID_BONUS_ALLIANCE,	//!<
	MF_FUNC_ALLIANCE_BALANCE,		//!<
	MF_FUNC_ALLIANCE_REFUND,		//!<
	MF_FUNC_INTEGRALSIGNIN,         //!<
	// ECASH
	MF_FUNC_QPBOC,					//!< Quick purchase
	MF_FUNC_EC_PURCHASE,			//!< ECash purchase
	MF_FUNC_EC_LOAD,				//!< ECash transference
	MF_FUNC_EC_LOAD_CASH,			//!< ECash transference cash
	MF_FUNC_EC_NOT_BIND_OUT,		//!< ECash not bind out
	MF_FUNC_EC_NOT_BIND_IN,         //!< ECash not bind in
	MF_FUNC_EC_VOID_LOAD_CASH,		//!< ECash undo cash
	MF_FUNC_EC_REFUND,				//!< ECash offline refund
	MF_FUNC_EC_BALANCE,             //!< ECash query
	// No card
	MF_FUNC_APPOINTMENT_SALE,		//!< Non card reservation consumption
	MF_FUNC_VOID_APPOINTMENT_SALE,	//!< Undo non card reservation consumption
	// Magnetic recharge
	MF_FUNC_MAG_LOAD_CASH,			//!< Magnetic stripe prepaid card cash recharge
	MF_FUNC_MAG_LOAD_ACCOUNT,		//!< Magnetic stripe prepaid card account recharge
	// Mobile chip
	MF_FUNC_PHONE_SALE,             //!<
	MF_FUNC_VOID_PHONE_SALE,		//!<
	MF_FUNC_REFUND_PHONE_SALE,		//!<
	MF_FUNC_PHONE_PREAUTH,			//!<
	MF_FUNC_VOID_PHONE_PREAUTH,     //!<
	MF_FUNC_PHONE_AUTHSALE,         //!<
	MF_FUNC_PHONE_AUTHSALEOFF,		//!<
	MF_FUNC_VOID_PHONE_AUTHSALE,	//!<
	MF_FUNC_PHONE_BALANCE,			//!<
	// ORDER
	MF_FUNC_ORDER_SALE,             //!<
	MF_FUNC_VOID_ORDER_SALE,		//!<
	MF_FUNC_ORDER_PREAUTH,			//!<
	MF_FUNC_VOID_ORDER_PREAUTH,     //!<
	MF_FUNC_ORDER_AUTHSALE,         //!<
	MF_FUNC_VOID_ORDER_AUTHSALE,	//!<
	MF_FUNC_ORDER_AUTHSALEOFF,		//!<
	MF_FUNC_ORDER_REFUND,			//!<
	// Other
	MF_FUNC_EMV_SCRIPE,             //!< EMV script notify
	MF_FUNC_EMV_REFUND,             //!< EMV offline refund
	MF_FUNC_PBOC_LOG,				//!< Read PBOC Log
	MF_FUNC_LOAD_LOG,				//!< Read log
	MF_FUNC_REVERSAL,				//!< Reversal operation
	MF_FUNC_TC,
	MF_FUNC_SETTLE,                 //!< SETTLEMENT
    MF_COUNTTRANSTYPECOUNT
} MFEU_TRADE_TYPE;

/// Online result
typedef enum  {
    MF_ONLINE_SUCC = 0x00,
    MF_ONLINE_FAIL = 0x01,
} MFEU_ONLINE_RESULT;

/// Close option
typedef enum {
    MF_CLOSE_POWEROFF = 0x01,           //!> Shutdown
    MF_CLOSE_SUSPEND = 0x02,            //!> Suspend
} MFEU_CLOSE_ACTION;

/// Update status
typedef enum {
    MF_UPREQ_START = 0X01,             //!> Update begin
    MF_UPREQ_DOING = 0x02,             //!> Updating
    MF_UPREQ_FINISH = 0x03,            //!> Update end
} MFEU_UPGRADE_REQ;

/// Response
typedef enum {
    MF_RESP_UNKNOWN = 0xFF,                //!> Unknown
    MF_RESP_SUCC = 0x00,                   //!> Succ
    MF_RESP_FAIL = 0x01,                   //!> Fail
} MFEU_MSR_RESP;

/// Response: Open cardreader
typedef enum {
    MF_RESP_MPOSCARD_UNKNOWN = 0xFF,       //!> Unknown
    MF_RESP_MPOSCARD_USERCANCEL = 0x00,    //!> UseCnacel
    MF_RESP_MPOSCARD_FINISH = 0x01,        //!> Swipe end
    MF_RESP_MPOSCARD_INSERT = 0x02,        //!> IC insert
    MF_RESP_MPOSCARD_RFID = 0x03,          //!> RF on
    MF_RESP_MPOSCARD_TIMEOVER = 0x04,      //!> Open timeout
    MF_RESP_MPOSCARD_CHECKERR = 0x05,      //!> Check error
} MFEU_MPOS_CARD_RESP;

/// Response: Open cardreader
typedef enum {
    MF_RESP_OPENCARD_UNKNOWN = 0xFF,       //!> Unknown
    MF_RESP_OPENCARD_USERCANCEL = 0x00,    //!> UseCnacel
    MF_RESP_OPENCARD_FINISH = 0x01,        //!> Swipe end
    MF_RESP_OPENCARD_INSERT = 0x02,        //!> IC insert
    MF_RESP_OPENCARD_RFID = 0x03,          //!> RF on
    MF_RESP_OPENCARD_ICFORCE = 0x04,       //!> Force IC card
    MF_RESP_OPENCARD_TIMEOVER = 0x05,      //!> Open timeout
    MF_RESP_OPENCARD_CHECKERR = 0x06,      //!> Check error
} MFEU_MSR_OPENCARD_RESP;

/// Response: Read card
typedef enum {
    MF_RESP_READCARD_SUCC = 0x00,
    MF_RESP_READCARD_FAIL = 0xFF,
} MFEU_MSR_READCARD_RESP;

/// EMV result
typedef enum {
    MF_RESP_EMV_SUCC = 0x00,          //!> Successly
    MF_RESP_EMV_ACCEPT = 0x01,        //!> Transaction acceptance
    MF_RESP_EMV_REJECT = 0x02,        //!> Transaction rejection
    MF_RESP_EMV_ONLINE = 0x03,        //!> Online
    MF_RESP_EMV_FAIL = 0xFF,          //!> Transaction failure
    MF_RESP_EMV_FALLBACK = 0xFE,      //!> Fallback
} MFEU_MSR_EMV_RESP;

/// EMV Reqeuset
typedef enum {
    MF_PIN_EMV_NOREQ = 0x00,          //!> No Request
    MF_PIN_EMV_REQ = 0x01,            //!> Requires subsequent processes to be entered online PIN
} MFEU_MSR_EMV_PIN;

/// Response: Reauth
typedef enum {
    MF_RESP_REAUTH_UNKNOWN = 0x00,         //!> Unknown
    MF_RESP_REAUTH_ACCEPT = 0x01,          //!> Transaction acceptance
    MF_RESP_REAUTH_GACAAC = 0x02,          //!> Transaction rejection
    MF_RESP_REAUTH_ONLINE = 0x03,          //!> Online
    MF_RESP_REAUTH_REJECT = 0x04,          //!>
    MF_RESP_REAUTH_FAIL = 0xFF,            //!> Transaction failure
} MFEU_MSR_REAUTH_RESP;

typedef enum {
    MF_DEVSTAT_DEFAULT = 0xFF,             //!> Default status
    MF_DEVSTAT_WKEYIN = 0x00,              //!> WorkKey downloaded
    MF_DEVSTAT_MKEYIN = 0x01,              //!> MasterKey downloaded
    MF_DEVSTAT_KEKMOD = 0x02,              //!> KEK updated
} MFEU_MSR_DEVSTAT;

typedef enum {
    MF_UPSTAT_BEGIN = 0x00,                //!> Update begin
    MF_UPSTAT_DOING = 0x00,                //!> Updating
    MF_UPSTAT_END = 0x01,                  //!> Update end
} MFEU_MSR_UPGRADE_STAT;

/// Key press
typedef enum {
    MF_KEYTYPE_OK = 0x00,                  //!< Press OK
    MF_KEYTYPE_CANCEL = 0x06,              //!< Press Cancel
} MFEU_MSR_KEYTYPE;

// Battery status
typedef enum {
    BATTERY_CAPACITY_UNKOWN = 0,                    //!> Unknown
    BATTERY_CAPACITY_CRITICAL,                      //!> Critical
    BATTERY_CAPACITY_LOW,                           //!> Low
    BATTERY_CAPACITY_NORMAL,                        //!> Normal
    BATTERY_CAPACITY_HIGH,                          //!> High
    BATTERY_CAPACITY_FULL,                          //!> Full
} MFEU_MSR_BATTERY;

/// Write data
typedef enum {
    MF_DATA_WRITE = 0x00,             //!> Direct write
    MF_DATA_CLEAR = 0x01,             //!> Write after clearing
} MFEU_DATA_WRITE;


/// PIN input
typedef enum {
    MF_PINREQ_NO = 0x00,                //!>
    MF_PINREQ_YES = 0x01,               //!>
} MFEU_PINREQ;

/// allowed to downgrade
typedef enum {
    MF_FAILBACK_NO = 0x00,              //!>
    MF_FAILBACK_YES = 0x01,             //!>
} MFEU_FAILBACK;

// MPOS trade confirm
typedef enum {
    MF_INFO_NONE = 0xFF,
    MF_INFO_CUSTOM = 0x00,                  //!< Custom content prompt
    MF_INFO_WAITCARD = 0x01,                //!< Waiting for credit card
    MF_INFO_READCARD = 0x02,                //!< Reading card
    MF_INFO_WAITPIN = 0x03,                 //!< Wait for the user to enter the password
} MFEU_MSR_INFO;

typedef enum {
    MF_PARAM_NONE = 0x00,
    MF_PARAM_TRMNNO,                    //!> Terminal number
    MF_PARAM_MERCHNO,                   //!> Merchant number
    MF_PARAM_BATCHNO,                   //!> Batch number
    MF_PARAM_FLOWNO,                    //!> Flow number
} MFEU_DATAPARAM;

typedef enum {
    MF_POSRESP_OK = 0x00,                  //!< Press OK
    MF_POSRESP_CANCEL = 0x01,              //!< Press Cancel
    MF_POSRESP_TIMEOUT = 0x02              //!< Timeout
} MFEU_MSR_POSRESP;

typedef enum {
    MF_DISPRESP_OK = 0x01,                  //!< Press OK
    MF_DISPRESP_CANCEL = 0x02,              //!< Press Cancel
    MF_DISPRESP_TIMEOUT = 0x03              //!< Timeout
} MFEU_MSR_DISPRESP;


typedef enum {
    MF_DUKPT_IPEK = 0x00,               //!> IPEK明文
    MF_DUKPT_BDK,                       //!> BDK明文
    MF_DUKPT_IPEK_ENC_KEK,              //!> IPEK密文
    MF_DUKPT_BHK_ENC_KEK,               //!> BDK密文
    MF_DUKPT_IPEK_ENC_MAK,              //!> IPEK密文
    MF_DUKPT_BHK_ENC_MAK,               //!> BDK密文
} MFEU_DUKPT_ALG;

typedef enum {
    MF_DUKPT_DES_KEY_PIN = 0x00,        //!> PIN
    MF_DUKPT_DES_KEY_MAC1,              //!> MAC1
    MF_DUKPT_DES_KEY_MAC2,              //!> MAC2
    MF_DUKPT_DES_KEY_DATA1,             //!> DATA1
    MF_DUKPT_DES_KEY_DATA2,             //!> DATA2
    MF_DUKPT_DES_KEY_PEK = 0x99         //!> PEK
} MFEU_DUKPT_TYPE;

typedef enum {
    MF_DUKPT_ENCRYPT = 0x00,            //!> 加密
    MF_DUKPT_DECRYPT,                   //!> 解密
} MFEU_DUKPT_OPER;

typedef enum {
    MF_DUKPT_ECB = 0x00,            //!> ECB
    MF_DUKPT_CBC,                   //!> CBC
} MFEU_DUKPT_METHOD;

////////////////////////////////////////////////////////////////////////////////////

#ifdef __cplusplus
extern "C"{
#endif
    
/// ASC => Hex
/** 0141212 ==> 0x20 0x14 0x12 0x12
 *	A string of no even lengths, justified by the left 0 and the right F
 *	@param pszBcdBuf          [INOUT]     HEX cache
 *	@param pszAsciiBuf        [IN]        ASC string
 *	@param nLen               [IN]        ASC length
 *	@param cType              [IN]        Output align(0－left  1－right)
 *	@return Fail return -1, else return convert length
 */
int MFPosAsc2Hex (unsigned char* pszBcdBuf, const unsigned char* pszAsciiBuf, int nLen, char cType);

/// HEX => ASC
/** 0x20 0x14 0x12 0x12 ==> 20141212
 * @param pszAsciiBuf         [INOUT]     ASC cache
 * @param pszBcdBuf           [IN]        Hex string
 * @param nLen                [IN]        Hex length
 * @param cType               [IN]        Output align(0－left  1－right)
 * @return Fail return -1, else return convert length
 *******************************************************************************/
int MFPosHex2Asc (unsigned char* pszAsciiBuf, const unsigned char* pszBcdBuf, int nLen, char cType);

#ifdef __cplusplus
}
#endif
        
#endif
