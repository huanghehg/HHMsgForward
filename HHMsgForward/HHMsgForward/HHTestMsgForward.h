//
//  HHTestMsgForward.h
//  HHMsgForward
//
//  Created by 黄河 on 2017/11/10.
//  Copyright © 2017年 huanghe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HHTestMsgForward : NSObject

- (void)forward;
- (void)forwardWithData:(id)data;
- (id)dataByForwardWithData:(id)data;

@end
