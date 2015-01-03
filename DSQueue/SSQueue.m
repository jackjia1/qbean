//
//  SSQueue.m
//  NSQueue
//
//  This is a queue implemented with one stack which are implemented with NSMutableArrays.
//  This is used to compare preformance difference from DSQueue. Unless you only need a short
//  queue, it is recommended to use DSQueue which is implemented with two stacks.
//
//  Created by Jack Jia on 12/26/14.
//  Copyright (c) 2014 qbean. All rights reserved.
//

#import "SSQueue.h"

@implementation SSQueue
{
    NSMutableArray *oneStack;
}

- (instancetype)init
{
    self = [super init];
    if( !self ) return nil;
    oneStack = [[NSMutableArray alloc] init];
    return self;
}

- (instancetype)initWithArray:(NSArray *)array
{
    self = [super init];
    if( !self ) return nil;
    oneStack = [[NSMutableArray alloc] init];
    if ([array count]) {
        for (id anObject in [array reverseObjectEnumerator]) {
            [oneStack addObject:anObject];
        }
    }
    return self;
}

- (void)enqueue:(id)object
{
    [oneStack addObject:object];
}

- (id)dequeue
{
    if ([oneStack count]) {
        id firstObject = [oneStack firstObject];
        [oneStack removeObjectAtIndex:0];
        return firstObject;
    } 
    return nil;
}

- (id)peek:(NSUInteger)index
{
    return nil;
}

@end
