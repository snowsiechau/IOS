//
//  ViewController.m
//  MVC
//
//  Created by MAC on 4/20/18.
//  Copyright © 2018 com.SimiCart. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize tfFirstName, tfLastName;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btShowName:(id)sender {
    
    Person *person = [[Person alloc] init];
    person.firstName = tfFirstName.text;
    person.lastName = tfLastName.text;
    
    NSString *fullname = [NSString stringWithFormat:@"%@ %@", person.firstName, person.lastName];
    
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Full Name"
                                 message:fullname
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"OK"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    //Handle your yes please button action here
                                }];
//
//    UIAlertAction* noButton = [UIAlertAction
//                               actionWithTitle:@"No, thanks"
//                               style:UIAlertActionStyleDefault
//                               handler:^(UIAlertAction * action) {
//                                   //Handle no, thanks button
//                               }];
//
    [alert addAction:yesButton];
//    [alert addAction:noButton];
//
    [self presentViewController:alert animated:YES completion:nil];
}

@end
