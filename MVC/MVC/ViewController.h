//
//  ViewController.h
//  MVC
//
//  Created by MAC on 4/20/18.
//  Copyright © 2018 com.SimiCart. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *tfFirstName;
@property (weak, nonatomic) IBOutlet UITextField *tfLastName;
- (IBAction)btShowName:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lbHide;

@end

