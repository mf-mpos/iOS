//
//  MainTableViewController.m
//  MPosClient
//
//  Created by 陈嘉祺 on 15/3/19.
//  Copyright (c) 2015年 MoreFun. All rights reserved.
//

#import "MainTableViewController.h"

#import "MLTableAlert/MLTableAlert.h"
//#import "ProgressHUD/ProgressHUD.h"
#import "SVProgressHUD/SVProgressHUD.h"

#import "../SDK/MPosController.h"

typedef enum {
    ACTION_UNKNOWN = 0,
    ACTION_TEST,
    ACTION_QUERY,
    ACTION_SALE,
    ACTION_ICDATA,
} MFEU_POS_ACTION;

typedef enum {
    MI_MPOS_TRADE = 0,      // MPOS交易
    MI_INPUTPIN,
    MI_EMV_RESULT,          // EMV数据
    MI_UNIPAY21FIELD,       // 获取21号文字段
    MI_FIELD59DATA,         // 获取59域内容
    MI_TRACKOPER,           // 磁道操作
    MI_READ_CARD,           // 读卡操作
    MI_CANCEL,              // 刷卡取消
    MI_CACLMAC,             // MAC计算
    MI_GETKSN,              // 获取KSN
    MI_PINENCRYPT,          // PIN加密
    MI_READPOSINFO,         // 读取设备信息
    MI_READPOSINFO_EX,      // 读取设备信息(扩展)
    MI_GETRANDOMNUM,        // 获取随机数
    MI_QRCODE,              // 显示二维码
    MI_LOADICKEY,           // IC卡公钥下载
    MI_LOADAIDPARAM,        // IC卡参数下载
    MI_LOADKEK,             // KEK下载
    MI_LOADMAINKEY,         // 主密钥下载
    MI_LOADWORKKEY,         // 工作密钥下载
    MI_ICDATA,              // APDU通讯
    MI_BEEP,                // BEEP
    MI_SETPARAM,            // 设置商终号
    MI_GETPARAM,            // 获取商终号
    MI_SETDATETIME,         // 设置时间
    MI_GETDATETIME,         // 获取当前时间
    MI_DATAENCODE,          // 数据加密
    MI_DATAWRITE,           // 自定义数据写入
    MI_DATAREAD,            // 自定义数据读取
    MI_UPDATEPOS,           // 升级
} MFEU_MENU_ITEM;

typedef enum {
    USE_UNKNOWN = 0,    // 未知
    USE_MARCARD,        // 使用磁条卡
    USE_IC,             // 使用IC卡
} EU_POS_CARDTYPE;

// 设置MPosDelegate代理
@interface MainTableViewController () <UIAlertViewDelegate, MPosDelegate>
{
    NSTimer *timer;
    NSMutableArray *m_arrayName;
    NSMutableArray *m_arrayUUID;
    
    MFEU_DRIVER_INTERFACE m_euDDI;
    MFEU_POS_ACTION m_euAction;
}

@property (strong, nonatomic) NSData *resultData;
@property (assign, nonatomic) unsigned int resultSize;

@property (strong, nonatomic) MLTableAlert *alert;

@property (nonatomic, strong) NSMutableArray *titleArray;
@property (nonatomic, strong) NSMutableArray *dataArray;

@property (strong, nonatomic) MPosController *posCtrl;

@property (assign, nonatomic) EU_POS_CARDTYPE cardType;
@property (assign, nonatomic) MFEU_MSR_EMV_PIN emvPinReq;

@end


@implementation MainTableViewController

@synthesize resultData;

@synthesize titleArray;
@synthesize dataArray;

