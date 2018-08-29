//
//  SencondViewController.m
//  3D-Demo
//
//  Created by gofeyLee on 2018/5/18.
//  Copyright © 2018年 gofeyLee. All rights reserved.
//

#import "SencondViewController.h"
#import "ChildViewController.h"
@interface SencondViewController ()

@end

@implementation SencondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    [self.navigationItem setTitle:@"sencondVC"];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 50, 100 , 100, 45)];
    [self.view addSubview:btn];
    [btn setTitle:@"下一页" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 150, 200 , 300, 45)];
    [self.view addSubview:label];
    
    label.text = @"你现在看到的是第二页";
    if (self.str) {
        label.text = self.str;
    }
    label.textAlignment = NSTextAlignmentCenter;
}
- (void)btnClick:(UIButton *)sender {
    ChildViewController *viewController = [[ChildViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
