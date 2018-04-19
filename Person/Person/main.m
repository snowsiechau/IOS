//
//  main.m
//  Person
//
//  Created by MAC on 4/19/18.
//  Copyright © 2018 com.SimiCart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYZPerson.h"
#import "XYZShoutingPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        XYZPerson *person = [[XYZPerson alloc] init];
        [person sayHello];
        
        XYZShoutingPerson *shoutingPerson1 = [[XYZShoutingPerson alloc] init];
        [shoutingPerson1 sayHello];
        
        XYZShoutingPerson *shoutingPerson2 = [XYZShoutingPerson person];
        [shoutingPerson2 sayHello];
        
        XYZPerson *somePerson;
        if (somePerson == nil) {
            NSLog(@"nil");
        }
        
    }
    return 0;
}
