//
//  main.m
//  Block
//
//  Created by MAC on 4/20/18.
//  Copyright © 2018 com.SimiCart. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSDictionary *diction = @{@"key1":@"value1",@"key2":@"value2",@"key3":@"value3"};
        
        [diction enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop){
            NSLog(@"Hello, this is %@: %@", key, obj);
        }];
    }
    return 0;
}


