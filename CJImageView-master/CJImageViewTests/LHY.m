//
//  LHY.m
//  CJImageViewTests
//
//  Created by lhy on 2020/11/26.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "loadAinitializeTest.h"

@interface LHY : XCTestCase

@end

@implementation LHY

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}


-(void)testLHY{
    [loadAinitializeTest initializeTestBegin];
}



- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
