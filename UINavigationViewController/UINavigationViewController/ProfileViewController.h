//
//  ProfileViewController.h
//  UINavigationViewController
//
//  Created by MAC on 5/2/18.
//  Copyright © 2018 com.SimiCart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileViewController.h"
#import "User.h"
@protocol passPassword <NSObject>
- (void) setPassword: (NSString*) password;
@end

@interface ProfileViewController : UIViewController

@property (nonatomic, strong) UILabel *lbName;
@property (nonatomic, strong) UITextField *tfCurrentPassword, *tfNewPassword, *tfConfirmPassword;
@property (nonatomic, strong) UIButton *btChangePassword, *btSave;

@property (retain) id<passPassword> delegate;
@property (nonatomic, strong) User *user;
@end
