//
//  WomenViewController.m
//  Design
//
//  Created by MAC on 5/7/18.
//  Copyright © 2018 com.SimiCart. All rights reserved.
//

#import "WomenViewController.h"
#import "Product.h"
#import "WomenTableViewCell.h"

@interface WomenViewController ()
{
    NSMutableArray<Product *> *products;
    UICollectionView *mainCollectionView;
}
@end

@implementation WomenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:(247.0f/255.0f) green:(247.0f/255.0f) blue:(247.0f/255.0f) alpha:1];
    self.navigationItem.title = @"Women";
    self.navigationController.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *marketBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"market"] style:UIBarButtonItemStylePlain target:self action:@selector(pressedMarketBarButtonItem:)];
    UIBarButtonItem *commentBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"comment"] style:UIBarButtonItemStylePlain target:self action:@selector(pressedCommentBarButtonItem:)];
    [marketBarButtonItem setTintColor:[UIColor blackColor]];
    [commentBarButtonItem setTintColor:[UIColor blackColor]];
    self.navigationItem.rightBarButtonItems = @[marketBarButtonItem, commentBarButtonItem];
    commentBarButtonItem.imageInsets = UIEdgeInsetsMake(0, 15, 0, 0);
    
    self.navigationItem.hidesBackButton = YES;
    UIBarButtonItem *menuBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(pressedMenuBarButtonItem:)];
    [menuBarButtonItem setTintColor:[UIColor blackColor]];
    self.navigationItem.leftBarButtonItem = menuBarButtonItem;
     UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(pressedBackBarButtonItem:)];
    [backBarButtonItem setTintColor:[UIColor blackColor]];
    menuBarButtonItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, 15);
    
    self.navigationItem.leftBarButtonItems = @[backBarButtonItem, menuBarButtonItem];
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 110)];
    topView.backgroundColor = [UIColor colorWithRed:0.87 green:0.86 blue:0.85 alpha:1.0];
    [self.view addSubview:topView];
    
    UIButton *listButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    listButton.center = CGPointMake(40, 90);
    [listButton setImage:[UIImage imageNamed:@"list"] forState:UIControlStateNormal];
    [topView addSubview:listButton];
    UIButton *dontKnowButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    dontKnowButton.center = CGPointMake(self.view.bounds.size.width/2, 90);
    [dontKnowButton setImage:[UIImage imageNamed:@"dontknow"] forState:UIControlStateNormal];
    [topView addSubview:dontKnowButton];
    UIButton *upDownButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    upDownButton.center = CGPointMake(self.view.bounds.size.width - 40, 90);
    [upDownButton setImage:[UIImage imageNamed:@"updown"] forState:UIControlStateNormal];
    [topView addSubview:upDownButton];
    
    
    Product *product1 = [[Product alloc] initWithName:@"Silk Ruyle Top" Price:@"$245" IsSale:NO IsNew:YES IsLike:NO];
    Product *product2 = [[Product alloc] initWithName:@"Silk Ruyle Dress" Price:@"$146" IsSale:YES IsNew:NO IsLike:YES];
    Product *product3 = [[Product alloc] initWithName:@"Red Velvet Dress" Price:@"$300 - $320" IsSale:NO IsNew:NO IsLike:NO];
    Product *product4 = [[Product alloc] initWithName:@"Off-shouder" Price:@"$198" IsSale:NO IsNew:NO IsLike:YES];
    
     products = [[NSMutableArray alloc] init];
    [products addObject:product1];
    [products addObject:product2];
    [products addObject:product3];
    [products addObject:product4];
    
    
    UICollectionViewFlowLayout *mainCollectionViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(20, 120, self.view.bounds.size.width - 40, self.view.bounds.size.height) collectionViewLayout:mainCollectionViewFlowLayout];
    mainCollectionView.backgroundColor = [UIColor colorWithRed:(247.0f/255.0f) green:(247.0f/255.0f) blue:(247.0f/255.0f) alpha:1];
    mainCollectionView.delegate = self;
    mainCollectionView.dataSource = self;
    [mainCollectionView registerClass:WomenTableViewCell.self forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:mainCollectionView];
}

- (void) pressedMarketBarButtonItem:(UIBarButtonItem *)button{
    
}

- (void) pressedCommentBarButtonItem:(UIBarButtonItem *)button{
    
}

- (void) pressedMenuBarButtonItem:(UIBarButtonItem *)button{
    
}

- (void) pressedBackBarButtonItem:(UIBarButtonItem *)button{
    [self.navigationController popViewControllerAnimated:YES];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [products count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WomenTableViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.nameLabel.text = products[indexPath.row].name;
    cell.priceLabel.text = products[indexPath.row].price;
    cell.imggeImageView.image = [UIImage imageNamed:@"image1"];
    
    if (products[indexPath.row].isLike == YES) {
        cell.heartImageView.image = [UIImage imageNamed:@"redheart"];
    }else {
        cell.heartImageView.image = [UIImage imageNamed:@"blankheart"];

    }
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.bounds.size.width/2.4, self.view.bounds.size.height/2.7);
}


@end
