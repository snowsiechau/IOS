//
//  XYZPerson.m
//  Person
//
//  Created by MAC on 4/19/18.
//  Copyright © 2018 com.SimiCart. All rights reserved.
//

#import "XYZPerson.h"

@interface XYZPerson()
@property (readwrite) int height;
@property (readwrite) int weight;
@property (readwrite) int add;
@end

@implementation XYZPerson

{
    NSMutableString *appendFirstName;
}


@synthesize firstName, lastName, weight, height;

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

- (void)measureHeight:(int)h
{
    height = h;
}

- (void)measureWeight:(int)w
{
    weight = w;
}

@end
