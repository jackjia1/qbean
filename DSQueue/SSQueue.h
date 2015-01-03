//
//  SSQueue.h
//  NSQueue
//
//  Created by Jack Jia on 12/26/14.
//  Copyright (c) 2014 qbean. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSQueue : NSObject

- (instancetype)init;
- (instancetype)initWithArray:(NSArray *)array;

- (void)enqueue:(id)object;
- (id)dequeue;
- (id)peek:(NSUInteger)index;

@end
