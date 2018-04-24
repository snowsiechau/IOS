//
//  DetailViewController.h
//  UIView-UIViewController
//
//  Created by MAC on 4/24/18.
//  Copyright © 2018 com.SimiCart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@protocol passPassword <NSObject>
-(void) setPassword: (NSString*) password;
@end

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lbName;
- (IBAction)btChangePassword:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *tfCurrentPassword;
@property (weak, nonatomic) IBOutlet UITextField *tfNewPassword;
@property (weak, nonatomic) IBOutlet UITextField *tfConfirmPassword;
- (IBAction)btSave:(id)sender;

@property (retain) id<passPassword> delegate;
@property (nonatomic, strong) User *user;
@end
