//
//  HHTestMsgForwardView.m
//  HHMsgForward
//
//  Created by 黄河 on 2017/11/10.
//  Copyright © 2017年 huanghe. All rights reserved.
//

#import "HHTestMsgForwardView.h"
#import "HHTestMsgForwardProxy.h"

@interface HHTestMsgForwardView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, weak)id target;

@property (nonatomic, strong)HHTestMsgForwardProxy *proxy;

@end

@implementation HHTestMsgForwardView

- (void)configView {
    [self addSubview:self.tableView];
}

- (instancetype)initWithFrame:(CGRect)frame target:(id)target {
    self = [super initWithFrame:frame];
    if (self) {
        self.target = target;
        self.proxy = [[HHTestMsgForwardProxy alloc] initWithTargets:@[self,self.target]];
        [self configView];
    }
    return self;
}

#pragma mark -- UITableViewDelegate,UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%s",__func__);
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s",__func__);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    id <HHTestMsgForwardViewDataProxy> data = self.dataArray[indexPath.row];
    cell.textLabel.text = [data showName];
    return cell;
}

#pragma mark -- setter && getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.frame];
        _tableView.delegate = (id<UITableViewDelegate>)self.proxy;
        _tableView.rowHeight = 44;
        _tableView.dataSource = (id<UITableViewDataSource>)self.proxy;
    }
    return _tableView;
}

- (void)setDataArray:(NSArray<HHTestMsgForwardViewDataProxy> *)dataArray {
    _dataArray = dataArray;
    [self.tableView reloadData];
}

@end

