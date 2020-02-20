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
    MI_MPOS_TRADE = 0,      // MPOS Trade
    MI_DUKPT_LOADKEY,
    MI_DUKPT_GETKEY,
    MI_DUKPT_GENKEY,
    MI_DUKPT_DES,
    MI_CACLMAC,             // MAC Calculate
    MI_GETKSN,              // Get KSN
    MI_READPOSINFO,         // ReadPosInfo
    MI_GETRANDOMNUM,        // Get a randum number
    MI_PINENCRYPT,          // PIN encrypt
    //MI_LOADICKEY,           // Download IC public key
    //MI_LOADAIDPARAM,        // Download IC AIDs
    MI_LOADKEK,             // Download KEK
    MI_LOADMAINKEY,         // Download MasterKey
    MI_LOADWORKKEY,         // Download WorkKey
    MI_ICDATA,              // APDU test
    MI_BEEP,                // BEEP
    MI_SETDATETIME,         // Set datetime
    MI_GETDATETIME,         // Get datetime
    MI_SHOW_TEXT,
    MI_SHOW_QRCODE,         // Show QRCode
    //MI_DATAWRITE,           // Write data
    //MI_DATAREAD,            // Read data
    //MI_UPDATEPOS,           // Upgrade
} MFEU_MENU_ITEM;

// 设置MPosDelegate代理
@interface MainTableViewController () <UIAlertViewDelegate, MPosDelegate>
{
    NSTimer *timer;
    NSMutableArray *m_arrayName;
    NSMutableArray *m_arrayUUID;
    
    MFEU_DRIVER_INTERFACE m_euDDI;
    MFEU_POS_ACTION m_euAction;
}

@property (assign, nonatomic) MFEU_POS_SESSION sessionType;
@property (assign, nonatomic) MFEU_POS_RESULT responceCode;
@property (strong, nonatomic) NSData *resultData;
@property (assign, nonatomic) unsigned int resultSize;

@property (strong, nonatomic) MLTableAlert *alert;

@property (nonatomic, strong) NSMutableArray *titleArray;
@property (nonatomic, strong) NSMutableArray *dataArray;

