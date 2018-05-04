//
//  CollectionViewCell.m
//  UiTableViewNoStoryboard
//
//  Created by MAC on 5/2/18.
//  Copyright © 2018 com.SimiCart. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *background = [[UIView alloc] initWithFrame:CGRectMake(5, 10, 165, 180)];
        [background setBackgroundColor:[UIColor grayColor]];
        
        
        [self addSubview:background];
        
        
        self.lbName = [[UILabel alloc] initWithFrame:CGRectMake(20, 120, 150, 50)];
        self.lbName.textColor = [UIColor redColor];
        self.lbName.font = [UIFont fontWithName:@"Arial" size:15.0];
        self.lbName.lineBreakMode = NSLineBreakByWordWrapping;
        self.lbName.numberOfLines = 2;
        [self addSubview:self.lbName];
        
        self.lbPrice = [[UILabel alloc] initWithFrame:CGRectMake( 20, 155, 180, 30)];
        self.lbPrice.textColor = [UIColor blackColor];
        self.lbPrice.font = [UIFont fontWithName:@"Arial" size:12.0f];
        [self addSubview:self.lbPrice];
        
        self.ivImage = [[UIImageView alloc] initWithFrame:CGRectMake(50, 15, 75, 110)];
        [self addSubview: self.ivImage];
    }
    return self;
}
@end
