//
//  ViewController.m
//  TestNetworkLayer
//
//  Created by huangluyang on 15/11/26.
//  Copyright © 2015年 huangluyang. All rights reserved.
//

#import "ViewController.h"
#import "WeiboStatusListAPIManager.h"

@interface ViewController () <RTAPIManagerApiCallBackDelegate, RTAPIManagerParamSourceDelegate>

@property (nonatomic, strong) WeiboStatusListAPIManager *weiboStatusListAPIManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - RTAPIManagerParamSourceDelegate
- (NSDictionary *)paramsForApi:(RTAPIBaseManager *)manager
{
    if (manager == self.weiboStatusListAPIManager) {
        return @{@"access_token": [[[NSUserDefaults standardUserDefaults] objectForKey:@"AuthInfo"] objectForKey:@"access_token"]};
    }
    
    return nil;
}

#pragma mark - RTAPIManagerApiCallBackDelegate
- (void)managerCallAPIDidSuccess:(RTAPIBaseManager *)manager
{
    NSLog(@"success");
}

- (void)managerCallAPIDidFailed:(RTAPIBaseManager *)manager
{
    NSLog(@"failed");
}

#pragma mark - Event Response
- (IBAction)fetchListButtonTapped:(UIButton *)sender {
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"AuthInfo"]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"请登录" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        [self showViewController:alert sender:nil];
        return;
    }
    [self.weiboStatusListAPIManager loadData];
}

#pragma mark - Getters
- (WeiboStatusListAPIManager *)weiboStatusListAPIManager
{
    if (!_weiboStatusListAPIManager) {
        _weiboStatusListAPIManager = [[WeiboStatusListAPIManager alloc] init];
        _weiboStatusListAPIManager.delegate = self;
        _weiboStatusListAPIManager.paramSource = self;
    }
    
    return _weiboStatusListAPIManager;
}

@end
