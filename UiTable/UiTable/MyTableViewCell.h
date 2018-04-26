//
//  MyTableViewCell.h
//  UiTable
//
//  Created by MAC on 4/26/18.
//  Copyright © 2018 com.SimiCart. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbName;
@property (weak, nonatomic) IBOutlet UILabel *lbPrice;
@property (weak, nonatomic) IBOutlet UIImageView *imImage;

@end
