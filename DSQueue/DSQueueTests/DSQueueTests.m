//
//  DSQueueTests.m
//  DSQueueTests
//
//  Created by Jack Jia on 12/26/14.
//  Copyright (c) 2014 qbean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "DSQueue.h"
#import "SSQueue.h"

#define TEST_COUNT 100000

@interface DSQueueTests : XCTestCase

@end

@implementation DSQueueTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testPerformanceDequeueForSSQueue {
    [self measureMetrics:[[self class] defaultPerformanceMetrics] automaticallyStartMeasuring:NO forBlock:^{
        // Create a single stack queue with n NSNumber objects
        SSQueue *ssq = [self makeSSQueue:TEST_COUNT];
        
        // Measure dequeue
        [self startMeasuring];
        
        // Dequeue until the queue is empty
        while ([ssq dequeue]);
        
        [self stopMeasuring];
    }];
}

- (void)testPerformanceDequeueForDSQueue {
    [self measureMetrics:[[self class] defaultPerformanceMetrics] automaticallyStartMeasuring:NO forBlock:^{
        // Create double stack queue with n NSNumber objects
        DSQueue *dsq = [self makeDSQueue:TEST_COUNT];
        
        // Measure dequeue
        [self startMeasuring];
        
        // Dequeue until the queue is empty
        while ([dsq dequeue]);
        
        [self stopMeasuring];
    }];
}

- (void)testPerformanceArrayRemoveFirst {
    [self measureMetrics:[[self class] defaultPerformanceMetrics] automaticallyStartMeasuring:NO forBlock:^{
        // Create an array with n NSNumber objects
        NSMutableArray *a = [self makeArray:TEST_COUNT];
        
        // Start to measure remove first
        [self startMeasuring];
        
        // Remove first object until array is empty
        while (a.count > 0)
            [a removeObjectAtIndex:0];
        
        [self stopMeasuring];
    }];
}

- (void)testPerformanceArrayRemoveLast {
    [self measureMetrics:[[self class] defaultPerformanceMetrics] automaticallyStartMeasuring:NO forBlock:^{
        // Create an array with n NSNumber objects
        NSMutableArray *a = [self makeArray:TEST_COUNT];
        
        // Start to measure remove last
        [self startMeasuring];
        
        // Remove first object until array is empty
        while (a.count > 0)
            [a removeLastObject];
        
        [self stopMeasuring];
    }];
}

- (SSQueue *)makeSSQueue:(int)count {
    SSQueue *ssq = [SSQueue new];
    while (count) {
        [ssq enqueue:[NSNumber numberWithInt:count--]];
    }
    return ssq;
}

- (DSQueue *)makeDSQueue:(int)count {
    DSQueue *dsq = [DSQueue new];
    while (count) {
        [dsq enqueue:[NSNumber numberWithInt:count--]];
    }
    return dsq;
}

- (NSMutableArray *)makeArray:(int)count {
    NSMutableArray *a = [NSMutableArray new];
    while (count) {
        [a addObject:[NSNumber numberWithInt:count--]];
    }
    return a;
}

@end
