//
//  HHTestMsgForwardView.h
//  HHMsgForward
//
//  Created by 黄河 on 2017/11/10.
//  Copyright © 2017年 huanghe. All rights reserved.
//

#import <UIKit/UIKit.h>

///正常撸代码把这个protocol独立出去

@protocol HHTestMsgForwardViewDataProxy <NSObject>

- (NSString *)showName;

@end

@interface HHTestMsgForwardView : UIView

- (instancetype)initWithFrame:(CGRect)frame target:(id)target;

@property (nonatomic, strong)NSArray<HHTestMsgForwardViewDataProxy> *dataArray;

@end
