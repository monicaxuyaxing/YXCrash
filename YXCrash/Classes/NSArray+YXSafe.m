//
//  NSArray+YXSafe.m
//  YXCrash
//
//  Created by 徐亚杏 on 2019/3/25.
//  Copyright © 2019 徐亚杏. All rights reserved.
//

#import "NSArray+YXSafe.h"
#import "NSObject+YXSafe.h"

@implementation NSArray (YXSafe)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        /*class类方法*/
        [NSObject swizzleClassMethod:[self class] methodSEL_1:@selector(arrayWithObjects:count:) methodSEL_2:@selector(YXSafeArrayWithObjects:count:)];
        
        /*实例方法-分不同Array的类簇*/
        Class __NSArray = NSClassFromString(@"NSArray");
        Class __NSArrayI = NSClassFromString(@"__NSArrayI");
        Class __NSSingleObjectArrayI = NSClassFromString(@"__NSSingleObjectArrayI");
        Class __NSArray0 = NSClassFromString(@"__NSArray0");
        
        [NSObject swizzleInstanceMethod:__NSArray methodSEL_1:@selector(objectsAtIndexes:) methodSEL_2:@selector(YXSafeObjectsAtIndexes:)];
        
        //objectAtIndex:
        [NSObject swizzleInstanceMethod:__NSArrayI methodSEL_1:@selector(objectAtIndex:) methodSEL_2:@selector(NSArrayI_YXSafeObjectAtIndex:)];
        
        [NSObject swizzleInstanceMethod:__NSArray0 methodSEL_1:@selector(objectAtIndex:) methodSEL_2:@selector(NSArray0_YXSafeObjectAtIndex:)];
        
        [NSObject swizzleInstanceMethod:__NSSingleObjectArrayI methodSEL_1:@selector(objectAtIndex:) methodSEL_2:@selector(NSSingleObjectArrayI_YXSafeObjectAtIndex:)];
        
        //getObjects:range:
        [NSObject swizzleInstanceMethod:__NSArray methodSEL_1:@selector(getObjects:range:) methodSEL_2:@selector(NSArray_YXSafeGetObjects:range:)];
        
        [NSObject swizzleInstanceMethod:__NSArrayI methodSEL_1:@selector(getObjects:range:) methodSEL_2:@selector(NSArrayI_YXSafeGetObjects:range:)];
        
        [NSObject swizzleInstanceMethod:__NSSingleObjectArrayI methodSEL_1:@selector(getObjects:range:) methodSEL_2:@selector(NSSingleObjectArrayI_YXSafeGetObjects:range:)];
        
        // objectAtIndexedSubscript
        //        if ([[UIDevice currentDevice].systemVersion floatValue] >= 11.0)
        //        {
        [NSObject swizzleInstanceMethod:__NSArrayI methodSEL_1:@selector(objectAtIndexedSubscript:) methodSEL_2:@selector(NSArrayI_YXSafeObjectAtIndexedSubscript:)];
        //        }
    });
}

/**
 类方法初始化数组
 */
+ (instancetype)YXSafeArrayWithObjects:(const id  _Nonnull __unsafe_unretained *)objects count:(NSUInteger)cnt
{
    id instance = nil;
    
    @try {
        instance = [self YXSafeArrayWithObjects:objects count:cnt];
    }
    @catch (NSException *exception) {
        NSLog(@"exception = %@",exception);
        NSLog(@"数组初始化方法异常");
        //以下是对错误数据的处理，把为nil的数据去掉,然后初始化数组
        NSInteger newObjsIndex = 0;
        id  _Nonnull __unsafe_unretained newObjects[cnt];
        
        for (int i = 0; i < cnt; i++) {
            if (objects[i] != nil) {
                newObjects[newObjsIndex] = objects[i];
                newObjsIndex++;
            }
        }
        instance = [self YXSafeArrayWithObjects:newObjects count:newObjsIndex];
    }
    @finally {
        return instance;
    }
}

