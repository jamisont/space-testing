//
//  FridayChallengeWeek4UITests.m
//  FridayChallengeWeek4UITests
//
//  Created by Tatiana Jamison on 10/23/15.
//  Copyright © 2015 Bit Lore Institute. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface FridayChallengeWeek4UITests : XCTestCase

@end

@implementation FridayChallengeWeek4UITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testEditing
{
    // write tests to verify editing function
    
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *button = app.buttons[@"+"];
    [button tap];
    
    XCUIElement *textField = [[[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"ThirdVC"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeTextField].element;
    [textField tap];
    [textField typeText:@"jupiter"];
    [button tap];
    [app.tables.staticTexts[@"jupiter"] tap];
    [app.buttons[@"Edit"] tap];
    [app.textFields[@"editTextField"] typeText:@"saturn"];
    [app.buttons[@"Save"] tap];
    
}

- (void)testAdding
{
    // write tests to verify adding function
}

@end
