//
//  SignInViewController.h
//  Design
//
//  Created by MAC on 5/7/18.
//  Copyright © 2018 com.SimiCart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <TwitterKit/TWTRKit.h>

@import Firebase;
@import GoogleSignIn;
@import FirebaseFacebookAuthUI;

@interface SignInViewController : UIViewController <GIDSignInUIDelegate, GIDSignInDelegate>

@property (nonatomic, strong) UITextField *emailTextField, *passwordTextField;
@property (nonatomic, strong) UILabel *emailLabel, *passwordLabel;
@property (nonatomic, strong) UIButton *forgotPasswordButton, *signInButton, *signUpButton, *checkBoxButton;
@end
