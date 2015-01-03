//
//  DSQueue.m
//  NSQueue
//
//  This is a queue implemented with two stacks which are implemented with NSMutableArrays.
//  The reason for using two stacks is the following: if we implement a queue with one
//  NSMutableArray, we have to remove the first object in dequeue, but it is inefficient
//  to remove the first object from an NSMutableArray because of the shifting after the
//  removal, especially when the array is long. We can avoid the removal of the first
//  object if we use two stacks.
//
//  Created by Jack Jia on 12/25/14.
//  Copyright (c) 2014 qbean. All rights reserved.
//

#import "DSQueue.h"

@implementation DSQueue
{
    NSMutableArray *inStack;
    NSMutableArray *outStack;
}

- (instancetype)init
{
    self = [super init];
    if( !self ) return nil;
    inStack = [[NSMutableArray alloc] init];
    outStack = [[NSMutableArray alloc] init];
    return self;
}

- (instancetype)initWithArray:(NSArray *)array
{
    self = [super init];
    if( !self ) return nil;
    inStack = [[NSMutableArray alloc] init];
    outStack = [[NSMutableArray alloc] init];
    if ([array count]) {
        for (id anObject in array) {
            [outStack addObject:anObject];
        }
    }
    return self;
}

- (void)enqueue:(id)object
{
    // Put object on outStack if both stack are empty.
    if (![inStack count] && ![outStack count]) {
        [outStack addObject:object];
    } else {
        [inStack addObject:object];
    }
}

- (id)dequeue
{
    if ([outStack count]) {
        id lastObject = [outStack lastObject];
        [outStack removeLastObject];
        return lastObject;
    } else if ([inStack count]) {
        for (id anObject in [inStack reverseObjectEnumerator]) {
            [outStack addObject:anObject];
        }
        [inStack removeAllObjects];
        id lastObject = [outStack lastObject];
        [outStack removeLastObject];
        return lastObject;
    }
    return nil;
}

- (id)peek:(NSUInteger)index
{
    return nil;
}

@end
