//
//  TodayViewController.m
//  3D-Widget-Demo
//
//  Created by gofeyLee on 2018/6/5.
//  Copyright © 2018年 gofeyLee. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>
    
    @end

@implementation TodayViewController
    
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //    WidgetUrlScheme
    NSArray *imgs = @[@"4",@"4",@"4",@"4"];
    
    if (@available(iOS 10.0, *)) {
        self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;//ios10以上兼容
    } else {
        // Fallback on earlier versions
    }
    self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 110);
    CGFloat btnW = 80;
    CGFloat btnH = 80;
    CGFloat spaceX = ([UIScreen mainScreen].bounds.size.width - btnW * 4) / 5;
    
    for (int i = 0; i < 8; i++) {
        UIButton *firstBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:firstBtn];
        firstBtn.frame = CGRectMake(spaceX * (i % 4 + 1) + btnW * (i % 4), 15 + (btnH + 15) * (i / 4), btnW, btnH);
        if (i < 4){
            if (i == 3) {
                [firstBtn setTitle:@"返回App" forState:UIControlStateNormal];
                [firstBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            } else {
                [firstBtn setImage:[UIImage imageNamed:imgs[i]] forState:UIControlStateNormal];
            }
        }else{
            [firstBtn setImage:[UIImage imageNamed:@"4"] forState:UIControlStateNormal];
        }
        firstBtn.tag = i + 1;
        [firstBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}
    
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    if (@available(iOS 10.0, *)) {
//        self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
//    } else {
//        // Fallback on earlier versions
//    }
}
    
- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize{
        NSLog(@"maxWidth %f maxHeight %f",maxSize.width,maxSize.height);
        
        if (activeDisplayMode == NCWidgetDisplayModeCompact) {
            self.preferredContentSize = CGSizeMake(maxSize.width, 110);
        } else {
            self.preferredContentSize = CGSizeMake(maxSize.width, 205);
        }
}

- (void)btnClick:(UIButton *)sender {
    if (sender.tag == 4) {
        NSURL *url = [NSURL URLWithString:@"WidgetUrlScheme://1234567"];
        [self.extensionContext openURL:url completionHandler:^(BOOL success) {
            
            NSLog(@"isSuccessed %d",success);
        }];
    }else{
        NSLog(@"其他功能 == %ld", (long)sender.tag);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData
    
    completionHandler(NCUpdateResultNewData);
}
    
    @end