#pragma mark - objectsAtIndexes:
- (NSArray *)YXSafeObjectsAtIndexes:(NSIndexSet *)indexes {
    
    NSArray *returnArray = nil;
    @try {
        returnArray = [self YXSafeObjectsAtIndexes:indexes];
    } @catch (NSException *exception) {
        NSLog(@"exception = %@",exception);
        NSLog(@"ObjectsAtIndexes-方法异常");
        
    } @finally {
        return returnArray;
    }
}

#pragma mark - objectAtIndex:
//__NSArrayI  objectAtIndex:
- (id)NSArrayI_YXSafeObjectAtIndex:(NSUInteger)idx {
    id object = nil;
    
    @try {
        object = [self NSArrayI_YXSafeObjectAtIndex:idx];
    }
    @catch (NSException *exception) {
        NSLog(@"exception = %@",exception);
        NSLog(@"objectAtIndex-方法异常");
    }
    @finally {
        return object;
    }
    
}

//__NSArray0 objectAtIndex:
- (id)NSArray0_YXSafeObjectAtIndex:(NSUInteger)index {
    id object = nil;
    
    @try {
        object = [self NSArray0_YXSafeObjectAtIndex:index];
    }
    @catch (NSException *exception) {
        NSLog(@"exception = %@",exception);
        NSLog(@"objectAtIndex-方法异常");
    }
    @finally {
        return object;
    }
}

//__NSSingleObjectArrayI objectAtIndex:
- (id)NSSingleObjectArrayI_YXSafeObjectAtIndex:(NSUInteger)index {
    id object = nil;
    
    @try {
        object = [self NSSingleObjectArrayI_YXSafeObjectAtIndex:index];
    }
    @catch (NSException *exception) {
        NSLog(@"exception = %@",exception);
        NSLog(@"objectAtIndex-方法异常");
    }
    @finally {
        return object;
    }
}

#pragma mark - getObjects:range:
//NSArray getObjects:range:
- (void)NSArray_YXSafeGetObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    
    @try {
        [self NSArray_YXSafeGetObjects:objects range:range];
    } @catch (NSException *exception) {
        
        NSLog(@"exception = %@",exception);
        NSLog(@"getObjects:range:-方法异常");
        
    } @finally {
        
    }
}

//__NSArrayI  getObjects:range:
- (void)NSArrayI_YXSafeGetObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    
    @try {
        [self NSArrayI_YXSafeGetObjects:objects range:range];
    } @catch (NSException *exception) {
        
        NSLog(@"exception = %@",exception);
        NSLog(@"getObjects:range:-方法异常");
        
    } @finally {
        
    }
}

//__NSSingleObjectArrayI  getObjects:range:
- (void)NSSingleObjectArrayI_YXSafeGetObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    
    @try {
        [self NSSingleObjectArrayI_YXSafeGetObjects:objects range:range];
    } @catch (NSException *exception) {
        
        NSLog(@"exception = %@",exception);
        NSLog(@"getObjects:range:-方法异常");
        
    } @finally {
        
    }
}

#pragma mark - objectAtIndexedSubscript:
- (id)NSArrayI_YXSafeObjectAtIndexedSubscript:(NSUInteger)idx {
    id object = nil;
    
    @try {
        object = [self NSArrayI_YXSafeObjectAtIndexedSubscript:idx];
    }
    @catch (NSException *exception) {
        NSLog(@"exception = %@",exception);
        NSLog(@"NSArrayI_YXSafeObjectAtIndexedSubscript:-方法异常");
    }
    @finally {
        return object;
    }
    
}

@end


