//
//  ProductViewController.h
//  UINavigationViewController
//
//  Created by MAC on 5/2/18.
//  Copyright © 2018 com.SimiCart. All rights reserved.
//

#import "ViewController.h"

@interface ProductViewController : ViewController <UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property NSInteger *currentPage;
@property NSInteger *totalPage;
@property (nonatomic) BOOL noMoreResultsAvail;
@property (nonatomic) BOOL loading;
@end
