# iOS
MPOS SDK for IOS

## Documentation
PDF file: [English](MPosController/MPOS-IOS-SDK_Programming_Manual.pdf) | [中文简体](zh-cn/MPOS-IOS-SDK接口说明.pdf)

Online Markdown: [English](doc/README.md) | [中文简体](doc/README-cn.md)

## Demo

-   [MPosControllerDemo](example) - a MPosController call interface demo.
-   Open MPosDemo.xcodeproj
-   Platform OS: MacOS + Xcode
-   Support device: Morefun MF60A / MP60 / MP63

## Project Settings
### Import SDK file
Import two parts: library file and header file. 

You need to add .a and .h files to the project file in the SDK directory.

### Linked Frameworks and library
-	CoreBluetooth.framework			Bluetooth framework support
-	Libstdc++.dylib  							  Standard C++ library dependencies
### Call flow
-	Initialization MPos Controller object
-	Turn on & connect device 
-	Call API interface
-	Gets the device interface to return the result data callback

**PS: Because the mobile phone and the card reader are one question and one answer communication, the terminal can only receive one instruction at a time. Therefore, you need to send several consecutive instructions in the business. Please call on the last instruction callback function.**

### Example

```objective-c
#import "../SDK/MPosController.h"
@interfaceMainTableViewController () <MPosDelegate>
{
}
@property (strong, nonatomic) MPosController *posCtrl;
@end

- (void)viewDidLoad
{
    [superviewDidLoad];
    // Initialization MPosController object
    self.posCtrl = [MPosControllersharedInstance];
    self.posCtrl.delegate = self;

	// Turn on BT device
	[self.posCtrl openBtDevice]; 
}

// Connected callback
- (void)didConnected:(NSString *)devName
{	
	// Be sure to set the manufacturer ID number after the connection (default is 0, specific ID allocation, please contact us)
    [self.posCtrl setFactoryCode: 0];
  	// *** Follow the swipe card operation, please execute it in the didSetDatetimeResp callback function *** //
    // The end... //
}

// Get Pos Information
-(void) getPosInfo
{
    [self.posCtrl readPosInfo];
}

// Get Pos information callback
-(void) didReadPosInfoResp:(NSString *)ksn status: (MFEU_MSR_DEVSTAT)status battery: (MFEU_MSR_BATTERY)battery app_ver: (NSString *)app_ver data_ver: (NSString *)data_ver custom_info: (NSString *)custom_info dev_model: (NSString *) model
{
    NSLog(@"KSN: %@\n Battery: %d\nAppVersion: %@\nDataVersion: %@\nCustom Info:\n%@\nDevice Model: %@", ksn, battery, app_ver, data_ver, custom_info, model);

  	// Calling subsequent interfaces...
  	// ....
}
```

