//
//  NSNull+Addition.m
//  CJSX
//
//  Created by 何振东 on 14-4-24.
//  Copyright (c) 2014年 CJTX. All rights reserved.
//

#import "NSNull+Addition.h"

@implementation NSNull (Addition)

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    if ([self respondsToSelector:[anInvocation selector]]) {
        [anInvocation invokeWithTarget:self];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *signature = [[NSNull class] instanceMethodSignatureForSelector:aSelector];
    if (!signature) {
        signature = [NSMethodSignature signatureWithObjCTypes:"@^v^c"];
    }
    return signature;
}

@end
