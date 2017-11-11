//
//  HHTestMsgForward.m
//  HHMsgForward
//
//  Created by 黄河 on 2017/11/10.
//  Copyright © 2017年 huanghe. All rights reserved.
//

#import "HHTestMsgForward.h"
#import <objc/runtime.h>

@implementation HHTestMsgForward

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *methodSignature = [super methodSignatureForSelector:aSelector];
    if (!methodSignature) {
        //此处消息转发调用
        return [self methodSignatureForSelector:@selector(forwardResponse)];
    }
    return methodSignature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocatio{
    anInvocatio.selector = @selector(forwardResponse);
    [anInvocatio invoke];
}

- (void)forwardResponse {
    NSLog(@"%s",__func__);
}

@end
