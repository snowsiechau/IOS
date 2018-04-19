//
//  XYZPerson.m
//  Person
//
//  Created by MAC on 4/19/18.
//  Copyright © 2018 com.SimiCart. All rights reserved.
//

#import "XYZPerson.h"

@implementation XYZPerson
{
    NSMutableString *appendFirstName;
}

@synthesize firstName, lastName;

- (void)sayHello
{
    [self saySomething:@"Hello "];
}

- (void)saySomething:(NSString *)greeting
{
    NSLog(@"%@ %@ ", greeting, [self fullName]);
}

+ (id)person
{
    return [[self alloc] init];
}

- (id)initWithFirstName:(NSString *)aFirstName lastName:(NSString *)aLastName
{
    self = [super init];
    
    if (self) {
        firstName = aFirstName;
        lastName = aLastName;
    }
    
    return self;
}

- (NSString *)fullName
{
    appendFirstName = [NSMutableString stringWithString: @"John"];
    [appendFirstName appendString:@"ny"];
    return [NSString stringWithFormat:@"%@ %@", appendFirstName, self.lastName];
}

- (void)dealloc
{
    NSLog(@"Dealloc");
}

@end
