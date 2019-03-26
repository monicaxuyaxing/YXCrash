//
//  NSObject+YXSafe.h
//  YXCrash
//
//  Created by 徐亚杏 on 2019/3/25.
//  Copyright © 2019 徐亚杏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (YXSafe)

// 类方法
+ (void)swizzleClassMethod:(Class)currentClass methodSEL_1:(SEL)methodSEL_1 methodSEL_2:(SEL)methodSEL_2;

// 实例方法
+ (void)swizzleInstanceMethod:(Class)currentClass methodSEL_1:(SEL)methodSEL_1 methodSEL_2:(SEL)methodSEL_2;

@end

NS_ASSUME_NONNULL_END
