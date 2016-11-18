//
//  TestController.m
//  DVVMovingTextView
//
//  Created by 大威 on 16/6/16.
//  Copyright © 2016年 devdawei. All rights reserved.
//

#import "TestController.h"
#import "DVVMovingTextView.h"

@interface TestController ()

@property (nonatomic, strong) DVVMovingTextView *movingTextView;

@end

@implementation TestController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _movingTextView = [DVVMovingTextView new];
    _movingTextView.movingText = @"公告：我是公告";
    
    [self.view addSubview:_movingTextView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            _movingTextView.movingText = @"新公告：我是新公告我是新公告";
        });
    });
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    _movingTextView.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 30);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    
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