/////////////////////////////////////////////////////////////////////////////////////////////////////////

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //PosLib_Test();
    
    //1：获取bundle Id信息：
    NSLog(@"bundleId: %@", [[NSBundle mainBundle] bundleIdentifier]);
    
    //2：获取版本号：
    NSLog(@"ShortVersion: %@", [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleShortVersionString"]);
    
    //3：获取build号：
    NSLog(@"Version: %@", [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleVersion"]);
    
    //4：获取App显示名：
    NSLog(@"BundleDisplayName: %@", [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleDisplayName"]);
    

    
    
    m_arrayName = [[NSMutableArray alloc] init];
    m_arrayUUID = [[NSMutableArray alloc] init];
    m_euAction = ACTION_UNKNOWN;
    
    self.titleArray = [[NSMutableArray alloc] initWithObjects:@"示例代码", @"接口测试", nil];
    
    NSMutableArray *dataArray1 = [[NSMutableArray alloc] initWithObjects: @"蓝牙连接", nil];
    NSMutableArray *dataArray2 = [[NSMutableArray alloc] initWithObjects:
                                  @"MPOS交易", @"密码输入", @"获取EMV数据", @"获取21号文字段", @"获取59域内容", @"磁道加解密"
                                  , @"读卡操作", @"刷卡取消", @"MAC计算", @"获取KSN", @"PIN加密"
                                  , @"获取设备信息", @"获取设备信息(扩展)", @"获取随机数", @"显示二维码"
                                  , @"IC公钥下载", @"IC参数下载", @"KEK下载", @"主密钥下载", @"工作密钥下载", @"APDU"
                                  , @"蜂鸣器", @"设置商终号", @"获取商终号", @"设置时间", @"获取时间", @"数据加密"
                                  , @"自定义数据写入", @"自定义数据读取"
                                  , @"升级", nil];

    self.dataArray = [[NSMutableArray alloc] initWithObjects:dataArray1, dataArray2, nil];
    
    // 初始化MPosController对象
    self.posCtrl = [MPosController sharedInstance];
    self.posCtrl.delegate = self;
    
    m_euDDI = MF_DDI_BLE;
    [self.posCtrl openBtDevice];
    
    [self setStatusText: @"设备未连接"];
    //[ProgressHUD dismiss];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNotification:)
                                                 name:SVProgressHUDWillAppearNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNotification:)
                                                 name:SVProgressHUDDidAppearNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNotification:)
                                                 name:SVProgressHUDWillDisappearNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNotification:)
                                                 name:SVProgressHUDDidDisappearNotification
                                               object:nil];
}

- (void)handleNotification:(NSNotification *)notif
{
    NSLog(@"Notification recieved: %@", notif.name);
    NSLog(@"Status user info key: %@", [notif.userInfo objectForKey:SVProgressHUDStatusUserInfoKey]);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [titleArray count];
}

// 每个section显示的标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return [self.titleArray objectAtIndex:section];
        case 1:
            return [self.titleArray objectAtIndex:section];
        default:
            return @"Unknown";
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.dataArray objectAtIndex:section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    // 初始化cell并指定其类型，也可自定义cell
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    [[cell textLabel] setText:[[self.dataArray objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]];
    return cell;
}

-(void) setDriverInterface
{
    UIAlertView * alter = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat: @"当前驱动：%@", (m_euDDI == MF_DDI_AUDIO) ? @"音频" : @"蓝牙"] message: @"请选择MPOS驱动类型" delegate:self cancelButtonTitle:@"蓝牙" otherButtonTitles: @"音频", nil];
    alter.tag = 200;
    [alter show];
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
-(void)scanBtDevice
{
    m_euDDI = MF_DDI_BLE;
    
    [m_arrayName removeAllObjects];
    [m_arrayUUID removeAllObjects];
    [SVProgressHUD showWithStatus:@"正在扫描设备"];
    [self.posCtrl scanBtDevice: 3];
}

-(void)openAudioDevice
{
    m_euDDI = MF_DDI_AUDIO;
    [self.posCtrl open];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //NSLog(@"%@: %@: %ld", __FUNCTION__, [alertView tag], buttonIndex);
    if ([alertView tag] == 100) {
        // refresh
        if (buttonIndex == 0) {
            if(m_euDDI == MF_DDI_BLE) {
                [self.posCtrl disconnectBtDevice];
            } else if (m_euDDI == MF_DDI_AUDIO) {
                [self.posCtrl close];
            }
        }
        return;
    }
    
    if ([alertView tag] == 200) {
        // set driver interface
        if (buttonIndex == 0) {
            // bt
            [self scanBtDevice];
        } else if (buttonIndex == 1) {
            // audio
            [self openAudioDevice];
        }
        return;
    }
}

-(IBAction)showAbout:(id)sender
{
    NSString *msg = [NSString stringWithFormat: @"MPOS SDK for IOS\nVersion: %@\n\nCopyRight @2015-2019 福建魔方电子科技有限公司"
                     , [self.posCtrl getVersion]];
    
    UIAlertView * alter = [[UIAlertView alloc] initWithTitle:@"关于APP" message: msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil, nil];

    [alter show];
}

-(void) devProcess {
    if ([self.posCtrl getDeviceState] == 1) {
        UIAlertView * alter = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat: @"当前驱动：%@", (m_euDDI == MF_DDI_AUDIO) ? @"音频" : @"蓝牙"] message: @"设备已经连接，确认要断开吗？" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: @"取消", nil];
        alter.tag = 100;
        [alter show];
    } else {
        if (m_euDDI == MF_DDI_BLE) {
            [self scanBtDevice];
        } else if (m_euDDI == MF_DDI_AUDIO) {
            [self alertMsg: @"请插入音频刷卡器，或者选择蓝牙驱动"];
        }
    }
}
-(IBAction)showTableAlert:(id)sender
{
    [self devProcess];
}

