//
//  XYZPerson+XYZPersonNameDisplayAdditions.m
//  Person
//
//  Created by MAC on 4/19/18.
//  Copyright © 2018 com.SimiCart. All rights reserved.
//

#import "XYZPerson+XYZPersonNameDisplayAdditions.h"
#import "XYZShoutingPerson.h"

@implementation XYZPerson (XYZPersonNameDisplayAdditions)

- (NSString *)lastNameFirstNameString
{
    return [NSString stringWithFormat:@"%@ %@", self.lastName, self.firstName];
}
@end
