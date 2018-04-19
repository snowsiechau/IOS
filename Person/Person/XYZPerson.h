//
//  XYZPerson.h
//  Person
//
//  Created by MAC on 4/19/18.
//  Copyright © 2018 com.SimiCart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYZPerson : NSObject
@property  NSString *firstName;
@property  NSString *lastName;
@property  NSDate *dateOfBirth;

-(void) sayHello;
-(void) saySomething: (NSString *) greeting;
+(id) person;
@end