-(void)showTableAlert
{
    // create the alert
    self.alert = [MLTableAlert tableAlertWithTitle:@"请选择设备" cancelButtonTitle:@"取消"
                                      numberOfRows:^NSInteger (NSInteger section) {
                                          return [m_arrayName count];
                                      }
                                          andCells:^UITableViewCell* (MLTableAlert *anAlert, NSIndexPath *indexPath) {
                                              static NSString *CellIdentifier = @"CellIdentifier";
                                              UITableViewCell *cell = [anAlert.table dequeueReusableCellWithIdentifier:CellIdentifier];
                                              if (cell == nil)
                                                  cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                                              
                                              cell.textLabel.text = [NSString stringWithFormat:@"%@", [m_arrayName objectAtIndex: indexPath.row]];
                                              
                                              return cell;
                                          }];
    
    // Setting custom alert height
    self.alert.height = 300;
    
    // configure actions to perform
    [self.alert configureSelectionBlock:^(NSIndexPath *selectedIndex) {
        NSString *btDevice = [NSString stringWithFormat: @"%@,%@"
                              , [m_arrayName objectAtIndex: selectedIndex.row], [m_arrayUUID objectAtIndex: selectedIndex.row]];
        [self.posCtrl connectBtDevice: btDevice ];
        [SVProgressHUD showWithStatus: @"正在连接设备"];
    } andCompletionBlock:^{
        //self.navigationItem.title = @"Cancel Button Pressed\nNo Cells Selected";
    }];
    
    // show the alert
    [self.alert show];
    
}

-(void) setStatusText: (NSString *)text
{
    self.navigationItem.title = text;
}

-(NSString *)getStatusText
{
    return self.navigationItem.title;
}

-(void) traceMsg: (NSString *) msg
{
    NSLog(@"%@", msg);
}

-(void)alertMsg: (NSString *)msg
{
    [SVProgressHUD dismiss];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        // 更UI
        UIAlertView * alter = [[UIAlertView alloc] initWithTitle:@"提示" message: msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alter show];
    });
}

