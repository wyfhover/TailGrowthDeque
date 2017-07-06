//
//  ResponseDataDeque.h
//  portal
//
//  Created by apple on 16/3/7.
//  Copyright © 2016年 yantian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TailGrowthDeque<ObjectType> : NSObject

@property (strong, nonatomic) NSMutableArray *array;

- (instancetype) initWithCapacity:(NSUInteger) capacity;

- (ObjectType) element:(NSUInteger) idx;

- (ObjectType) first;

- (ObjectType) last;

- (void) addObject:(ObjectType) obj;

- (void) headPush:(NSArray<ObjectType> *)objs;

- (void) tailPush:(NSArray<ObjectType> *)objs;

- (void) freshPush:(NSArray<ObjectType> *)objs;

- (NSUInteger) count;

- (void) clean;

- (void) each:(BOOL (^)(id obj, NSUInteger idx, NSMutableArray *array)) block;

- (NSArray *) truncate:(NSInteger) start to:(NSInteger) end;

- (void)removeLastObject;

- (void)removeFirstObject;

- (void)removeObjectAtIndex:(NSUInteger)index;

- (NSUInteger)indexWithObject:(ObjectType)anObject;

@end
