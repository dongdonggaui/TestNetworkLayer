//
//  ViewController.m
//  TestNetworkLayer
//
//  Created by huangluyang on 15/11/26.
//  Copyright © 2015年 huangluyang. All rights reserved.
//

#import "ViewController.h"
#import "WBStatusTimelineViewController.h"

@interface ViewController ()


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

#pragma mark - Event Response
- (IBAction)fetchListButtonTapped:(UIButton *)sender {
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"AuthInfo"]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"请登录" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        [self showViewController:alert sender:nil];
        return;
    }
    
    UIViewController *vc = [[WBStatusTimelineViewController alloc] init];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
    [self showViewController:nc sender:nil];
}

@end
