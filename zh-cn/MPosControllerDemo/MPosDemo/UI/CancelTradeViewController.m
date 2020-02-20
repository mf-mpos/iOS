//
//  SaleTradeViewController.m
//  MPosClient
//
//  Created by 陈嘉祺 on 15/3/19.
//  Copyright (c) 2015年 MoreFun. All rights reserved.
//

#import "CancelTradeViewController.h"
#import "TSCurrencyTextField.h"
#import "ProgressHUD/ProgressHUD.h"

//#import "../../../SDK/MPos.h"

@interface CancelTradeViewController() <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtOrderid;

@end

@implementation CancelTradeViewController
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
    
    self.txtOrderid.text = @"000000";
    self.txtOrderid.keyboardType = UIKeyboardTypeNumberPad;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];

    return YES;
}

- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onSubmit:(id)sender
{
    NSNumber *txtInput = _currencyTextField.amount;
    NSLog(@"txtInput: %@", txtInput);
    
    //PosLib_CancelTrade(txtInput.floatValue * 100, [self.txtOrderid.text intValue]);
    
    [ProgressHUD show: @"请在POS进行刷卡操作"];
    
    // 返回上一级
    [self.navigationController popViewControllerAnimated:YES];
}


@end
