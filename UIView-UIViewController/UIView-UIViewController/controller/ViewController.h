//
//  ViewController.h
//  UIView-UIViewController
//
//  Created by MAC on 4/23/18.
//  Copyright © 2018 com.SimiCart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
#import "User.h"

@interface ViewController : UIViewController <passPassword>

@property (weak, nonatomic) IBOutlet UILabel *lbName;
@property (weak, nonatomic) IBOutlet UILabel *lbPassword;
@property (weak, nonatomic) IBOutlet UITextField *tfname;
@property (weak, nonatomic) IBOutlet UITextField *tfPassworf;
- (IBAction)btChangePassword:(id)sender;

@property (nonatomic, strong) User *user;


@end

