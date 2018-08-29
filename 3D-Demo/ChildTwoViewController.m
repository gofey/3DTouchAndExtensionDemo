//
//  ChildTwoViewController.m
//  3D-Demo
//
//  Created by gofeyLee on 2018/5/23.
//  Copyright © 2018年 gofeyLee. All rights reserved.
//

#import "ChildTwoViewController.h"

@interface ChildTwoViewController ()
@property(nonatomic, strong) UILabel *label;
@end

@implementation ChildTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (self.content) {
        self.label.text = self.content;
    }
}
-(UILabel *)label{
    if (!_label) {
        _label = ({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 150, 200 , 300, 45)];
            [self.view addSubview:label];
            self.view.backgroundColor = [UIColor whiteColor];
            label.text = @"用来区分是否是3D Touch方式进入页面";
            label.textAlignment = NSTextAlignmentCenter;
            label;
        });
    }
    return _label;
}
#pragma mark - 预览Action代理
- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {
    
    NSMutableArray *arrItem = [NSMutableArray array];
    
    UIPreviewAction *previewAction0 = [UIPreviewAction actionWithTitle:@"取消" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
        NSLog(@"didClickCancel");
    }];
    
    UIPreviewAction *previewAction1 = [UIPreviewAction actionWithTitle:@"做你想做的" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"做你想做的");
        //可利用通知或者block方式，让上一级页面做出反应
    }];
    
    [arrItem addObjectsFromArray:@[previewAction0 ,previewAction1]];
    
    return arrItem;
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
