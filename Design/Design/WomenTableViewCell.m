//
//  WomenTableViewCell.m
//  Design
//
//  Created by MAC on 5/7/18.
//  Copyright © 2018 com.SimiCart. All rights reserved.
//

#import "WomenTableViewCell.h"

@implementation WomenTableViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        double x = frame.size.width;
        double y = frame.size.height;
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(x/15, y/1.3, 300, 30)];
        self.nameLabel.textColor = [UIColor blackColor];
        self.nameLabel.font = [UIFont fontWithName:@"Arial" size:15.0f];
        [self addSubview:self.nameLabel];
        
        self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(x/15, y/1.15, 300, 30)];
        self.priceLabel.textColor = [UIColor blackColor];
        self.priceLabel.font = [UIFont fontWithName:@"Helvetica" size:18.0f];
        [self addSubview:self.priceLabel];
    
        self.imggeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, y/1.3)];
        [self addSubview: self.imggeImageView];
        
        self.heartImageView = [[UIImageView alloc] initWithFrame:CGRectMake(x - x/5, y/1.15 , 25, 25)];
        [self addSubview: self.heartImageView];
    }
    return self;
}
@end
