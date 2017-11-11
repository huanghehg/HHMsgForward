//
//  HHTestMsgForwardProxy.m
//  HHMsgForward
//
//  Created by 黄河 on 2017/11/11.
//  Copyright © 2017年 huanghe. All rights reserved.
//

#import "HHTestMsgForwardProxy.h"

@interface HHTestMsgForwardProxy ()

@property (nonatomic, strong)NSArray *targets;

@end

@implementation HHTestMsgForwardProxy

- (instancetype)initWithTargets:(NSArray *)targets {
    self = [super init];
    if (self) {
        self.targets = targets;
    }
    return self;
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    if ([super respondsToSelector:aSelector]) {
        return YES;
    }
    
    for (id target in self.targets) {
        if ([target respondsToSelector:aSelector]) {
            return YES;
        }
    }
    return NO;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *sign = [super methodSignatureForSelector:aSelector];
    if (!sign) {
        for (id target in self.targets) {
            sign = [target methodSignatureForSelector:aSelector];
            if (sign) {
                break;
            }
        }
    }
    return sign;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    for (id target in self.targets) {
        if ([target respondsToSelector:anInvocation.selector]) {
            [anInvocation invokeWithTarget:target];
        }
    }
}

-(void)dealloc {
    NSLog(@"%s",__func__);
}

@end