@property (strong, nonatomic) MPosController *posCtrl;

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
    
    NSLog(@"bundleId: %@", [[NSBundle mainBundle] bundleIdentifier]);
    NSLog(@"ShortVersion: %@", [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleShortVersionString"]);
    NSLog(@"Version: %@", [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleVersion"]);
    NSLog(@"BundleDisplayName: %@", [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleDisplayName"]);
    
    m_arrayName = [[NSMutableArray alloc] init];
    m_arrayUUID = [[NSMutableArray alloc] init];
    m_euAction = ACTION_UNKNOWN;
    
    self.titleArray = [[NSMutableArray alloc] initWithObjects:@"Device", @"API", nil];
    
    NSMutableArray *dataArray1 = [[NSMutableArray alloc] initWithObjects: @"BLE Connect", nil];
    NSMutableArray *dataArray2 = [[NSMutableArray alloc] initWithObjects: @"MPOS Trade"
                                  , @"DUKPT LoadKey", @"DUKPT GetKey", @"DUKPT GenKey", @"DUKPT Des"
                                  , @"Calculate MAC", @"Get KSN", @"Get POS Infomation"
                                  , @"Get Random number", @"PIN encrypt"
                                  //, @"IC public key", @"IC AID"
                                  , @"Download KEK", @"Download MasterKey", @"Download WorkKey"
                                  , @"APDU"
                                  , @"Beep", @"Set datetime", @"Get datetime"
                                  , @"Display Text", @"Show QRCode"
                                  //, @"Write data", @"Read data", @"Fireware update"
                                  , nil];

    self.dataArray = [[NSMutableArray alloc] initWithObjects:dataArray1, dataArray2, nil];

    self.posCtrl = [MPosController sharedInstance];
    self.posCtrl.delegate = self;
    
    m_euDDI = MF_DDI_BLE;
    [self.posCtrl openBtDevice];
    
    [self setStatusText: @"No connect"];
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
    UIAlertView * alter = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat: @"Driver：%@", (m_euDDI == MF_DDI_AUDIO) ? @"Audio" : @"BLE"] message: @"Please select a driver:" delegate:self cancelButtonTitle:@"BLE" otherButtonTitles: @"Audio", nil];
    alter.tag = 200;
    [alter show];
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
-(void)scanBtDevice
{
    m_euDDI = MF_DDI_BLE;
    
    [m_arrayName removeAllObjects];
    [m_arrayUUID removeAllObjects];
    [SVProgressHUD showWithStatus:@"Searching..."];
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
    NSString *msg = [NSString stringWithFormat: @"MPOS SDK for IOS\nVersion: %@\n\nCopyRight @2015-2017 Fujian Morefun Electronic Technology Co., Ltd.", [self.posCtrl getVersion]];
    
    UIAlertView * alter = [[UIAlertView alloc] initWithTitle:@"About APP" message: msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil, nil];

    [alter show];
}

-(void) devProcess {
    if ([self.posCtrl getDeviceState] == 1) {
        UIAlertView * alter = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat: @"Driver：%@", (m_euDDI == MF_DDI_AUDIO) ? @"Audio" : @"BLE"] message: @"The device is connected. Are you sure you want to disconnect?" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: @"Cancel", nil];
        alter.tag = 100;
        [alter show];
    } else {
        if (m_euDDI == MF_DDI_BLE) {
            [self scanBtDevice];
        } else if (m_euDDI == MF_DDI_AUDIO) {
            [self alertMsg: @"Please insert reader."];
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
    self.alert = [MLTableAlert tableAlertWithTitle:@"Select device" cancelButtonTitle:@"Cancel"
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
        [SVProgressHUD showWithStatus: @"Connecting..."];
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
        UIAlertView * alter = [[UIAlertView alloc] initWithTitle:@"Infomation" message: msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alter show];
    });
    

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ( ([self.posCtrl getDeviceState] < 1)
        && !(indexPath.section == 0 && indexPath.row == 0) )
    {
        UIAlertView * alter = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Invalid device connection. Please re select the device" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alter show];
        return;
    }
    
    if (indexPath.section ==  0) {
        switch (indexPath.row) {
            case 0:
                //[self devProcess];
                //[self setDriverInterface];
                [self scanBtDevice];
                break;
            
            default:
                break;
        }
    } else if (indexPath.section == 1 ) {
        m_euAction = ACTION_TEST;
        switch (indexPath.row) {
            case MI_MPOS_TRADE:
                [SVProgressHUD showWithStatus: @"Please trade on the MPOS operation"];
                [self.posCtrl mPosTradeKorea:MF_READ_ALL
                                 cardTimeout:30
                                    tradeDes:@"Pay by Card"
                                    tradeAmt:500
                                   tradeType:MF_FUNC_SALE
                                    pbocFlow:MF_PBOC_FULL
                                  ecashTrade:MF_ECASH_FORBIT
                                 onlineTrade:MF_ONLINE_YES
                                      pinReq:MF_PINREQ_YES
                                pwdMaxLength:6
                                  pwdTimeout:30
                              enableFailback:MF_FAILBACK_NO
                                     lineMsg:@"LINE MESSAGE"
                              showCardNumber:YES
                                     tagList:nil
                 ];
                break;
            case MI_DUKPT_LOADKEY:
                [SVProgressHUD showWithStatus: @"Load DUKPT Key"];
                [self.posCtrl dukptLoadKey:MF_DUKPT_IPEK
                                 withIndex:MF_KEY_IND_0
                                   withKey:@"3B5E02AEF3A5CC0B74284C150F35F356"
                                   withKsn:@"99209876543210E00000"];
                break;
            case MI_DUKPT_GETKEY:
                [SVProgressHUD showWithStatus: @"Get DUKPT PEK"];
                [self.posCtrl dukptGetKey:MF_KEY_IND_0 withType:MF_DUKPT_DES_KEY_PEK];
                break;
            case MI_DUKPT_GENKEY:
                [SVProgressHUD showWithStatus: @"Gen key(add KSN)"];
                [self.posCtrl dukptGenKey:MF_KEY_IND_0];
                break;
            case MI_DUKPT_DES:
                [SVProgressHUD showWithStatus: @"Dukpt des data"];
                [self.posCtrl dukptDes:MF_DUKPT_DES_KEY_DATA1
                              withOper:MF_DUKPT_ENCRYPT
                            withMethod:MF_DUKPT_CBC
                              withData:@"1122334455667788"];
                break;
            case MI_CACLMAC:
                [SVProgressHUD showWithStatus: @"Calculate MAC"];
                [self.posCtrl calcMac2: @"0200602404C020C098111962220241000152773810310000000000491202100012376222024100015277381D49121203549991545030315544385141533030303030323030303330383031313135365195A20DE6FF2A6226100000000000000012010000340000"
                               macAlg: MF_MACALG_UBC];
                break;
            case MI_GETKSN:
                [SVProgressHUD showWithStatus: @"Get KSN"];
                [self.posCtrl getKsn];
                break;

            case MI_READPOSINFO:
                [SVProgressHUD showWithStatus: @"Get POS information"];
                [self.posCtrl readPosInfo];
                break;
            case MI_GETRANDOMNUM:
                [SVProgressHUD showWithStatus: @"Get Random number"];
                [self.posCtrl getRandomNum];
                break;
            case MI_PINENCRYPT:
                [SVProgressHUD showWithStatus: @"PIN encrypt"];
                [self.posCtrl pinEncrypt: @"123456" maskedPAN: @"6216911001370001"];
                break;
/*
            case MI_LOADICKEY:
                [SVProgressHUD showWithStatus: @"Download IC public key"];
                
                [self.posCtrl setIcKey: [NSArray arrayWithObjects:
                                         @"9F0605A0000003339F220102DF050420211231DF060101DF070101DF028190A3767ABD1B6AA69D7F3FBF28C092DE9ED1E658BA5F0909AF7A1CCD907373B7210FDEB16287BA8E78E1529F443976FD27F991EC67D95E5F4E96B127CAB2396A94D6E45CDA44CA4C4867570D6B07542F8D4BF9FF97975DB9891515E66F525D2B3CBEB6D662BFB6C3F338E93B02142BFC44173A3764C56AADD202075B26DC2F9F7D7AE74BD7D00FD05EE430032663D27A57DF040103DF031403BB335A8549A03B87AB089D006F60852E4B8060",
                                         @"9F0605A0000003339F220103DF050420221231DF060101DF070101DF0281B0B0627DEE87864F9C18C13B9A1F025448BF13C58380C91F4CEBA9F9BCB214FF8414E9B59D6ABA10F941C7331768F47B2127907D857FA39AAF8CE02045DD01619D689EE731C551159BE7EB2D51A372FF56B556E5CB2FDE36E23073A44CA215D6C26CA68847B388E39520E0026E62294B557D6470440CA0AEFC9438C923AEC9B2098D6D3A1AF5E8B1DE36F4B53040109D89B77CAFAF70C26C601ABDF59EEC0FDC8A99089140CD2E817E335175B03B7AA33DDF040103DF031487F0CD7C0E86F38F89A66F8C47071A8B88586F26",
                                         @"9F0605A0000003339F220104DF050420221231DF060101DF070101DF0281F8BC853E6B5365E89E7EE9317C94B02D0ABB0DBD91C05A224A2554AA29ED9FCB9D86EB9CCBB322A57811F86188AAC7351C72BD9EF196C5A01ACEF7A4EB0D2AD63D9E6AC2E7836547CB1595C68BCBAFD0F6728760F3A7CA7B97301B7E0220184EFC4F653008D93CE098C0D93B45201096D1ADFF4CF1F9FC02AF759DA27CD6DFD6D789B099F16F378B6100334E63F3D35F3251A5EC78693731F5233519CDB380F5AB8C0F02728E91D469ABD0EAE0D93B1CC66CE127B29C7D77441A49D09FCA5D6D9762FC74C31BB506C8BAE3C79AD6C2578775B95956B5370D1D0519E37906B384736233251E8F09AD79DFBE2C6ABFADAC8E4D8624318C27DAF1DF040103DF0314F527081CF371DD7E1FD4FA414A665036E0F5E6E5", nil]
                 ];
                break;
            case MI_LOADAIDPARAM:
                [SVProgressHUD showWithStatus: @"Download IC AID"];
                [self.posCtrl setIcAid: [NSArray arrayWithObjects:
                                         @"9F0608A000000333010100DF0101009F08020020DF1105D84000A800DF1205D84004F800DF130500100000009F1B0400000000DF150400000000DF160199DF170199DF14039F3704DF180101",
                                         @"9F0608A000000333010101DF0101009F08020020DF1105D84000A800DF1205D84004F800DF130500100000009F1B0400000000DF150400000000DF160199DF170199DF14039F3704DF180101",
                                         @"9F0608A000000333010102DF0101009F08020020DF1105D84000A800DF1205D84004F800DF130500100000009F1B0400000000DF150400000000DF160199DF170199DF14039F3704DF180101",
                                         @"9F0608A000000333010103DF0101009F08020020DF1105D84000A800DF1205D84004F800DF130500100000009F1B0400000000DF150400000000DF160199DF170199DF14039F3704DF180101", nil]
                 ];
                break;
*/
            case MI_LOADKEK:
                [SVProgressHUD showWithStatus: @"Download KEK"];
                
                [self.posCtrl loadKek: @"6dce0dc9006556a36dce0dc9006556a3d5d44ff7" keyLength: MF_LEN_DOUBLE];
                break;
            case MI_LOADMAINKEY:
                [SVProgressHUD showWithStatus: @"Download MasterKey"];
                
                [self.posCtrl loadMainKey: @"DBA252378F078F9AAEA96CA709E3FB4F9B059E21"
                            encryptMethod: MF_ENCRYPT_KEK
                                 keyIndex: MF_KEY_IND_0
                                keyLength: MF_LEN_DOUBLE];
                break;
            case MI_LOADWORKKEY:
                [SVProgressHUD showWithStatus: @"Download WorkKey"];

                [self.posCtrl loadWorkKey: @"DC2A58A83843D6BA16B945CDD30B34BC46E3EF6D"
                                   macKey: @"CD02000200000001CD0200020000000146E3EF6D"
                                 trackKey: @"874B04C73DB3F50D81D064628839E3199DDF5CC4"
                                 keyIndex: MF_KEY_IND_0];
                break;
            case MI_ICDATA:
                [self procICData];
                break;
            case MI_BEEP:
                [self.posCtrl beep: 1 freq: 200 duration: 200 step: 200];
                break;
            case MI_SETDATETIME:
                [SVProgressHUD showWithStatus: @"Set datetime"];
                [self setCurrentDatetime];
                break;
            case MI_GETDATETIME:
                [SVProgressHUD showWithStatus: @"Get datetime"];
                [self.posCtrl getDatetime];
                break;
            case MI_SHOW_TEXT:
                [self.posCtrl setDisplayText: 30 text: @"Welcome to CHINA."];
                break;
            case MI_SHOW_QRCODE:
                [self.posCtrl showQrcode:@"http://en.morefun-et.com" timeout:30];
                break;
/*
            case MI_UPDATEPOS:
                [SVProgressHUD showWithStatus: @"Fireware updates"];
                [self.posCtrl updatePos: @"update.bin"];
                break;
            case MI_DATAWRITE:
                [self.posCtrl dataWrite: @"12345,AAA123456" clearFlag:MF_DATA_CLEAR];
                break;
            case MI_DATAREAD:
                [self.posCtrl dataRead];
                break;
*/
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
    [self setStatusText: @"Connected"];

    [self.posCtrl setTimeout: 30];          // No has callback
    [self.posCtrl setFactoryCode: 0];      //
    // *** Follow the swipe card operation, please execute it in the didSetDatetimeResp callback function *** //
    // The end... //
}

- (void)didDevicePlugged
{
    [self setStatusText: @"Connected"];
}

- (void)didDeviceUnplugged
{
    [self setStatusText: @"No connect"];
}

- (void)didDisconnected
{
    [self setStatusText: @"No connect"];
}

- (void)didInterrupted
{
    [self.posCtrl close];
}

-(void) didConnectFail
{
    [SVProgressHUD dismiss];
    [self alertMsg: @"Connect failure."];
}

-(void) didTimeout
{
    [SVProgressHUD dismiss];
    [self alertMsg: @"Receive timeout."];
}

-(void) didSessionResponse: (MFEU_POS_SESSION) sessionType returnCode: (MFEU_POS_RESULT) responceCode
{
    [self traceMsg: [NSString stringWithFormat: @"sessionType: %d, responseCode: %d", sessionType, responceCode]];
}

-(void) didLoadKekResp: (MFEU_MSR_RESP)resp
{
    [self alertMsg: [NSString stringWithFormat: @"didLoadKekResp = %x", resp]];
}

-(void) didLoadMainKeyResp: (MFEU_MSR_RESP)resp
{
    [self alertMsg: [NSString stringWithFormat: @"didLoadMainKeyResp = %x", resp]];
}

-(void) didLoadWorkKeyResp: (MFEU_MSR_RESP)resp
{
    [self alertMsg: [NSString stringWithFormat: @"didLoadWorkKeyResp = %x", resp]];
}

-(void) didSetKeyIndexResp: (MFEU_MSR_RESP)resp
{
    [self alertMsg: [NSString stringWithFormat: @"didSetKeyIndexResp = %x", resp]];
}

-(void) didCalcMacResp:(NSString *)mac string:(NSString *)text randomNumber:(NSString *)randNumber randomNumstr:(NSString *)randNumstr
{
    [self alertMsg: [NSString stringWithFormat: @"didCalcMacResp = %@, %@\n%@, %@", mac, text, randNumber, randNumstr]];
}

-(void) didSetICKeyResp: (NSInteger)index totalCount: (NSInteger)total
{
    [self traceMsg: [NSString stringWithFormat: @"didSetICKeyResp: %d/%d", (int)index, (int)total]];
    
    if (index < total) {
        [SVProgressHUD showWithStatus: [NSString stringWithFormat: @"IC PublicKey(%d / %d)", (int)index+1, (int)total]];
    } else {
        [self alertMsg: @"Download IC PublicKey finish."];
    }
}

-(void) didSetAidResp: (NSInteger)index totalCount: (NSInteger)total
{
    [self traceMsg: [NSString stringWithFormat: @"didSetAidResp: %d/%d", (int)index, (int)total]];
    
    if (index < total) {
        [SVProgressHUD showWithStatus: [NSString stringWithFormat: @"IC AID(%d / %d)", (int)index+1, (int)total]];
    } else {
        [self alertMsg: @"Download IC AID finish."];
    }
}

-(void) didIcDealOnlineResp: (MFEU_MSR_REAUTH_RESP) resp
{
    [self alertMsg: [NSString stringWithFormat: @"didIcDealOnlineResp = %x", resp]];
}

-(void) didReadPosInfoResp:(NSString *)ksn status: (MFEU_MSR_DEVSTAT)status battery: (MFEU_MSR_BATTERY)battery app_ver: (NSString *)app_ver data_ver: (NSString *)data_ver custom_info: (NSString *)custom_info dev_model:(NSString *)model
{
    [self alertMsg: [NSString stringWithFormat: @"KSN: %@\n Battery: %d\nAppVer: %@\nDataVer: %@\nCustomInfo:\n%@DevModel: %@"
                     , ksn, battery, app_ver, data_ver, custom_info, model]];
}

-(void) didGetRandNumResp: (NSString *)randNum
{
    [self alertMsg: [NSString stringWithFormat: @"didGetRandNumResp = %@", randNum]];
}

-(void) didPinEncryptResp:(NSString *)pin
{
    [self alertMsg: [NSString stringWithFormat: @"didPinEncryptResp = %@", pin]];
}

-(void) didSetDatetimeResp
{
    [self alertMsg: @"didSetDatetimeResp successly!"];
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

-(void) didGetParamResp: (NSString *)shop devId: (NSString *)devid
{
    [self alertMsg: [NSString stringWithFormat: @"didGetParamResp = %@\n%@", shop, devid]];

}

-(void) didUpgradeResp: (NSInteger) pos size: (NSInteger) length
{
    [SVProgressHUD showWithStatus: [NSString stringWithFormat: @"Updating...(%d / %d)", (int)pos, (int)length]];
}

-(void) didUpgradeFinish
{
    [self alertMsg: @"Update finish"];
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
    [self alertMsg: [NSString stringWithFormat: @"didGetKsnResp.\nKSN: %@\nPSAM: %@\n", serialNo, psamNo]];
}

- (void)didWaitingForCardSwipe
{
    [SVProgressHUD showWithStatus: @"Please swipe card"];
}

/// User cancel
-(void) didReadCardCancel
{
    [self alertMsg: @"User cancelled"];
}

/// 刷卡/插卡 失败
/**
 * @param resp Error代码
 */
-(void) didReadCardFail: (MFEU_MSR_OPENCARD_RESP) resp
{
    [self alertMsg: [NSString stringWithFormat: @"Read card fail(%d)", resp]];
}

/// 检测到插入IC卡
- (void)didDetectIcc
{
    [self traceMsg: @"didDetectIcc"];
    [SVProgressHUD showWithStatus: @"Insert IC card detected"];
}

/// 等待IC读卡
- (void)didWaitingForICData
{
    [self traceMsg: @"didWaitingForICData"];
    [SVProgressHUD showWithStatus: @"Reading IC card data"];
}

/// 等待输入密码
- (void)didWaitingInputPin
{
    [self traceMsg: @"didWaitingInputPin"];
    [SVProgressHUD showWithStatus: @"Please enter a password on the MPOS"];
}

/*! 刷卡数据回调
 * @param isICCard          判断是否IC刷卡还是磁道刷卡
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
- (void)didDecodeCompleted:(BOOL) isICCard
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
    NSString *str = [NSString stringWithFormat: @"didDecodeCompleted %@\nPAN: %@\nexpiryDate: %@\nserviceCode: %@\nTrack2Data: %@\nTrack3Data: %@\nRandom Number: %@\nSN: %@\nEMV Data: %@\n", isICCard ? @"IC" : @"Magnetic", maskedPAN, expiryDate, serviceCode, track2Data, track3Data, randomNumber, serialNum, data55];
    
    [self traceMsg: str];
    [self alertMsg: str];
}

-(void)didMPosTradeResult:(NSDictionary *)dicResult
{
    [self traceMsg: [NSString stringWithFormat: @"didMPosTradeResult: %@", dicResult]];
    
    NSNumber *resp = [dicResult objectForKey: @"cardResp"];
    int ret = [resp intValue];
    if ( ret == MF_RESP_MPOSCARD_FINISH || ret == MF_RESP_MPOSCARD_INSERT || ret == MF_RESP_MPOSCARD_RFID) {
        [self alertMsg: @"Transaction successly."];
    } else {
        [self alertMsg: @"Transaction failure."];
    }
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
        [self alertMsg: [NSString stringWithFormat:@"APDU return: %@", str]];
    }
}

-(void)didInputAmountResp:(MFEU_MSR_POSRESP)resp content:(NSString *)info
{
    [self alertMsg: [NSString stringWithFormat:@"InputAmountResp: %d\n%@", resp, info]];
}

-(void)didInputNumberResp:(MFEU_MSR_POSRESP)resp content:(NSString *)info
{
    [self alertMsg: [NSString stringWithFormat:@"didInputNumberResp: %d\n%@", resp, info]];
}

-(void)didDisplayTextResp:(MFEU_MSR_DISPRESP)ret
{
    [self alertMsg: [NSString stringWithFormat:@"didDisplayTextResp: %d", ret]];
}

-(void)didShowQrcodeResp:(MFEU_MSR_DISPRESP)resp
{
    [self alertMsg: [NSString stringWithFormat:@"didShowQrcodeResp: %d", resp]];
}

-(void)didWaitKeyevent: (unsigned char)key
{
    [self alertMsg: [NSString stringWithFormat:@"didWaitKeyevent: %d", key]];
}

-(void) didDukptLoadKeyResp:(MFEU_MSR_RESP)resp withKvc:(NSString *)kvc
{
    [self alertMsg: [NSString stringWithFormat: @"DUKPT_DOWNLOAD = %x, kvc = %@",resp, kvc]];
}

-(void) didDukptGetKeyResp:(NSString *)key withKsn:(NSString *)ksn
{
    [self alertMsg: [NSString stringWithFormat: @"DUKPT_GETKEY = %@, KSN = %@", key, ksn]];
}

-(void) didDukptGenKeyResp:(NSString *)ksn
{
    [self alertMsg: [NSString stringWithFormat: @"DUKPT_GENKEY KSN = %@", ksn]];
}

-(void) didDukptDesResp:(NSString *)result
{
    [self alertMsg: [NSString stringWithFormat: @"DUKPT_DES = %@", result]];
}

@end
