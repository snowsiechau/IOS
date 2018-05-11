//
//  SignInViewController.m
//  Design
//
//  Created by MAC on 5/7/18.
//  Copyright © 2018 com.SimiCart. All rights reserved.
//

#import "SignInViewController.h"
#import "WomenViewController.h"


@interface SignInViewController ()
{
    bool isChecked;
}

@end

@implementation SignInViewController

@synthesize emailLabel, passwordLabel, emailTextField, passwordTextField, signInButton, signUpButton, forgotPasswordButton, checkBoxButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    isChecked = NO;
    self.view.backgroundColor = [UIColor colorWithRed:(247.0f/255.0f) green:(247.0f/255.0f) blue:(247.0f/255.0f) alpha:1];
    double x = self.view.bounds.size.width;
    double y = self.view.bounds.size.height;
    
    self.navigationItem.title = @"Sign in";
    self.navigationController.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *marketBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"market"] style:UIBarButtonItemStylePlain target:self action:@selector(pressedMarketBarButtonItem:)];
    UIBarButtonItem *commentBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"comment"] style:UIBarButtonItemStylePlain target:self action:@selector(pressedCommentBarButtonItem:)];
    
    commentBarButtonItem.imageInsets = UIEdgeInsetsMake(0, 15, 0, 0);
    
    [marketBarButtonItem setTintColor:[UIColor blackColor]];
    [commentBarButtonItem setTintColor:[UIColor blackColor]];
    self.navigationItem.rightBarButtonItems = @[marketBarButtonItem, commentBarButtonItem];
    
    UIBarButtonItem *menuBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(pressedMenuBarButtonItem:)];
    [menuBarButtonItem setTintColor:[UIColor blackColor]];
    self.navigationItem.leftBarButtonItem = menuBarButtonItem;
    
    emailLabel = [[UILabel alloc] initWithFrame:CGRectMake(x/10, y/8, x/1.5, y/15)];
    [emailLabel setText:@"Email"];
    [self.view addSubview:emailLabel];
    
    emailTextField = [[UITextField alloc] initWithFrame:CGRectMake(x/10, (y/8 + y/17), x/1.25, y/17)];
    emailTextField.placeholder = @"Test@.simicart";
    emailTextField.backgroundColor = [UIColor whiteColor];
    UIView *paddingEmailView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    emailTextField.leftView = paddingEmailView;
    emailTextField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview: emailTextField];
    
    passwordLabel = [[UILabel alloc] initWithFrame:CGRectMake(x/10, (y/8 + 2*y/17), x/1.5, y/15)];
    [passwordLabel setText:@"Password"];
    [self.view addSubview:passwordLabel];
    
    passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(x/10, (y/8 + 3*y/17), x/1.25, y/17)];
    passwordTextField.placeholder = @"Password";
    passwordTextField.backgroundColor = [UIColor whiteColor];
    UIView *paddingPasswordView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    passwordTextField.leftView = paddingPasswordView;
    passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    passwordTextField.secureTextEntry = YES;
    [self.view addSubview: passwordTextField];
    
    checkBoxButton = [[UIButton alloc] initWithFrame:CGRectMake(x/10, (y/8 + 4.6*y/17), 16, 16)];
    [checkBoxButton setBackgroundImage:[UIImage imageNamed:@"uncheckbox"] forState:UIControlStateNormal];
    [checkBoxButton setBackgroundImage:[UIImage imageNamed:@"checkbox"] forState:UIControlStateSelected];
    [checkBoxButton setBackgroundImage:[UIImage imageNamed:@"checkbox"] forState:UIControlStateHighlighted];
    checkBoxButton.adjustsImageWhenHighlighted = YES;
    [checkBoxButton addTarget:self action:@selector(pressCheckBox:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:checkBoxButton];
    
    UILabel *rememberMeLabel = [[UILabel alloc] initWithFrame:CGRectMake((x/10 + x/18), (y/8 + 4.55*y/17), 100, y/14)];
    [rememberMeLabel setText:@"Remember me"];
    [rememberMeLabel sizeToFit];
    [self.view addSubview:rememberMeLabel];
    
    forgotPasswordButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [forgotPasswordButton setTitle:@"Forgot password?" forState:UIControlStateNormal];
    [forgotPasswordButton sizeToFit];
    forgotPasswordButton.center = CGPointMake((x/10 + x/1.6), (y/8 + 4.8*y/17));
    [forgotPasswordButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.view addSubview:forgotPasswordButton];
    
    signInButton = [[UIButton alloc] initWithFrame:CGRectMake(x/10, (y/2 - y/25), x/1.25, y/15)];
    [signInButton setTitle:@"SIGN IN" forState:UIControlStateNormal];
    [signInButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    signInButton.backgroundColor = [UIColor orangeColor];
    signInButton.layer.cornerRadius = 20;
    signInButton.clipsToBounds = YES;
    signInButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    [signInButton addTarget:self action:@selector(pressedSignInButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signInButton];
    
    UILabel *orLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2 - 10, (y/2 - y/25 + y/13), 40, 40)];
    [orLabel setText:@"Or"];
    [self.view addSubview:orLabel];
    
    UIView *lineView1 = [[UIView alloc] initWithFrame:CGRectMake(x/10, (y/2 - y/25 + y/9.5), x/3, 1)];
    lineView1.backgroundColor = [UIColor blackColor];
    UIView *lineView2 = [[UIView alloc] initWithFrame:CGRectMake((x - x/10 - x/3), (y/2 - y/25 + y/9.5), x/3, 1)];
    lineView2.backgroundColor = [UIColor blackColor];
    [self.view addSubview:lineView1];
    [self.view addSubview:lineView2];
    
    UILabel *signInWithLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2-60, (y/2 - y/25 + 1.7*y/13), 300, 50)];
    [signInWithLabel setText:@"SIGN IN WITH"];
    [signInWithLabel setTextColor:[UIColor orangeColor]];
    signInWithLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    [self.view addSubview:signInWithLabel];
    
    UIView *dontHaveAccountView = [[UIView alloc] initWithFrame:CGRectMake(40, (y - y/5), x/1.25, 50)];
    dontHaveAccountView.layer.cornerRadius = 20;
    dontHaveAccountView.layer.borderColor = [UIColor blackColor].CGColor;
    dontHaveAccountView.layer.borderWidth = 1;
    [self.view addSubview:dontHaveAccountView];
    
    UILabel *dontHaveAccountLabel = [[UILabel alloc] initWithFrame:CGRectMake(dontHaveAccountView.bounds.size.width/12, 15, 100, 40)];
    [dontHaveAccountLabel setText:@"Don't have any account?"];
    [dontHaveAccountLabel sizeToFit];
    [dontHaveAccountView addSubview:dontHaveAccountLabel];
    
    signUpButton = [[UIButton alloc] initWithFrame:CGRectMake(dontHaveAccountView.bounds.size.width/10 + 170, 5, 100, 40)];
    [signUpButton setTitle:@"Sign Up" forState:UIControlStateNormal];
    signUpButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:18];
    [signUpButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [dontHaveAccountView addSubview:signUpButton];
    
    
    [GIDSignIn sharedInstance].uiDelegate = self;
    [GIDSignIn sharedInstance].delegate = self;
    [[GIDSignIn sharedInstance] signOut];
    GIDSignInButton *signInGoogleButton = [[GIDSignInButton alloc] initWithFrame:CGRectMake(x/10, (y/2 - y/25 + 2.7*y/13), 30, 30)];
    [signInGoogleButton setStyle:kGIDSignInButtonStyleIconOnly];
    [self.view addSubview:signInGoogleButton];
    
    
    UIButton *signInFaceBookButton = [[UIButton alloc] initWithFrame:CGRectMake(x/10 + x/5, (y/2 - y/25 + 2.7*y/13) , 52, 52)];
    [signInFaceBookButton setImage:[UIImage imageNamed:@"facebook"] forState:UIControlStateNormal];
    [signInFaceBookButton addTarget:self action:@selector(pressSignInFacebookButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signInFaceBookButton];
    
    UIButton *signInTwitterButton = [[UIButton alloc] initWithFrame:CGRectMake(x/10 + 2*x/5, (y/2 - y/25 + 2.7*y/13) , 52, 52)];
    [signInTwitterButton setImage:[UIImage imageNamed:@"twitter"] forState:UIControlStateNormal];
    [signInTwitterButton addTarget:self action:@selector(pressSignInTwitterButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signInTwitterButton];

}

- (void)pressSignInTwitterButton {
    [[Twitter sharedInstance] logInWithCompletion:^
     (TWTRSession *session, NSError *error) {
         if (session) {
             
             FIRAuthCredential *credential =
             [FIRTwitterAuthProvider credentialWithToken:session.authToken
                                                  secret:session.authTokenSecret];
             [[FIRAuth auth] signInAndRetrieveDataWithCredential:credential
                                                      completion:^(FIRAuthDataResult * _Nullable authResult,
                                                                   NSError * _Nullable error) {
                                                          if (error) {
                                                              // ...
                                                              return;
                                                          }
                                                          // User successfully signed in. Get user data from the FIRUser object
                                                          // ...
                                                          WomenViewController *womenViewController = [[WomenViewController alloc] init];
                                                          [self.navigationController pushViewController:womenViewController animated:YES];
                                                      }];
             
         } else {
             NSLog(@"error: %@", [error localizedDescription]);
         }
     }];
}


- (void)pressSignInFacebookButton {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
     logInWithReadPermissions: @[@"public_profile"]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             
             FIRAuthCredential *credential = [FIRFacebookAuthProvider
                                              credentialWithAccessToken:[FBSDKAccessToken currentAccessToken].tokenString];
             [[FIRAuth auth] signInAndRetrieveDataWithCredential:credential
                                                      completion:^(FIRAuthDataResult * _Nullable authResult,
                                                                   NSError * _Nullable error) {
                                                          if (error) {
                                                              // ...
                                                              return;
                                                          }
                                                          // User successfully signed in. Get user data from the FIRUser object
                                                          // ...
                                                          WomenViewController *womenViewController = [[WomenViewController alloc] init];
                                                          [self.navigationController pushViewController:womenViewController animated:YES];
                                                      }];
         }
     }];
}


