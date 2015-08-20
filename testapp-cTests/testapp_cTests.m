//
//  testapp_cTests.m
//  testapp-cTests
//
//  Created by West on 6/19/15.
//  Copyright (c) 2015 misfit. All rights reserved.
//

//#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Hello.h"

@interface testapp_cTests : XCTestCase

@end

@implementation testapp_cTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
    Hello *hello = [[Hello alloc] init];
    Hello *new_hello = [hello return_hello];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
