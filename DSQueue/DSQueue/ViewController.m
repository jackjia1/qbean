//
//  ViewController.m
//  DSQueue
//
//  Created by Jack Jia on 12/26/14.
//  Copyright (c) 2014 qbean. All rights reserved.
//

#import "ViewController.h"

#define TEST_COUNT 10000000

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self testPerformanceArrayRemoveFirst];
    [self testPerformanceArrayRemoveLast];
    
    NSLog(@"========== Call with reverse order ==========");
    [self testPerformanceArrayRemoveLast];
    [self testPerformanceArrayRemoveFirst];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testPerformanceArrayRemoveFirst {
    // Create an array with n NSNumber objects
    NSMutableArray *a = [self makeArray:TEST_COUNT];
    
    NSLog(@"Array count: %d", (int)a.count);
    
    // Start to measure remove first
    NSDate *startTime = [NSDate date];
    
    // Remove first object until array is empty
    while (a.count > 0)
        [a removeObjectAtIndex:0];
    
    NSDate *endTime = [NSDate date];
    
    NSLog(@"Array count: %d", (int)a.count);
    NSLog(@"testPerformanceArrayRemoveFirst: %f", endTime.timeIntervalSince1970 - startTime.timeIntervalSince1970);
}

- (void)testPerformanceArrayRemoveLast {
    // Create an array with n NSNumber objects
    NSMutableArray *a = [self makeArray:TEST_COUNT];
    
    NSLog(@"Array count: %d", (int)a.count);
    
    // Start to measure remove last
    NSDate *startTime = [NSDate date];
    
    // Remove last object until array is empty
    while (a.count > 0)
        [a removeLastObject];
    
    NSDate *endTime = [NSDate date];
    
    NSLog(@"Array count: %d", (int)a.count);
    NSLog(@"testPerformanceArrayRemoveLast: %f", endTime.timeIntervalSince1970 - startTime.timeIntervalSince1970);
}

- (NSMutableArray *)makeArray:(int)count {
    NSMutableArray *a = [NSMutableArray new];
    while (count) {
        [a addObject:[NSNumber numberWithInt:count--]];
    }
    return a;
}

@end
