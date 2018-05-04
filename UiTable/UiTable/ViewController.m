//
//  ViewController.m
//  UiTable
//
//  Created by MAC on 4/26/18.
//  Copyright © 2018 com.SimiCart. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *table;
@property (nonatomic, strong) NSMutableArray *arrayProducts;
@property (nonatomic, strong) NSMutableArray *arrayPrice;
@property (nonatomic, strong) NSMutableArray *arrayImage;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.arrayProducts = [[NSMutableArray alloc] init];
    self.arrayPrice = [[NSMutableArray alloc] init];
    self.arrayImage = [[NSMutableArray alloc] init];
    
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
                                                  [self.arrayProducts addObject:project[@"name"]];
                                                  [self.arrayPrice addObject:project[@"price"]];
                                              }
                                              
                                              for (NSDictionary *project in [responseDictionary objectForKey:@"products"]) {
                                                  NSArray *arr = [project objectForKey:@"images"];
                                                  [self.arrayImage addObject: [arr[0] objectForKey:@"url"]];
                                                  NSLog(@"%@", [arr[0] objectForKey:@"url"]);
                                              }
                                          }
                                          else
                                          {
                                              NSLog(@"Error");
                                          }
                                                      dispatch_async(dispatch_get_main_queue(), ^{
                                                          [self.table reloadData];
                                                      });
                                      }];
    [dataTask resume];
    
    self.table.alpha = 1;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayProducts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellID = @"cell";
    
    MyTableViewCell *myCell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    myCell.lbName.text = self.arrayProducts[indexPath.row];
    myCell.lbPrice.text = [NSString stringWithFormat:@"$ %@", self.arrayPrice[indexPath.row]];

    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: self.arrayImage[indexPath.row]]];
        if ( data == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            // WARNING: is the cell still using the same data by this point??
            myCell.imImage.image = [UIImage imageWithData: data];
        });
       
    });
    return myCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 250;
}


@end