- (void)signIn:(GIDSignIn *)signIn didSignInForUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
    if (error != nil) {
    }else {
        GIDAuthentication *authentication = user.authentication;
        FIRAuthCredential *credential =
        [FIRGoogleAuthProvider credentialWithIDToken:authentication.idToken
                                         accessToken:authentication.accessToken];
        [[FIRAuth auth] signInAndRetrieveDataWithCredential:credential
                                                 completion:^(FIRAuthDataResult * _Nullable authResult,
                                                              NSError * _Nullable error) {
                                                     if (error) {
                                                         // ...
                                                         return;
                                                     }
                                                     WomenViewController *womenViewController = [[WomenViewController alloc] init];
                                                     [self.navigationController pushViewController:womenViewController animated:YES];
                                                 }];
        
        
    }
}


//- (void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error {
//    if (error != nil || result.isCancelled) {
//    } else {
//        WomenViewController *womenViewController = [[WomenViewController alloc] init];
//        [self.navigationController pushViewController:womenViewController animated:YES];
//    }
//}




- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    
}


- (void)pressedMarketBarButtonItem:(UIBarButtonItem *)button{
    
}

- (void)pressedCommentBarButtonItem:(UIBarButtonItem *)button{
    
}

- (void)pressedMenuBarButtonItem:(UIBarButtonItem *)button{
    
}

- (void)pressCheckBox:(UIButton *)button{
    if (isChecked == NO) {
        [checkBoxButton setBackgroundImage:[UIImage imageNamed:@"checkbox"] forState:UIControlStateNormal];
        isChecked = YES;
    }else{
        [checkBoxButton setBackgroundImage:[UIImage imageNamed:@"uncheckbox"] forState:UIControlStateNormal];
        isChecked = NO;
    }
}

- (void)pressedSignInButton:(UIButton *)button{
    WomenViewController *womenViewController = [[WomenViewController alloc] init];
    [self.navigationController pushViewController:womenViewController animated:YES];
}



@end
