//
//  XYZPerson.m
//  Person
//
//  Created by MAC on 4/19/18.
//  Copyright © 2018 com.SimiCart. All rights reserved.
//

#import "XYZPerson.h"

@implementation XYZPerson

- (void)sayHello
{
    [self saySomething:@"Hello, World!"];
}

- (void)saySomething:(NSString *)greeting
{
    NSLog(@"%@", greeting);
}

+ (id)person
{
    return [[self alloc] init];
}
@end