static MFEU_TRACK_OPER trackOper = MF_TRACK_ENCRYPT;
static NSString *trackData = @"6227001219000387264";
-(void)didTrackOperResp:(NSString *)data withString:(NSString *)string
{
    if (trackOper == MF_TRACK_ENCRYPT) {
        trackOper = MF_TRACK_DECRYPT;
        [self.posCtrl trackOper: trackOper withData:data];
    } else {
        trackOper = MF_TRACK_ENCRYPT;
        NSString *str = @"测试失败";
        if ([string isEqualToString:trackData]) {
            str = @"测试成功";
        }
        [self alertMsg: str];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ( ([self.posCtrl getDeviceState] < 1)
        && !(indexPath.section == 0 && indexPath.row == 0) )
    {
        UIAlertView * alter = [[UIAlertView alloc] initWithTitle:@"错误" message:@"非法设备连接，请重新选择设备" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alter show];
        return;
    }
    
    if (indexPath.section ==  0) {
        switch (indexPath.row) {
            case 0:
                [self devProcess];
                break;
            
            default:
                break;
        }
    } else if (indexPath.section == 1 ) {
        m_euAction = ACTION_TEST;
        switch (indexPath.row) {
            case MI_MPOS_TRADE:
                // MPOS交易
                [SVProgressHUD showWithStatus: @"请在MPOS操作进行交易"];
                
                [self.posCtrl mPosTradeEx: MF_READ_ALL
                   cardTimeout: 30
                      tradeDes: @"消费"
                      tradeAmt: 500
                     tradeType: MF_FUNC_SALE
                      pbocFlow: MF_PBOC_FULL
                    ecashTrade: MF_ECASH_FORBIT
                   onlineTrade: MF_ONLINE_YES
                        pinReq: MF_PINREQ_NO
                  pwdMaxLength: 12
                    pwdTimeout: 30
                enableFailback: MF_FAILBACK_NO
                        flowNo: @"123456"
                orderNo: @"ABCDEF123456"
                       tagList: nil];
                break;
            case MI_INPUTPIN:
                [SVProgressHUD showWithStatus: @"输入密码测试"];
                [self.posCtrl inputPin: 8 timeOut: 60 maskedPAN: @"6216911001370001"];
                break;
            case MI_EMV_RESULT:
                [self.posCtrl getEmvResult];
                break;
            case MI_READ_CARD:
                [self.posCtrl cardRead: 100 transType: MF_FUNC_SALE timeOutSecond: 15 isEncrypt: NO showMsg: nil transLogNo: nil];
                break;
                
            case MI_CANCEL:
                // 读磁条卡信息
                [SVProgressHUD showWithStatus: @"刷卡取消"];
                [self.posCtrl resetPos];
                break;

            case MI_CACLMAC:
                // MAC
                [SVProgressHUD showWithStatus: @"MAC计算测试"];
                [self.posCtrl calcMac: @"0200602404C020C098111962220241000152773810310000000000491202100012376222024100015277381D49121203549991545030315544385141533030303030323030303330383031313135365195A20DE6FF2A6226100000000000000012010000340000"
                               macAlg: MF_MACALG_UBC];
                break;
            case MI_GETKSN:
                [SVProgressHUD showWithStatus: @"获取KSN测试"];
                [self.posCtrl getKsn];
                break;
            case MI_READPOSINFO:
                // 获取设备信息
                [SVProgressHUD showWithStatus: @"获取设备信息测试"];
                [self.posCtrl readPosInfo];
                break;
            case MI_READPOSINFO_EX:
                // 获取设备信息
                [SVProgressHUD showWithStatus: @"获取设备信息(扩展)测试"];
                [self.posCtrl readPosInfoEx];
                break;
            case MI_GETRANDOMNUM:
                // 获取随机数
                [SVProgressHUD showWithStatus: @"获取随机数测试"];
                [self.posCtrl getRandomNum];
                break;
            case MI_QRCODE:
                [self.posCtrl showQrcode:@"MOREFUN" timeout: 30];
                break;
            case MI_PINENCRYPT:
                // PIN加密
                [SVProgressHUD showWithStatus: @"PIN加密"];
                [self.posCtrl pinEncrypt: @"123456" maskedPAN: @"6216911001370001"];
                break;
            
            case MI_TRACKOPER:
                [SVProgressHUD showWithStatus: @"磁道加解密测试"];
                
                [self.posCtrl trackOperData:trackOper withData:trackData];
                break;
            case MI_UNIPAY21FIELD:
                [SVProgressHUD showWithStatus: @"正在获取21号文字段"];
                
                [self.posCtrl getUnipay21field: @"6227001219000387264"];
                break;
                
            case MI_FIELD59DATA:
                [SVProgressHUD showWithStatus: @"正在获取59域数据"];
                
                [self.posCtrl getField59data: @"6227001219000387264"];
                break;

            case MI_LOADICKEY:
                // IC公钥下载
                [SVProgressHUD showWithStatus: @"IC公钥下载"];
                
                [self.posCtrl setIcKey: [NSArray arrayWithObjects:
                                         @"9F0605A0000003339F220102DF050420211231DF060101DF070101DF028190A3767ABD1B6AA69D7F3FBF28C092DE9ED1E658BA5F0909AF7A1CCD907373B7210FDEB16287BA8E78E1529F443976FD27F991EC67D95E5F4E96B127CAB2396A94D6E45CDA44CA4C4867570D6B07542F8D4BF9FF97975DB9891515E66F525D2B3CBEB6D662BFB6C3F338E93B02142BFC44173A3764C56AADD202075B26DC2F9F7D7AE74BD7D00FD05EE430032663D27A57DF040103DF031403BB335A8549A03B87AB089D006F60852E4B8060",
                                         @"9F0605A0000003339F220103DF050420221231DF060101DF070101DF0281B0B0627DEE87864F9C18C13B9A1F025448BF13C58380C91F4CEBA9F9BCB214FF8414E9B59D6ABA10F941C7331768F47B2127907D857FA39AAF8CE02045DD01619D689EE731C551159BE7EB2D51A372FF56B556E5CB2FDE36E23073A44CA215D6C26CA68847B388E39520E0026E62294B557D6470440CA0AEFC9438C923AEC9B2098D6D3A1AF5E8B1DE36F4B53040109D89B77CAFAF70C26C601ABDF59EEC0FDC8A99089140CD2E817E335175B03B7AA33DDF040103DF031487F0CD7C0E86F38F89A66F8C47071A8B88586F26",
                                         @"9F0605A0000003339F220104DF050420221231DF060101DF070101DF0281F8BC853E6B5365E89E7EE9317C94B02D0ABB0DBD91C05A224A2554AA29ED9FCB9D86EB9CCBB322A57811F86188AAC7351C72BD9EF196C5A01ACEF7A4EB0D2AD63D9E6AC2E7836547CB1595C68BCBAFD0F6728760F3A7CA7B97301B7E0220184EFC4F653008D93CE098C0D93B45201096D1ADFF4CF1F9FC02AF759DA27CD6DFD6D789B099F16F378B6100334E63F3D35F3251A5EC78693731F5233519CDB380F5AB8C0F02728E91D469ABD0EAE0D93B1CC66CE127B29C7D77441A49D09FCA5D6D9762FC74C31BB506C8BAE3C79AD6C2578775B95956B5370D1D0519E37906B384736233251E8F09AD79DFBE2C6ABFADAC8E4D8624318C27DAF1DF040103DF0314F527081CF371DD7E1FD4FA414A665036E0F5E6E5", nil]
                 ];
                break;
            case MI_LOADAIDPARAM:
                // IC参数下载
                [SVProgressHUD showWithStatus: @"IC参数下载"];
                [self.posCtrl setIcAid: [NSArray arrayWithObjects:
                                         @"9F0608A000000333010100DF0101009F08020020DF1105D84000A800DF1205D84004F800DF130500100000009F1B0400000000DF150400000000DF160199DF170199DF14039F3704DF180101",
                                         @"9F0608A000000333010101DF0101009F08020020DF1105D84000A800DF1205D84004F800DF130500100000009F1B0400000000DF150400000000DF160199DF170199DF14039F3704DF180101",
                                         @"9F0608A000000333010102DF0101009F08020020DF1105D84000A800DF1205D84004F800DF130500100000009F1B0400000000DF150400000000DF160199DF170199DF14039F3704DF180101",
                                         @"9F0608A000000333010103DF0101009F08020020DF1105D84000A800DF1205D84004F800DF130500100000009F1B0400000000DF150400000000DF160199DF170199DF14039F3704DF180101", nil]
                 ];
                break;
            case MI_LOADKEK:
                // KEK下载
                [SVProgressHUD showWithStatus: @"KEK下载"];
                
                [self.posCtrl loadKek: @"6dce0dc9006556a36dce0dc9006556a3d5d44ff7" keyLength: MF_LEN_DOUBLE];
                break;
            case MI_LOADMAINKEY:
                // 主密钥下载
                [SVProgressHUD showWithStatus: @"主密钥下载"];
                
                [self.posCtrl loadMainKey: @"DBA252378F078F9AAEA96CA709E3FB4F9B059E21"
                            encryptMethod: MF_ENCRYPT_KEK
                                 keyIndex: MF_KEY_IND_0
                                keyLength: MF_LEN_DOUBLE];
                break;
            case MI_LOADWORKKEY:
                // 工作密钥下载
                [SVProgressHUD showWithStatus: @"工作密钥下载"];
				
                //[self.posCtrl loadWorkKey: @"874B04C73DB3F50D81D064628839E3199DDF5CC4"
                //                   macKey: @"874B04C73DB3F50D81D064628839E3199DDF5CC4"
                //                 trackKey: @"874B04C73DB3F50D81D064628839E3199DDF5CC4"
                //                 keyIndex: MF_KEY_IND_0];
                [self.posCtrl loadWorkKey: @"DC2A58A83843D6BA16B945CDD30B34BC46E3EF6D"
                                   macKey: @"CD02000200000001CD0200020000000146E3EF6D"
                                 trackKey: @"874B04C73DB3F50D81D064628839E3199DDF5CC4"
                                 keyIndex: MF_KEY_IND_0];
                break;
            case MI_ICDATA:
                [self procICData];
                break;
            case MI_BEEP:
                // BEEP
                //[SVProgressHUD showWithStatus: @"获取蜂鸣器测试"];
                [self.posCtrl beep: 1 freq: 200 duration: 200 step: 200];
                break;
            case MI_SETPARAM:
                // 设置商终号
                [self.posCtrl setMTCode:@"123456789012345" devId:@"ABCDEFGH"];
                break;
            case MI_GETPARAM:
                // 获取商终号
                [self.posCtrl getMTCode];
                break;
            case MI_SETDATETIME:
                // 设置时间
                [SVProgressHUD showWithStatus: @"设置时间测试"];
                //SetDatetime("20150101123456");
                [self setCurrentDatetime];
                break;
            case MI_GETDATETIME:
                // 获取时间
                [SVProgressHUD showWithStatus: @"获取时间测试"];
                [self.posCtrl getDatetime];
                break;
            case MI_UPDATEPOS:
                // 升级
                [SVProgressHUD showWithStatus: @"升级测试"];
                [self.posCtrl updatePos: @"update.bin"];
                break;
            case MI_DATAWRITE:
                [self.posCtrl dataWrite: @"12345,AAA123456" clearFlag:MF_DATA_CLEAR];
                break;
            case MI_DATAREAD:
                [self.posCtrl dataRead];
                break;
            default:
                break;
        }
    }
    
}

-(void) setCurrentDatetime
{
    NSLog(@"set Current Datetime.");
    NSDateFormatter *formatter =[[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    NSString *currentTime = [formatter stringFromDate:[NSDate date]];
    
    [self.posCtrl setDatetime: currentTime factoryId: 0];
}

#pragma mark MPosDelegate

- (void)didFoundBtDevice:(NSString *)btDevice
{
    NSRange rrr = [btDevice rangeOfString: @","];
    if (rrr.length > 0) {
        NSString *name = [btDevice substringToIndex: rrr.location];
        NSString *uuid = [btDevice substringFromIndex: rrr.location + 1];
        
        //NSLog(@"[%s]%@:%@", __FUNCTION__, name, uuid);
        
        [m_arrayName addObject: name];
        [m_arrayUUID addObject: uuid];
    }
}

-(void) didStopScanBtDevice
{
    [SVProgressHUD dismiss];
    [self performSelectorOnMainThread:@selector(showTableAlert) withObject:nil waitUntilDone:NO];
}

- (void)didConnected:(NSString *)devName
{
    [SVProgressHUD dismiss];
    [self traceMsg: [NSString stringWithFormat: @"didConnected = %@", devName]];
    [self setStatusText: @"设备已连接"];
    // 设置接收超时时间
    [self.posCtrl setTimeout: 30];      // 此函数无回调接口
    [self.posCtrl setFactoryCode: 0];   // 默认为0,具体ID分配请与我们联系
    // *** 后续刷卡器操作，请在 didSetDatetimeResp 回调函数里执行 *** //
    // The end... //
}

//检测到音频插入
- (void)didDevicePlugged
{
    [self setStatusText: @"设备已连接"];
}

// 检测到音频拔出
- (void)didDeviceUnplugged
{
    [self setStatusText: @"设备未连接"];
}

// 检测到音频拔出
- (void)didDisconnected
{
    [self setStatusText: @"设备未连接"];
}

- (void)didInterrupted
{
    [self setStatusText: @"操作中断"];
    [self.posCtrl close];
}

-(void) didConnectFail
{
    [SVProgressHUD dismiss];
    [self alertMsg: @"设备连接失败"];
}

-(void) didTimeout
{
    [SVProgressHUD dismiss];
    [self alertMsg: @"指令接收超时"];
}

/// 下载KEK回调
-(void) didLoadKekResp: (MFEU_MSR_RESP)resp
{
    [self alertMsg: [NSString stringWithFormat: @"didLoadKekResp = %x", resp]];
}

/// 下载主密钥回调
-(void) didLoadMainKeyResp: (MFEU_MSR_RESP)resp
{
    [self alertMsg: [NSString stringWithFormat: @"didLoadMainKeyResp = %x", resp]];
}

/// 下载工作密钥回调
-(void) didLoadWorkKeyResp: (MFEU_MSR_RESP)resp
{
    [self alertMsg: [NSString stringWithFormat: @"didLoadWorkKeyResp = %x", resp]];
}

/// 密钥选择回调
-(void) didSetKeyIndexResp: (MFEU_MSR_RESP)resp
{
    [self alertMsg: [NSString stringWithFormat: @"didSetKeyIndexResp = %x", resp]];
}

/// 密码输入回调
-(void) didInputPinResp: (MFEU_MSR_KEYTYPE) type pwdLength: (NSInteger) len pwdText: (NSString *)text;
{
    if (m_euAction == ACTION_SALE) {
        if (self.cardType == USE_MARCARD) {
            // 磁条卡处理
            /**
             根据返回数据组8583包与POSP通讯, 此处省略...
             */
            [self alertMsg: @"IC卡片余额为：1000"];
        } else if (self.cardType == USE_IC) {
            // IC卡处理
            /*
             * 根据返回数据组8583包，此处省略，pData8583假定为数据包
             */
            
            // 联机操作后，最后要调用EndEmv();
            //[self.posCtrl endEmv];
        }
        return;
    }
    
    [self alertMsg: [NSString stringWithFormat: @"didInputPinResp type = %d\npwdLength = %d\n%@", (int)type, (int)len, text]];
}

/// CalcMac回调
-(void) didCalcMacResp:(NSString *)mac string:(NSString *)text randomNumber:(NSString *)randNumber randomNumstr:(NSString *)randNumstr
{
    [self alertMsg: [NSString stringWithFormat: @"didCalcMacResp = %@, %@\n%@, %@", mac, text, randNumber, randNumstr]];
}

/// 设置IC公钥回调
-(void) didSetICKeyResp: (NSInteger)index totalCount: (NSInteger)total
{
    [self traceMsg: [NSString stringWithFormat: @"didSetICKeyResp: %d/%d", (int)index, (int)total]];
    
    if (index < total) {
        [SVProgressHUD showWithStatus: [NSString stringWithFormat: @"IC卡公钥下载(%d / %d)", (int)index+1, (int)total]];
    } else {
        [self alertMsg: @"IC卡公钥下载完成"];
    }
}

/// 设置AID参数回调
-(void) didSetAidResp: (NSInteger)index totalCount: (NSInteger)total
{
    [self traceMsg: [NSString stringWithFormat: @"didSetAidResp: %d/%d", (int)index, (int)total]];
    
    if (index < total) {
        [SVProgressHUD showWithStatus: [NSString stringWithFormat: @"AID参数下载(%d / %d)", (int)index+1, (int)total]];
    } else {
        [self alertMsg: @"AID下载完成"];
    }
}

-(void) didIcDealOnlineResp: (MFEU_MSR_REAUTH_RESP) resp
{
    [self alertMsg: [NSString stringWithFormat: @"didIcDealOnlineResp = %x", resp]];
}
/*
-(void) didReadPosInfoResp:(NSString *)ksn status: (MFEU_MSR_DEVSTAT)status battery: (MFEU_MSR_BATTERY)battery app_ver: (NSString *)app_ver data_ver: (NSString *)data_ver custom_info: (NSString *)custom_info dev_model:(NSString *)model
{
    [self alertMsg: [NSString stringWithFormat: @"KSN: %@\n 电池等级: %d\n版本号: %@\n数据版本号: %@\n厂商自定义信息:\n%@设备型号: %@"
                     , ksn, battery, app_ver, data_ver, custom_info, model]];
}
*/
-(void) didReadPosInfoRespEx:(NSString *)ksn status: (MFEU_MSR_DEVSTAT)status battery: (MFEU_MSR_BATTERY)battery app_ver: (NSString *)app_ver data_ver: (NSString *)data_ver custom_info: (NSString *)custom_info dev_model:(NSString *)model card_option: (BOOL)card_option;
{
    [self alertMsg: [NSString stringWithFormat: @"KSN: %@\n 电池等级: %d\n版本号: %@\n数据版本号: %@\n厂商自定义信息:%@\n设备型号: %@\nCARD: %@"
                     , ksn, battery, app_ver, data_ver, custom_info, model, card_option ? @"auto" : @"default"]];
    
}

-(void) didGetRandNumResp: (NSString *)randNum
{
    [self alertMsg: [NSString stringWithFormat: @"didGetRandNumResp = %@", randNum]];
}

-(void) didSetDatetimeResp
{
    [self traceMsg: @"didSetDatetimeResp successly!"];
}

-(void) didGetDatetimeResp: (NSString *)datetime
{
    [self alertMsg: [NSString stringWithFormat: @"didGetDatetimeResp = %@", datetime]];
}

-(void) didResetPosResp: (MFEU_MSR_RESP)resp
{
    [SVProgressHUD dismiss];

    [self traceMsg: [NSString stringWithFormat: @"didResetPosResp = %x", resp]];
}

-(void) didUpgradeResp: (NSInteger) pos size: (NSInteger) length
{
    [SVProgressHUD showWithStatus: [NSString stringWithFormat: @"正在升级(%d / %d)", (int)pos, (int)length]];
}

-(void) didUpgradeFinish
{
    [self alertMsg: @"升级完成"];
}

-(void) didSetParamResp
{
    [self alertMsg: @"设置商终号成功"];
}

-(void) didGetParamResp:(NSString *)shop devId:(NSString *)devid
{
    [self alertMsg: [NSString stringWithFormat: @"didGetParamResp = %@, %@", shop, devid]];
}

-(void) didDataEncodeResp: (NSString *)data
{
    [self alertMsg: [NSString stringWithFormat: @"didDataEncodeResp = %@", data]];
}

-(void) didDataWriteResp: (MFEU_MSR_RESP)resp
{
    [self alertMsg: [NSString stringWithFormat: @"didDataWriteResp = %x", resp]];
}

-(void) didDataReadResp:(MFEU_MSR_RESP)resp data:(NSData *)data string:(NSString *)str
{
    [self alertMsg: [NSString stringWithFormat: @"didDataReadResp = %x\n%@,%@", resp, data, str]];
}

-(void) didGetKsnResp:(NSString *)serialNo psam:(NSString *)psamNo
{
    [self alertMsg: [NSString stringWithFormat: @"获取KSN成功.\n序列号: %@\nPSAM号: %@\n", serialNo, psamNo]];
}

- (void)didWaitingForCardSwipe
{
    [SVProgressHUD showWithStatus: @"请刷卡/插卡"];
}

/// 刷卡/插卡 取消
-(void) didReadCardCancel
{
    [self alertMsg: @"用户取消读卡"];
}

/// 刷卡/插卡 失败
/**
 * @param resp 错误代码
 */
-(void) didReadCardFail: (MFEU_MSR_OPENCARD_RESP) resp
{
    [self alertMsg: [NSString stringWithFormat: @"读卡失败(%d)", resp]];
}

/// 检测到插入IC卡
- (void)didDetectIcc
{
    [self traceMsg: @"didDetectIcc"];
    [SVProgressHUD showWithStatus: @"检测到插入IC卡"];
}

/// 等待IC读卡
- (void)didWaitingForICData
{
    [self traceMsg: @"didWaitingForICData"];
    [SVProgressHUD showWithStatus: @"正在读取IC卡数据"];
}

/// 等待输入密码
- (void)didWaitingInputPin
{
    [self traceMsg: @"didWaitingInputPin"];
    [SVProgressHUD showWithStatus: @"请在MPOS上输入密码"];
}

/*! 刷卡数据回调
 * @param cardType          读卡类型
 * @param maskedPAN         主账号
 * @param expiryDate        有效期
 * @param serviceCode       服务代码
 * @param track2Size        二磁道长度
 * @param track3Size        三磁道长度
 * @param track2data        二磁道数据
 * @param track3data        三磁道数据
 * @param randomNumber      随机数数据
 * @param serialNum         序列号
 * @param data55            ic刷卡 55域数据
 * @param otherInfo         保留，用以扩充其他字段
 \return 无
 */
- (void)didDecodeCompleted:(MFEU_CARD_TYPE)cardType
                 maskedPAN:(NSString *)maskedPAN
                expiryDate:(NSString *)expiryDate
               serviceCode:(NSString *)serviceCode
                track2Size:(int)track2Size
                track3Size:(int)track3Size
                track2Data:(NSString *)track2Data
                track3Data:(NSString *)track3Data
              randomNumber:(NSString *)randomNumber
                 serialNum:(NSString *)serialNum
                   iccData:(NSString *)data55
                 otherInfo:(NSDictionary *)otherInfo
{
    [ self traceMsg: [NSString stringWithFormat: @"didDecodeCompleted %d\n主账号: %@\n有效日期: %@\n服务代码: %@\n二磁道数据: %@\n三磁道数据: %@\n随机数: %@\n序列号: %@\n55域数据: %@\n", cardType, maskedPAN, expiryDate, serviceCode, track2Data, track3Data, randomNumber, serialNum, data55] ];
    [self alertMsg: @"操作成功"];
}

-(void)didMPosTradeResult:(NSDictionary *)dicResult
{
    [self traceMsg: [NSString stringWithFormat: @"didMPosTradeResult: %@", dicResult]];
    
    NSNumber *resp = [dicResult objectForKey: @"cardResp"];
    [self alertMsg: ([resp intValue] == 0) ? @"交易失败" : @"操作成功"];
}

-(void)didUnipay21FieldResp:(NSDictionary *)dicResult
{
    [self traceMsg: [NSString stringWithFormat: @"didUnipay21FieldResp: %@", dicResult]];
    
    NSString *str = [NSString stringWithFormat: @"TUSN: %@\n随机因子: %@\nSN密文: %@"
                     , [dicResult objectForKey: @"TUSN"]
                     , [dicResult objectForKey: @"randFactor"]
                     , [dicResult objectForKey: @"SNKey"]
                     ];
    [self alertMsg: str];
}

-(void)didGetField59dataResp:(NSString *)strResult withPI: (NSString *)PIResult
{
    [self traceMsg: [NSString stringWithFormat: @"didGetField59dataResp: %@", strResult]];
    [self alertMsg: [NSString stringWithFormat: @"didGetField59dataResp(%d): %@\n%@", (int)[strResult length], strResult, PIResult]];
}

-(void)didGetEmvResult:(NSDictionary *)dicResult
{
    [self traceMsg: [NSString stringWithFormat: @"didGetEmvResult: %@", dicResult]];
    //[self alertMsg: @"交易成功"];
}

-(void)didGetEmvResultResp:(NSString *)strResult
{
    //[self traceMsg: [NSString stringWithFormat: @"didGetEmvResultResp: %@", strResult]];
    [self alertMsg: [NSString stringWithFormat: @"返回结果：%@", strResult]];
}

-(void)procICData
{
    m_euAction = ACTION_ICDATA;
    [self.posCtrl ICPoweron];
}

-(void)didCardPowerResp:(MFEU_MSR_RESP)resp
{
    if (resp == MF_RESP_SUCC) {
        if (m_euAction == ACTION_ICDATA) {
            [self.posCtrl ICExchange: @"00A404000E325041592E5359532E444446303100"];
        }
    }
}
-(void)didCardExchangeResp:(NSString *)str
{
    if (m_euAction == ACTION_ICDATA) {
        [self.posCtrl ICPoweroff];
        m_euAction = ACTION_TEST;
        [self alertMsg: str];
    }
}

-(void)didShowQrcodeResp:(MFEU_MSR_DISPRESP)resp
{
    [self alertMsg: [NSString stringWithFormat: @"返回结果：%d", resp]];
}
@end
