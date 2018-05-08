//
//  ProductViewController.m
//  UINavigationViewController
//
//  Created by MAC on 5/2/18.
//  Copyright © 2018 com.SimiCart. All rights reserved.
//

#import "ProductViewController.h"
#import "TableViewCell.h"
#import "CollectionViewCell.h"


@interface ProductViewController ()
{
    NSMutableArray *arrayProducts;
    NSMutableArray *arrayPrice;
    NSMutableArray *arrayImage;
    int alpha;
    UITableView *table;
    UICollectionView *collection;
}
@end

@implementation ProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    // Do any additional setup after loading the view.
    
    alpha = 0;
    _currentPage = 0;
    
    table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    table.backgroundColor = [UIColor whiteColor];
    table.showsVerticalScrollIndicator = false;
    table.delegate = self;
    table.dataSource = self;
    [table registerClass:TableViewCell.self forCellReuseIdentifier:@"cell"];
    [self.view addSubview:table];
    table.alpha = alpha;
    
    UICollectionViewFlowLayout *cvl = [[UICollectionViewFlowLayout alloc] init];
    collection = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:cvl];
    collection.backgroundColor = [UIColor whiteColor];
    collection.delegate = self;
    collection.dataSource = self;
    [collection registerClass: CollectionViewCell.self forCellWithReuseIdentifier:@"cellCollectinon" ];
    [self.view addSubview:collection];
    collection.alpha = 1;
    
    UIButton *btChange = [UIButton buttonWithType:UIButtonTypeSystem];
    [btChange setTitle:@"Display Gridview" forState: UIControlStateNormal];
    [btChange sizeToFit];
    btChange.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height - 100);
    [btChange addTarget:self action:@selector(btChangePressed:) forControlEvents:UIControlEventTouchUpInside];
    btChange.backgroundColor = [UIColor yellowColor];
    [self.view addSubview: btChange];
    
    arrayProducts = [[NSMutableArray alloc] init];
    arrayPrice = [[NSMutableArray alloc] init];
    arrayImage = [[NSMutableArray alloc] init];
    
    NSString *urlString = @"http://dev-magento19.jajahub.com/index.php/simiconnector/rest/v2/products?email='USER_ID'&filter%5Bcat_id%5D=4&image_height=600&image_width=600&is_demo=1&limit=12&offset=0&password=PASSWORD";
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:urlString]];
    
    //create the Method "GET"
    [urlRequest setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                      {
                                          NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                                          if(httpResponse.statusCode == 200)
                                          {
                                              NSError *parseError = nil;
                                              NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
                                              NSLog(@"The response is - %@",responseDictionary);
                                              NSLog(@"-------------------------------");
                                              
                                              
                                              for (NSDictionary *project in responseDictionary[@"products"]) {
                                                  [arrayProducts addObject:project[@"name"]];
                                                  [arrayPrice addObject:project[@"price"]];
                                              }
                                              
                                              for (NSDictionary *project in [responseDictionary objectForKey:@"products"]) {
                                                  NSArray *arr = [project objectForKey:@"images"];
                                                  [arrayImage addObject: [arr[0] objectForKey:@"url"]];
                                                  NSLog(@"%@", [arr[0] objectForKey:@"url"]);
                                              }
                                          }
                                          else
                                          {
                                              NSLog(@"Error");
                                          }
                                          dispatch_async(dispatch_get_main_queue(), ^{
                                              [table reloadData];
                                              [collection reloadData];
                                          });
                                      }];
    [dataTask resume];
}


- (void) btChangePressed:(UIButton *) btChange{
    if (alpha == 1) {
        alpha = 0;
        table.alpha = 0;
        collection.alpha = 1;
        [btChange setTitle:@"Display GridView" forState: UIControlStateNormal];
        [btChange sizeToFit];
    }else{
        alpha = 1;
        table.alpha = 1;
        collection.alpha = 0;
        [btChange setTitle:@"Display ListView" forState: UIControlStateNormal];
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [arrayProducts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.lbName.text = arrayProducts[indexPath.row];
    cell.lbPrice.text = arrayPrice[indexPath.row];
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: arrayImage[indexPath.row]]];
        if ( data == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.ivImage.image = [UIImage imageWithData: data];
        });
        
    });
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 250;
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [arrayProducts count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellCollectinon" forIndexPath:indexPath];
    
    cell.lbName.text = arrayProducts[indexPath.row];
    cell.lbPrice.text = arrayPrice[indexPath.row];
    
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: arrayImage[indexPath.row]]];
        if ( data == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.ivImage.image = [UIImage imageWithData: data];
        });
        
    });
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(180, 180);
}


@end
