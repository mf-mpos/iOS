//
//  SaleTradeViewController.m
//  MPosClient
//
//  Created by 陈嘉祺 on 15/3/19.
//  Copyright (c) 2015年 MoreFun. All rights reserved.
//

#import "SaleTradeViewController.h"
#import "TSCurrencyTextField.h"
//#import "SDK/mpos.h"
#import "ProgressHUD/ProgressHUD.h"

@implementation SaleTradeViewController
{
    IBOutlet TSCurrencyTextField*   _currencyTextField;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _currencyTextField.amount = @0.01;
    _currencyTextField.keyboardType = UIKeyboardTypeNumberPad;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)SaleTrade:(id)sender
{
    NSNumber *txtInput = _currencyTextField.amount;
    NSLog(@"txtInput: %@", txtInput);
    //PosLib_SaleTrade(txtInput.floatValue * 100);
    
    [ProgressHUD show: @"请在POS进行刷卡操作"];
    
    // 返回上一级
    [self.navigationController popViewControllerAnimated:YES];
}


@end