@implementation NSMutableArray (YXSafe)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class arrayMClass = NSClassFromString(@"__NSArrayM");
        
        //objectAtIndex:
        [NSObject swizzleInstanceMethod:arrayMClass methodSEL_1:@selector(objectAtIndex:) methodSEL_2:@selector(YXSafeObjectAtIndex:)];
        
        //setObject:atIndexedSubscript:
        [NSObject swizzleInstanceMethod:arrayMClass methodSEL_1:@selector(setObject:atIndexedSubscript:) methodSEL_2:@selector(YXSafeSetObject:atIndexedSubscript:)];
        
        //removeObjectAtIndex:
        [NSObject swizzleInstanceMethod:arrayMClass methodSEL_1:@selector(removeObjectAtIndex:) methodSEL_2:@selector(YXSafeRemoveObjectAtIndex:)];
        
        //insertObject:atIndex:
        [NSObject swizzleInstanceMethod:arrayMClass methodSEL_1:@selector(insertObject:atIndex:) methodSEL_2:@selector(YXSafeInsertObject:atIndex:)];
        
        //getObjects:range:
        [NSObject swizzleInstanceMethod:arrayMClass methodSEL_1:@selector(getObjects:range:) methodSEL_2:@selector(YXSafeGetObjects:range:)];
        
        //objectAtIndexedSubscript
        //        if ([[UIDevice currentDevice].systemVersion floatValue] >= 11.0)
        //        {
        [NSObject swizzleInstanceMethod:arrayMClass methodSEL_1:@selector(objectAtIndexedSubscript:) methodSEL_2:@selector(NSArrayM_YXSafeMuObjectAtIndexedSubscript:)];
        //        }
    });
}

#pragma mark - objectAtIndex:
- (id)YXSafeObjectAtIndex:(NSUInteger)index {
    id object = nil;
    
    @try {
        object = [self YXSafeObjectAtIndex:index];
    }
    @catch (NSException *exception) {
        NSLog(@"objectAtIndex = %@",exception);
        NSLog(@"objectAtIndex-方法异常");
    }
    @finally {
        return object;
    }
}

#pragma mark - get object from array
- (void)YXSafeSetObject:(id)obj atIndexedSubscript:(NSUInteger)idx {
    
    @try {
        [self YXSafeSetObject:obj atIndexedSubscript:idx];
    }
    @catch (NSException *exception) {
        NSLog(@"get object from array = %@",exception);
        NSLog(@"objectAtIndex-方法异常");
    }
    @finally {
        
    }
}

#pragma mark - removeObjectAtIndex:
- (void)YXSafeRemoveObjectAtIndex:(NSUInteger)index {
    @try {
        [self YXSafeRemoveObjectAtIndex:index];
    }
    @catch (NSException *exception) {
        NSLog(@"removeObjectAtIndex = %@",exception);
        NSLog(@"objectAtIndex-方法异常");
    }
    @finally {
        
    }
}

#pragma mark - set方法
- (void)YXSafeInsertObject:(id)anObject atIndex:(NSUInteger)index {
    @try {
        [self YXSafeInsertObject:anObject atIndex:index];
    }
    @catch (NSException *exception) {
        NSLog(@"set = %@",exception);
        NSLog(@"objectAtIndex-方法异常");
    }
    @finally {
        
    }
}

#pragma mark - getObjects:range:
- (void)YXSafeGetObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    
    @try {
        [self YXSafeGetObjects:objects range:range];
    } @catch (NSException *exception) {
        NSLog(@"getObjects = %@",exception);
        NSLog(@"objectAtIndex-方法异常");
        
    } @finally {
        
    }
}

#pragma mark - MuObjectAtIndexedSubscript:
- (id)NSArrayM_YXSafeMuObjectAtIndexedSubscript:(NSUInteger)idx {
    id object = nil;
    
    @try {
        object = [self NSArrayM_YXSafeMuObjectAtIndexedSubscript:idx];
    }
    @catch (NSException *exception) {
        NSLog(@"getObjects = %@",exception);
        NSLog(@"MuObjectAtIndexedSubscript-方法异常");
    }
    @finally {
        return object;
    }
    
}

@end
