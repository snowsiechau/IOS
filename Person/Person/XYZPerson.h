//
//  XYZPerson.h
//  Person
//
//  Created by MAC on 4/19/18.
//  Copyright © 2018 com.SimiCart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYZPerson : NSObject
@property  (copy) NSString *firstName;
@property  NSString *lastName;
@property (readonly) NSString *fullName;
@property  NSDate *dateOfBirth;

-(void) sayHello;
-(void) saySomething: (NSString *) greeting;
-(id) initWithFirstName: (NSString *) aFirstName lastName: (NSString *) aLastName;
+(id) person;
@end
