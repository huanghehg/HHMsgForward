//
//  ViewController.m
//  HHMsgForward
//
//  Created by 黄河 on 2017/11/10.
//  Copyright © 2017年 huanghe. All rights reserved.
//

#import "ViewController.h"
#import "HHTestMsgForward.h"
#import "HHTestMsgForwardView.h"
#import "HHData.h"

@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    HHTestMsgForward *forward = [[HHTestMsgForward alloc] init];
//    [forward performSelector:@selector(forward) withObject:nil];
    
    HHTestMsgForwardView *forwardView = [[HHTestMsgForwardView alloc] initWithFrame:self.view.bounds target:self];
    [self.view addSubview:forwardView];
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i =0; i < 20; i ++) {
        HHData *data = [[HHData alloc] init];
        data.name = [NSString stringWithFormat:@"test%d",i];
        [array addObject:data];
    }
    forwardView.dataArray = array;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%s",__func__);
}


@end
