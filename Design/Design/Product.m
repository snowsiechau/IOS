//
//  Product.m
//  Design
//
//  Created by MAC on 5/7/18.
//  Copyright © 2018 com.SimiCart. All rights reserved.
//

#import "Product.h"

@implementation Product

- (id)initWithName:(NSString *)name_ Price:(NSString *)price_ IsSale:(bool )isSale_ IsNew:(bool )isNew_ IsLike:(bool )isLike_ {

    self = [super init];
    
    if (self) {
        _name = name_;
        _price = price_;
        _isSale = isSale_;
        _isNew = isNew_;
        _isLike = isLike_;
    }
    
    return self;
}
@end
