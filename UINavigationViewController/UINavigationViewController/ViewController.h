//
//  ViewController.h
//  UINavigationViewController
//
//  Created by MAC on 5/2/18.
//  Copyright © 2018 com.SimiCart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "ProfileViewController.h"

@interface ViewController : UIViewController <passPassword>
@property (nonatomic, strong) UITextField *tfname, *tfPassword;
@property (nonatomic, strong) UIButton *button;

@property (nonatomic, strong) User *user;
@end

