//
//  TableViewCell.m
//  UiTableViewNoStoryboard
//
//  Created by MAC on 5/2/18.
//  Copyright © 2018 com.SimiCart. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.lbName = [[UILabel alloc] initWithFrame:CGRectMake(10, 200, 300, 30)];
        self.lbName.textColor = [UIColor redColor];
        self.lbName.font = [UIFont fontWithName:@"Arial" size:20.0f];
        [self addSubview:self.lbName];
        
        self.lbPrice = [[UILabel alloc] initWithFrame:CGRectMake( 10, 220, 300, 30)];
        self.lbPrice.textColor = [UIColor blackColor];
        self.lbPrice.font = [UIFont fontWithName:@"Arial" size:15.0f];
        [self addSubview:self.lbPrice];
        
        self.ivImage = [[UIImageView alloc] initWithFrame:CGRectMake(100, 10, 150, 170)];
        [self addSubview: self.ivImage];
    }
    
    return self;
}

@end
