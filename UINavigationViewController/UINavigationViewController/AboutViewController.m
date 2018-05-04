//
//  AboutViewController.m
//  UINavigationViewController
//
//  Created by MAC on 5/2/18.
//  Copyright © 2018 com.SimiCart. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController (){
    BOOL theBool;
    NSTimer *myTimer;
    UIProgressView* myProgressView;
}
@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIWebView *webview=[[UIWebView alloc]initWithFrame:self.view.bounds];
    NSString *url=@"https://www.simicart.com/";
    NSURL *nsurl=[NSURL URLWithString:url];
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
    [webview loadRequest:nsrequest];
    [self.view addSubview:webview];
    
    myProgressView = [[UIProgressView alloc] init];
    myProgressView.frame = CGRectMake(self.view.bounds.size.width/2-50,self.view.bounds.size.height/2-10,100,20);
    [self.view addSubview:myProgressView];
    
    webview.delegate = self;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    myProgressView.progress = 0;
    theBool = false;
    myTimer = [NSTimer scheduledTimerWithTimeInterval:0.01667 target:self selector:@selector(timerCallback) userInfo:nil repeats:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    theBool = true;
}

-(void)timerCallback {
    if (theBool) {
        if (myProgressView.progress >= 1) {
            myProgressView.hidden = true;
            [myTimer invalidate];
        }
        else {
            myProgressView.progress += 0.1;
        }
    }
    else {
        myProgressView.progress += 0.05;
        if (myProgressView.progress >= 0.95) {
            myProgressView.progress = 0.95;
        }
    }
}

@end
