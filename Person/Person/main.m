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
#import "XYZPerson+XYZPersonNameDisplayAdditions.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        XYZPerson  __weak *weakPerson = [[XYZPerson alloc] initWithFirstName:@"Chau" lastName:@"Nguyen"];
        [weakPerson sayHello];
        
        XYZPerson *person = [[XYZPerson alloc] initWithFirstName:@"John" lastName:@"Cena"];
        [person sayHello];
        NSLog(@"%@", [person lastNameFirstNameString]);
        
        [person measureHeight:10];
        [person measureWeight:12];
        NSLog(@"%i %i", person.height, person.weight);
        
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
