//
//  WeboOAuthViewController.m
//  TestNetworkLayer
//
//  Created by huangluyang on 15/11/26.
//  Copyright © 2015年 huangluyang. All rights reserved.
//

#import "WeboOAuthViewController.h"

@interface WeboOAuthViewController () <UIWebViewDelegate, NSURLSessionDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WeboOAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.webView.delegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=1054630610&redirect_uri=http://www.myactivity"]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *urlString = request.URL.absoluteString;
    if ([urlString hasPrefix:@"http://www.myactivity"]) {
        NSString *code = [self getParamValueFromUrl:urlString paramName:@"code"];
        if (code) {
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://api.weibo.com/oauth2/access_token"]];
            request.HTTPMethod = @"POST";
            request.HTTPBody = [[NSString stringWithFormat:@"client_id=1054630610&client_secret=1707c91f7b3fb973af9fdf56da6dcffe&grant_type=authorization_code&code=%@&redirect_uri=http://www.myactivity", code] dataUsingEncoding:NSUTF8StringEncoding];
            NSURLSession *urlSession = [NSURLSession sharedSession];
            NSURLSessionTask *task = [urlSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                NSLog(@"response --> %@", response);
                if (data) {
                    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:NULL];
                    [[NSUserDefaults standardUserDefaults] setObject:dic forKey:@"AuthInfo"];
                    [[NSUserDefaults standardUserDefaults] synchronize];
                    [self dismissViewControllerAnimated:YES completion:nil];
                }
            }];
            [task resume];
        }
        return NO;
    }
    return YES;
}

- (NSString *)getParamValueFromUrl:(NSString *)url paramName:(NSString *)paramName
{
    if (![paramName hasSuffix:@"="]) {
        paramName = [NSString stringWithFormat:@"%@=", paramName];
    }
    
    NSString *str = nil;
    NSRange   start = [url rangeOfString:paramName];
    if (start.location != NSNotFound) {
        // confirm that the parameter is not a partial name match
        unichar  c = '?';
        if (start.location != 0) {
            c = [url characterAtIndex:start.location - 1];
        }
        if (c == '?' || c == '&' || c == '#') {
            NSRange     end = [[url substringFromIndex:start.location + start.length] rangeOfString:@"&"];
            NSUInteger  offset = start.location + start.length;
            str = end.location == NSNotFound ?
            [url substringFromIndex:offset] :
            [url substringWithRange:NSMakeRange(offset, end.location)];
            str = [str stringByRemovingPercentEncoding];
        }
    }
    return str;
}

@end
