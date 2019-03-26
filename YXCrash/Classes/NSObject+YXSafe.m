//
//  NSObject+YXSafe.m
//  YXCrash
//
//  Created by 徐亚杏 on 2019/3/25.
//  Copyright © 2019 徐亚杏. All rights reserved.
//

#import "NSObject+YXSafe.h"

@implementation NSObject (YXSafe)
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //setValue:forKey:
        [NSObject swizzleInstanceMethod:[self class] methodSEL_1:@selector(setValue:forKey:) methodSEL_2:@selector(YXSafeSetValue:forKey:)];
        
        //setValue:forKeyPath:
        [NSObject swizzleInstanceMethod:[self class] methodSEL_1:@selector(setValue:forKeyPath:) methodSEL_2:@selector(YXSafeSetValue:forKeyPath:)];
    });
}

// 类方法
+ (void)swizzleClassMethod:(Class)currentClass methodSEL_1:(SEL)methodSEL_1 methodSEL_2:(SEL)methodSEL_2
{
    Method method1 = class_getClassMethod(currentClass, methodSEL_1);
    Method method2 = class_getClassMethod(currentClass, methodSEL_2);
    method_exchangeImplementations(method1, method2);
}

// 实例方法
+ (void)swizzleInstanceMethod:(Class)currentClass methodSEL_1:(SEL)methodSEL_1 methodSEL_2:(SEL)methodSEL_2
{
    Method originalMethod = class_getInstanceMethod(currentClass, methodSEL_1);
    Method swizzledMethod = class_getInstanceMethod(currentClass, methodSEL_2);
    
    BOOL isAddMethod = class_addMethod(currentClass, methodSEL_1, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (isAddMethod)
    {
        class_replaceMethod(currentClass, methodSEL_2, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }
    else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

#pragma mark - setValue:forKey:
- (void)YXSafeSetValue:(id)value forKey:(NSString *)key {
    @try {
        [self YXSafeSetValue:value forKey:key];
    }
    @catch (NSException *exception) {
        NSLog(@"exception = %@",exception);
        NSLog(@"setValue-方法异常");
    }
    @finally {
        
    }
}

#pragma mark - setValue:forKeyPath:
- (void)YXSafeSetValue:(id)value forKeyPath:(NSString *)keyPath {
    @try {
        [self YXSafeSetValue:value forKeyPath:keyPath];
    }
    @catch (NSException *exception) {
        NSLog(@"exception = %@",exception);
        NSLog(@"setValueforKeyPath-方法异常");
    }
    @finally {
        
    }
}
@end
