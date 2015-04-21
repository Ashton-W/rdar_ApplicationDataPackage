//
//  ApplicationPackageTests.m
//  ApplicationPackageTests
//
//  Created by Ashton Williams on 20/04/2015.
//  Copyright (c) 2015 Ashton-W. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "CoreDataStack.h"

@interface ApplicationPackageTests : XCTestCase

@property (nonatomic) XCTestExpectation *locationExpectation;

@end

@implementation ApplicationPackageTests

- (void)testThereIsData
{
    NSManagedObjectContext *moc = [CoreDataStack sharedInstance].managedObjectContext;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:moc];
    fetchRequest.entity = entity;

    NSUInteger count = [moc countForFetchRequest:fetchRequest error:NULL];
    NSLog(@"\n\nCount: %ld\n\n", (unsigned long)count);
    
    XCTAssertTrue(count > 0);
}

@end
