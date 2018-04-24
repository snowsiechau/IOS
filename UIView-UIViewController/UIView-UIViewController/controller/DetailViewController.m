//
//  DetailViewController.m
//  UIView-UIViewController
//
//  Created by MAC on 4/24/18.
//  Copyright © 2018 com.SimiCart. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize user;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _lbName.text = user.name;
    
    [_tfCurrentPassword setHidden:YES];
    [_tfNewPassword setHidden:YES];
    [_tfConfirmPassword setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btChangePassword:(id)sender {
    [_tfCurrentPassword setHidden:NO];
    [_tfNewPassword setHidden:NO];
    [_tfConfirmPassword setHidden:NO];
}
- (IBAction)btSave:(id)sender {
    if (![_tfCurrentPassword.text isEqualToString:user.password]) {
        [self postAlert:@"Current password not true"];
    }else if (![_tfNewPassword.text isEqualToString:_tfConfirmPassword.text] || [_tfNewPassword.text isEqualToString:@""]) {
        [self postAlert:@"New password not true"];
    }else {
        user.password = _tfConfirmPassword.text;
        [[self delegate] setPassword:user.password];
        [self dismissViewControllerAnimated:YES completion:nil];
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
