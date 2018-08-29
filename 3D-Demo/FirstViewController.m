//
//  ViewController.m
//  3D-Demo
//
//  Created by gofeyLee on 2018/5/15.
//  Copyright © 2018年 gofeyLee. All rights reserved.
//
#import <ifaddrs.h>
#import <arpa/inet.h>
#import <net/if.h>

#define IOS_CELLULAR    @"pdp_ip0"
#define IOS_WIFI        @"en0"
#define IOS_VPN         @"utun0"
#define IP_ADDR_IPv4    @"ipv4"
#define IP_ADDR_IPv6    @"ipv6"


#import "FirstViewController.h"
#import "ChildViewController.h"

#import "EnlargeButton.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    [self.navigationItem setTitle:@"firstVC"];
    EnlargeButton *btn = [[EnlargeButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 50, 100 , 100, 45)];
    [self.view addSubview:btn];
    [btn setTitle:@"下一页" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 150, 200 , 300, 45)];
    [self.view addSubview:label];
    
    label.text = @"你现在看到的是第一页";
    if (self.str) {
        label.text = self.str;
    }
    label.textAlignment = NSTextAlignmentCenter;
    NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:@(6), @(1),@(2),@(5),@(9),@(4),@(3),@(7),nil];
    NSLog(@"before sort array:%@",arr);
    [self quickSortArray:arr withLeftIndex:0 andRightIndex:arr.count - 1];
    NSLog(@"after sort array:%@",[self quickSort:arr]);
    NSLog(@"quickSortArray:%@",[self quickSortArray:arr withLeftIndex:0 andRightIndex:arr.count - 1]);
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick)];
    [self.view addGestureRecognizer:tap];
}
- (void)viewClick{
    NSLog(@"dfghjkl;");
}
- (NSMutableArray *)quickSort:(NSMutableArray *)array{
    return [self quickSortArray:array withLeftIndex:0 andRightIndex:array.count - 1];
}

- (NSMutableArray *)quickSortArray:(NSMutableArray *)array withLeftIndex:(NSInteger)leftIndex andRightIndex:(NSInteger)rightIndex
{
    if (leftIndex >= rightIndex) {//如果数组长度为0或1时返回
        return array;
    }
    
    NSInteger i = leftIndex;
    NSInteger j = rightIndex;
    //记录比较基准数
    NSInteger key = [array[i] integerValue];
    
    while (i < j) {
        /**** 首先从右边j开始查找比基准数小的值 ***/
        while (i < j && [array[j] integerValue] >= key) {//如果比基准数大，继续查找
            j--;
        }
        //如果比基准数小，则将查找到的小值调换到i的位置
        [array exchangeObjectAtIndex:i withObjectAtIndex:j];
        /**** 当在右边查找到一个比基准数小的值时，就从i开始往后找比基准数大的值 ***/
        while (i < j && [array[i] integerValue] <= key) {//如果比基准数小，继续查找
            i++;
        }
        //如果比基准数大，则将查找到的大值调换到j的位置
        [array exchangeObjectAtIndex:j withObjectAtIndex:i];
    }
    
    /**** 递归排序 ***/
    //排序基准数左边的
    [self quickSortArray:array withLeftIndex:leftIndex andRightIndex:i - 1];
    //排序基准数右边的
    [self quickSortArray:array withLeftIndex:i + 1 andRightIndex:rightIndex];
    return array;
}
- (void)btnClick:(UIButton *)sender {
    ChildViewController *viewController = [[ChildViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
