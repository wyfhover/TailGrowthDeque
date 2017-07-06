//
//  Deque.m
//  portal
//
//  Created by apple on 16/3/7.
//  Copyright © 2016年 yantian. All rights reserved.
//

#import "TailGrowthDeque.h"

@interface TailGrowthDeque ()
@end

@implementation TailGrowthDeque {
//    NSMutableArray *_array;
}

- (instancetype) initWithCapacity:(NSUInteger) capacity {
    if (self = [super init]) {
        self.array = [[NSMutableArray alloc] initWithCapacity:capacity];
    }
    return self;
}

- (instancetype)init {
    if (self = [super init]) {
        self.array = [NSMutableArray array];
    }
    return self;
}

- (void) each:(BOOL (^)(id obj, NSUInteger idx, NSMutableArray *array)) block {
    NSUInteger size = self.array.count;
    
    for (int i = 0; i < size; i++) {
        if (!block(self.array[i], i, self.array)) {
            break;
        }
    }
}

- (id) element:(NSUInteger) idx {
    if (idx >= _array.count) {
        return nil;
    } else {
        return _array[idx];
    }
}

- (id) first {
    return [self element:0];
}

- (id) last {
    return [self element:(_array.count - 1)];
}

- (void) addObject:(id) obj {
    [_array addObject:obj];
}

- (void) headPush:(NSArray *)objs {
    @synchronized(self) {
        NSUInteger _capacity = objs.count + _array.count;
        NSMutableArray *_newArray = [[NSMutableArray alloc] initWithCapacity:_capacity];
        [_newArray addObjectsFromArray:objs];
        [_newArray addObjectsFromArray:_array];
        _array = _newArray;
    }
}

- (void) tailPush:(NSArray *)objs {
    @synchronized(self) {
        [_array addObjectsFromArray:objs];
    }
}

- (void) freshPush:(NSArray *)objs {
    @synchronized(self) {
        [_array removeAllObjects];
        [_array addObjectsFromArray:objs];
    }
}

- (NSUInteger) count {
    return _array.count;
}

- (void) clean {
    [_array removeAllObjects];
}

- (NSArray *) truncate:(NSInteger) start to:(NSInteger) end {
    return [_array subarrayWithRange:NSMakeRange(start, end - start)];
}

- (void)removeLastObject {
    if (_array.count != 0) {
        [_array removeLastObject];
    }
}

- (void)removeFirstObject {
    if (_array.count != 0) {
        [_array removeObjectAtIndex:0];
    }
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    if (index < _array.count) {
        [_array removeObjectAtIndex:index];
    }
}

- (NSUInteger)indexWithObject:(id)anObject {
    if (_array.count != 0) {
        return [_array indexOfObject:anObject];
    }
    return 0;
}

@end
