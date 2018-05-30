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
    double x, y;
}

@end

@implementation SignInViewController

@synthesize emailLabel, passwordLabel, emailTextField, passwordTextField, signInButton, signUpButton, forgotPasswordButton, checkBoxButton, tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.backgroundColor = [UIColor colorWithRed:(247.0f/255.0f) green:(247.0f/255.0f) blue:(247.0f/255.0f) alpha:1];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.allowsSelection = NO;
    [tableView setShowsVerticalScrollIndicator:NO];
    [tableView setShowsVerticalScrollIndicator:NO];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"cell"];
    [self.view addSubview:tableView];
    
    isChecked = NO;
    self.view.backgroundColor = [UIColor colorWithRed:(247.0f/255.0f) green:(247.0f/255.0f) blue:(247.0f/255.0f) alpha:1];
    x = self.view.bounds.size.width;
    y = self.view.bounds.size.height;
    
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
}


- (void)customCellEmailLabel:(UITableViewCell *)cell {
    emailLabel = [[UILabel alloc] initWithFrame:CGRectMake(x/10, 0, 100, 40)];
    [emailLabel setText:@"Email"];
    [cell addSubview:emailLabel];
}

- (void)customCellPasswordLabel:(UITableViewCell *)cell {
    passwordLabel = [[UILabel alloc] initWithFrame:CGRectMake(x/10, 0, 100, 40)];
    [passwordLabel setText:@"Password"];
    [cell addSubview:passwordLabel];
}

- (void)customCellEmailTextField:(UITableViewCell *)cell {
    emailTextField = [[UITextField alloc] initWithFrame:CGRectMake(x/10, 0, x/1.25, 40)];
    emailTextField.placeholder = @"Test@simicart";
    emailTextField.backgroundColor = [UIColor whiteColor];
    UIView *paddingEmailView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    emailTextField.leftView = paddingEmailView;
    emailTextField.leftViewMode = UITextFieldViewModeAlways;
    emailTextField.delegate = self;
    [cell addSubview: emailTextField];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [emailTextField resignFirstResponder];
    [passwordTextField resignFirstResponder];
    return YES;
}

- (void)customCellPasswordTextField:(UITableViewCell *)cell {
    passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(x/10, 0, x/1.25, 40)];
    passwordTextField.placeholder = @"Password";
    passwordTextField.backgroundColor = [UIColor whiteColor];
    UIView *paddingPasswordView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    passwordTextField.leftView = paddingPasswordView;
    passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    passwordTextField.secureTextEntry = YES;
    passwordTextField.delegate = self;
    [cell addSubview: passwordTextField];
}

- (void)customCellRememberMe:(UITableViewCell *)cell {
    checkBoxButton = [[UIButton alloc] initWithFrame:CGRectMake(x/10, 12, 16, 16)];
    [checkBoxButton setBackgroundImage:[UIImage imageNamed:@"uncheckbox"] forState:UIControlStateNormal];
    [checkBoxButton setBackgroundImage:[UIImage imageNamed:@"checkbox"] forState:UIControlStateSelected];
    [checkBoxButton setBackgroundImage:[UIImage imageNamed:@"checkbox"] forState:UIControlStateHighlighted];
    checkBoxButton.adjustsImageWhenHighlighted = YES;
    [checkBoxButton addTarget:self action:@selector(pressCheckBox:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:checkBoxButton];
    
    UILabel *rememberMeLabel = [[UILabel alloc] initWithFrame:CGRectMake((x/10 + x/18), 10, 100, y/14)];
    [rememberMeLabel setText:@"Remember me"];
    [rememberMeLabel sizeToFit];
    [cell addSubview:rememberMeLabel];
    
    forgotPasswordButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [forgotPasswordButton setTitle:@"Forgot password?" forState:UIControlStateNormal];
    [forgotPasswordButton sizeToFit];
    forgotPasswordButton.center = CGPointMake((x/10 + x/1.6), 20);
    [forgotPasswordButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [cell addSubview:forgotPasswordButton];
}

- (void)customCellSignInButton:(UITableViewCell *)cell {
    signInButton = [[UIButton alloc] initWithFrame:CGRectMake(x/10, 0, x/1.25, 40)];
    [signInButton setTitle:@"SIGN IN" forState:UIControlStateNormal];
    [signInButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    signInButton.backgroundColor = [UIColor orangeColor];
    signInButton.layer.cornerRadius = 20;
    signInButton.clipsToBounds = YES;
    signInButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    [signInButton addTarget:self action:@selector(pressedSignInButton:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:signInButton];
}

- (void)customCellOr:(UITableViewCell *)cell {
    UILabel *orLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2 - 10, 0, 40, 40)];
    [orLabel setText:@"Or"];
    [cell addSubview:orLabel];
    
    UIView *lineView1 = [[UIView alloc] initWithFrame:CGRectMake(x/10, 20, x/3, 1)];
    lineView1.backgroundColor = [UIColor blackColor];
    UIView *lineView2 = [[UIView alloc] initWithFrame:CGRectMake((x - x/10 - x/3), 20, x/3, 1)];
    lineView2.backgroundColor = [UIColor blackColor];
    [cell addSubview:lineView1];
    [cell addSubview:lineView2];
}

- (void)customCellSignInWith:(UITableViewCell *)cell {
    UILabel *signInWithLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2-60, 0, 300, 40)];
    [signInWithLabel setText:@"SIGN IN WITH"];
    [signInWithLabel setTextColor:[UIColor orangeColor]];
    signInWithLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    [cell addSubview:signInWithLabel];
}

