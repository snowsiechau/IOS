//
//  ViewController.m
//  UINavigationViewController
//
//  Created by MAC on 5/2/18.
//  Copyright © 2018 com.SimiCart. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSInteger *we;
}
@end

@implementation ViewController

@synthesize tfname, tfPassword, button, user;

- (void)viewDidLoad {
    [super viewDidLoad];
    
   // [self setTitle:@"Profile"];
    // Do any additional setup after loading the view, typically from a nib.
    button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Change password" forState:UIControlStateNormal];
    [button sizeToFit];
    button.center = CGPointMake(self.view.bounds.size.width/2, 200);
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    tfname = [[UITextField alloc] initWithFrame:CGRectMake(40, 100, 300, 30)];
    tfname.placeholder = @"Name";
    tfname.layer.borderColor=[[UIColor blackColor]CGColor];
    tfname.layer.borderWidth= 1.0f;
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    tfname.leftView = paddingView;
    tfname.leftViewMode = UITextFieldViewModeAlways;
    tfname.clearButtonMode = UITextFieldViewModeWhileEditing;
   // tfname.font = [UIFont fontWithName:@"Academy Engraved LET" size: 22.0f];
    [self.view addSubview:tfname];
    
    tfPassword = [[UITextField alloc] initWithFrame:CGRectMake(40, 140, 300, 30)];
    tfPassword.placeholder = @"Password";
    tfPassword.layer.borderColor = [[UIColor blackColor]CGColor];
    tfPassword.layer.borderWidth = 1.0f;
    UIView *paddingView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    tfPassword.leftView = paddingView1;
    tfPassword.leftViewMode = UITextFieldViewModeAlways;
    tfPassword.clearButtonMode = UITextFieldViewModeWhileEditing;
    tfPassword.secureTextEntry = YES;
    [self.view addSubview:tfPassword];
    
}

- (void) setPassword:(NSString*) password{
    user.password = password;
}

- (void)viewWillAppear:(BOOL)animated{
    tfPassword.text = user.password;
}

- (void) buttonPressed: (UIButton *) button{
    
    if ([tfname.text isEqualToString:@""]) {
        [self postAlert:@"Invalid name"];
    } else if ([tfPassword.text isEqualToString:@""])
    {
        [self postAlert:@"Invalid password"];
    }
    else{
        user = [[User alloc] init];
        user.name = tfname.text;
        user.password = tfPassword.text;
        ProfileViewController *profile = [[ProfileViewController alloc] init];
        profile.user = user;
        [profile setDelegate:self];
        [self.navigationController pushViewController:profile animated:YES];
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
