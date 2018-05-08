//
//  Product.h
//  Design
//
//  Created by MAC on 5/7/18.
//  Copyright © 2018 com.SimiCart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, assign) bool isSale, isNew, isLike;

- (id)initWithName:(NSString *)name_ Price:(NSString *)price_ IsSale:(bool )isSale_ IsNew:(bool )isNew_ IsLike:(bool )isLike_;

@end