- (void)customCellSigninWithGoogle:(UITableViewCell *)cell {
    [GIDSignIn sharedInstance].uiDelegate = self;
    [GIDSignIn sharedInstance].delegate = self;
    [[GIDSignIn sharedInstance] signOut];
    GIDSignInButton *signInGoogleButton = [[GIDSignInButton alloc] initWithFrame:CGRectMake(x/10, 0, 30, 30)];
    [signInGoogleButton setStyle:kGIDSignInButtonStyleIconOnly];
    [cell addSubview:signInGoogleButton];
    
    UIButton *signInFaceBookButton = [[UIButton alloc] initWithFrame:CGRectMake(x/10 + x/5, 0, 52, 52)];
    [signInFaceBookButton setImage:[UIImage imageNamed:@"facebook"] forState:UIControlStateNormal];
    [signInFaceBookButton addTarget:self action:@selector(pressSignInFacebookButton) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:signInFaceBookButton];
    
    UIButton *signInTwitterButton = [[UIButton alloc] initWithFrame:CGRectMake(x/10 + 2*x/5, 0, 52, 52)];
    [signInTwitterButton setImage:[UIImage imageNamed:@"twitter"] forState:UIControlStateNormal];
    [signInTwitterButton addTarget:self action:@selector(pressSignInTwitterButton) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:signInTwitterButton];

}

- (void)customCellDontHave:(UITableViewCell *)cell {
    UIView *dontHaveAccountView = [[UIView alloc] initWithFrame:CGRectMake(40, 0, x/1.25, 40)];
    dontHaveAccountView.layer.cornerRadius = 20;
    dontHaveAccountView.layer.borderColor = [UIColor blackColor].CGColor;
    dontHaveAccountView.layer.borderWidth = 1;
    [cell addSubview:dontHaveAccountView];
    
    signUpButton = [UIButton buttonWithType:UIButtonTypeSystem];
    NSMutableAttributedString *dontHaveAttribute = [[NSMutableAttributedString alloc] initWithString:@"Don't have an Account? Sign up"];
    [dontHaveAttribute addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Helvetica" size: 16] range:NSMakeRange(0, 22)];
    [dontHaveAttribute addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Helvetica-Bold" size: 18] range:NSMakeRange(22, 8)];
    [dontHaveAttribute addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 30)];
    
    
    [signUpButton setAttributedTitle:dontHaveAttribute forState:UIControlStateNormal];
    [signUpButton sizeToFit];
    signUpButton.center = CGPointMake(dontHaveAccountView.bounds.size.width/2, dontHaveAccountView.bounds.size.height/2);
    [signUpButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [dontHaveAccountView addSubview:signUpButton];
        
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 12;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cellTableview = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    switch (indexPath.row) {
        case 1:
            [self customCellEmailLabel:cellTableview];
            break;
        case 2:
            [self customCellEmailTextField:cellTableview];
            break;
        case 3:
            [self customCellPasswordLabel:cellTableview];
            break;
        case 4:
            [self customCellPasswordTextField:cellTableview];
            break;
        case 5:
            [self customCellRememberMe:cellTableview];
            break;
        case 6:
            [self customCellSignInButton:cellTableview];
            break;
        case 7:
            [self customCellOr:cellTableview];
            break;
        case 8:
            [self customCellSignInWith:cellTableview];
            break;
        case 9:
            [self customCellSigninWithGoogle:cellTableview];
            break;
        case 11:
            [self customCellDontHave:cellTableview];
            break;
        default:
            break;
    }
    cellTableview.backgroundColor = [UIColor colorWithRed:(247.0f/255.0f) green:(247.0f/255.0f) blue:(247.0f/255.0f) alpha:1];
    return cellTableview;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            return 20;
            break;
        case 5:
            return 50;
            break;
        case 6:
            return 50;
            break;
        default:
            break;
    }
    return 40;
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
