//
//  ProfileViewController.m
//  UINavigationViewController
//
//  Created by MAC on 5/2/18.
//  Copyright © 2018 com.SimiCart. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _lbName = [[UILabel alloc]initWithFrame:CGRectMake(10, 80, 200, 40)];
    [_lbName setBackgroundColor:[UIColor clearColor]];
    [_lbName setText:_user.name];
    [[self view] addSubview:_lbName];
    
    _tfCurrentPassword = [[UITextField alloc] initWithFrame:CGRectMake(40, 200, 300, 30)];
    _tfCurrentPassword.placeholder = @"Current Password";
    _tfCurrentPassword.layer.borderColor=[[UIColor blackColor]CGColor];
    _tfCurrentPassword.layer.borderWidth= 1.0f;
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    _tfCurrentPassword.leftView = paddingView;
    _tfCurrentPassword.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_tfCurrentPassword];
    
    _tfNewPassword = [[UITextField alloc] initWithFrame:CGRectMake(40, 240, 300, 30)];
    _tfNewPassword.placeholder = @"New Password";
    _tfNewPassword.layer.borderColor=[[UIColor blackColor]CGColor];
    _tfNewPassword.layer.borderWidth= 1.0f;
    UIView *paddingView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    _tfNewPassword.leftView = paddingView1;
    _tfNewPassword.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_tfNewPassword];
    
    _tfConfirmPassword = [[UITextField alloc] initWithFrame:CGRectMake(40, 280, 300, 30)];
    _tfConfirmPassword.placeholder = @"Confirm Password";
    _tfConfirmPassword.layer.borderColor=[[UIColor blackColor]CGColor];
    _tfConfirmPassword.layer.borderWidth= 1.0f;
    UIView *paddingView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    _tfConfirmPassword.leftView = paddingView2;
    _tfConfirmPassword.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_tfConfirmPassword];
    
    [_tfCurrentPassword setHidden:YES];
    [_tfNewPassword setHidden:YES];
    [_tfConfirmPassword setHidden:YES];
    
     
    _btChangePassword = [UIButton buttonWithType:UIButtonTypeSystem];
    [_btChangePassword setTitle:@"Change password" forState:UIControlStateNormal];
    [_btChangePassword sizeToFit];
    _btChangePassword.center = CGPointMake(self.view.bounds.size.width/2, 150);
    [_btChangePassword addTarget:self action:@selector(setBtChangePassword:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btChangePassword];
    
    _btSave = [UIButton buttonWithType:UIButtonTypeSystem];
    [_btSave setTitle:@"Save" forState:UIControlStateNormal];
    [_btSave sizeToFit];
    _btSave.center = CGPointMake(self.view.bounds.size.width/2, 400);
    [_btSave addTarget:self action:@selector(setBtSave:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btSave];
}

- (void) setBtChangePassword:(UIButton *)btChangePassword{
    [_tfCurrentPassword setHidden:NO];
    [_tfNewPassword setHidden:NO];
    [_tfConfirmPassword setHidden:NO];
    
}

- (void)setBtSave:(UIButton *)btSave{
    if (![_tfCurrentPassword.text isEqualToString:_user.password]) {
        [self postAlert:@"Current password not true"];
    }else if (![_tfNewPassword.text isEqualToString:_tfConfirmPassword.text] || [_tfNewPassword.text isEqualToString:@""]) {
        [self postAlert:@"New password not true"];
    }else {
        _user.password = _tfConfirmPassword.text;
        [[self delegate] setPassword:_user.password];
        [self.navigationController popViewControllerAnimated:YES];
    }

}


- (void) postAlert: (NSString *) message {
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"Invalid"
                                message:message
                                preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *OKButton = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                   //Handle your yes please button action here
                               }];
    [alert addAction:OKButton];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
