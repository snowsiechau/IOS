//
//  ViewController.m
//  UIView-UIViewController
//
//  Created by MAC on 4/23/18.
//  Copyright © 2018 com.SimiCart. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize user;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btChangePassword:(id)sender {
    
    if ([_tfname.text isEqualToString:@""]) {
        [self postAlert:@"Invalid name"];
    } else if ([_tfPassworf.text isEqualToString:@""])
    {
        [self postAlert:@"Invalid password"];
    }
    else{
        DetailViewController *detial = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
        user = [[User alloc] init];
        user.name = _tfname.text;
        user.password = _tfPassworf.text;
        detial.user = user;
        [detial setDelegate:self];
        [self presentViewController:detial animated:YES completion:nil];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    _tfPassworf.text = user.password;
}

- (void)setPassword:(NSString *)password {
    user.password = password;
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
