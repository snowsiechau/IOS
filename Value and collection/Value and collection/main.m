//
//  main.m
//  Value and collection
//
//  Created by MAC on 4/20/18.
//  Copyright © 2018 com.SimiCart. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        // 1
        NSString *name1 = @"John";
        name1 = [name1 stringByAppendingString:@"ny"];
        NSLog(@"%@", name1);
        // Tao mot object moi de noi them vao
        
        NSMutableString *name2 = [NSMutableString stringWithString:@"John"];
        [name2 appendString:@"ny"];
        NSLog(@"%@", name2);
        // Noi them vao object da ton tai
        
        // 2
        NSString* school = @"Hanoi University";
        NSString* name = @"Johnny";
        int age = 22;
        float endingPoint = 8.9f;
        NSLog(@"I'm %@, I'm from %@, I'm %i years old, and my point is %.1f", name, school, age, endingPoint);
        
        // 3
        NSNumber *double1 = [NSNumber numberWithDouble:0.12345];
        NSLog(@"%@", double1);
        
        // 4
        int array[] = {1,2,3,4,5};
        NSLog(@"%i", array[1]);
        // 5
        // Các đối tượng trong một mảng sẽ tồn tại song song với mảng, nó được giải phóng khi mảng không tham chiếu tới nữa.
        
        // 6
        // Trong một mảng các phần tử không nhất thiết phải cùng một kiểu.
        
        // 7
        id firstObject = @"someString";
        id secondObject = nil;
        id thirdObject = @"anotherString";
        
        NSArray *newArray = [NSArray arrayWithObjects:firstObject, secondObject, thirdObject, nil];
        
        for (int i = 0; i < [newArray count]; ++i) {
            NSLog(@"%@" , newArray[i]);
        }
        // newArray chỉ có 1 phần tử firstObject vì secondObject = nil coi như đã thông báo dừng nhập chuỗi.
        
        
        // 8
        // NSArray *newArray1 = @[firstObject, secondObject, thirdObject];
        // Khi run sẽ xuất ra một ngoại lệ: "attempt to insert nil object". Không được nhập vào một đối tượng nil.
        
        
        // 9
        NSArray *unsortedStrings = @[@"b",@"a",@"c"];
        NSArray *sortStrings = [unsortedStrings sortedArrayUsingSelector:@selector(compare:)];
        for (int i = 0; i < [sortStrings count]; ++i) {
            NSLog(@"%@", sortStrings[i]);
        }
        
        // 10
        // Chuyển NSArray thành NSMutableArray
        NSMutableArray *array2 = [NSMutableArray arrayWithObjects:@"alpha", nil];
        [array2 addObject:@"beta"];
        for (int i = 0; i < [array2 count]; ++i) {
            NSLog(@"%@", array2[i]);
        }
        
        // 11
        // NSSet giống như một array, nhưng nó không sắp xếp bên trong mảng, điều này để tăng hiệu năng khi tìm kiếm phần tử trong mảng.
        id a = @"a";
        id b = @"b";
        NSArray* array3 = [NSArray arrayWithObjects:a,b,a,a,a,a,nil];
        NSSet* set = [NSSet setWithObjects:a,b,a,a,a,a,nil];
        
        NSLog(@"%ld", [array3 count]);
        NSLog(@"%ld", [set count]);
        // Trong NSSet những phần tử giống nhau sẽ chuyển về một phần tử.
        
        // 12
        // Key trong NSDictionary có thể là đối tượng ngoài NSSting
        // Nếu tạo Key ngoài NSString phải thoả mãn NSCopying Protocol và thực thi hash, isEqual
        
        //13
        NSArray *array4 = @[ @"string", @42, [NSNull null] ];
        for (int i = 0; i < [array4 count]; ++i) {
            NSLog(@"%@", array4[i]);
        }
        
    }
        return 0;
}
