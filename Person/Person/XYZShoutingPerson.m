//
//  XYZShoutingPerson.m
//  Person
//
//  Created by MAC on 4/19/18.
//  Copyright © 2018 com.SimiCart. All rights reserved.
//

#import "XYZShoutingPerson.h"

@implementation XYZShoutingPerson

- (void)saySomething:(NSString *)greeting
{
    NSString *upperCaseGreeting = [greeting uppercaseString];
    [super saySomething:upperCaseGreeting];
}
@end
