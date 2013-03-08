//
//  JLTSegueDemoTests.m
//  JLTSegueDemoTests
//
//  Created by Jeffery Thomas on 2/23/13.
//  Copyright (c) 2013 JLT Source. All rights reserved.
//

#import "JLTSegueDemoTests.h"
#import "JLTTabSegue.h"

@implementation JLTSegueDemoTests

- (UITabBarController *)tabBarController
{
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    return (UITabBarController *)window.rootViewController;
}

- (UIViewController *)topViewControllerAtIndex:(NSUInteger)index
{
    UINavigationController *navController = [self tabBarController].viewControllers[index];
    return navController.topViewController;
}

- (void)testRootViewController
{
    STAssertTrue([[self tabBarController] isKindOfClass:[UITabBarController class]], nil);
}

- (void)testTabSegueWithChooser
{
    UIViewController *source = [self topViewControllerAtIndex:0];
    STAssertTrue([source respondsToSelector:@selector(indexOfDestinationViewControllerForTabSegueIdentifier:)], nil);

    JLTTabSegue *segue = [[JLTTabSegue alloc] initWithIdentifier:@"tab3" source:source destination:nil];

    STAssertEqualObjects(segue.destinationViewController, [self tabBarController].viewControllers[1], nil);
}

- (void)testTabSegueWithIdentifierNoSpace
{
    UIViewController *source = [self topViewControllerAtIndex:1];
    STAssertFalse([source respondsToSelector:@selector(indexOfDestinationViewControllerForTabSegueIdentifier:)], nil);

    JLTTabSegue *segue = [[JLTTabSegue alloc] initWithIdentifier:@"tab0" source:source destination:nil];

    STAssertEqualObjects(segue.destinationViewController, [self tabBarController].viewControllers[0], nil);
}

- (void)testTabSegueWithIdentifierWithSpace
{
    UIViewController *source = [self topViewControllerAtIndex:1];
    STAssertFalse([source respondsToSelector:@selector(indexOfDestinationViewControllerForTabSegueIdentifier:)], nil);

    JLTTabSegue *segue = [[JLTTabSegue alloc] initWithIdentifier:@"tab 0" source:source destination:nil];

    STAssertEqualObjects(segue.destinationViewController, [self tabBarController].viewControllers[0], nil);
}

- (void)testTabSegueWithIdentifierWithMultipleSpacesHyphensAndUnderscores
{
    UIViewController *source = [self topViewControllerAtIndex:1];
    STAssertFalse([source respondsToSelector:@selector(indexOfDestinationViewControllerForTabSegueIdentifier:)], nil);

    JLTTabSegue *segue = [[JLTTabSegue alloc] initWithIdentifier:@"tab - _ - _ - 0" source:source destination:nil];

    STAssertEqualObjects(segue.destinationViewController, [self tabBarController].viewControllers[0], nil);
}

- (void)testTabSegueWithLongIdentifier
{
    UIViewController *source = [self topViewControllerAtIndex:1];
    STAssertFalse([source respondsToSelector:@selector(indexOfDestinationViewControllerForTabSegueIdentifier:)], nil);

    JLTTabSegue *segue = [[JLTTabSegue alloc] initWithIdentifier:@"Foo tab 0 Bar" source:source destination:nil];

    STAssertEqualObjects(segue.destinationViewController, [self tabBarController].viewControllers[0], nil);
}

- (void)testTabSegueFailureWithPrefixedCharacter
{
    UIViewController *source = [self topViewControllerAtIndex:1];
    STAssertFalse([source respondsToSelector:@selector(indexOfDestinationViewControllerForTabSegueIdentifier:)], nil);

    JLTTabSegue *segue = nil;
    STAssertThrows(segue = [[JLTTabSegue alloc] initWithIdentifier:@"stab 0" source:source destination:nil], nil);
    STAssertNil(segue, nil);
}

- (void)testTabSegueFailureWithSuffixedCharacter
{
    UIViewController *source = [self topViewControllerAtIndex:1];
    STAssertFalse([source respondsToSelector:@selector(indexOfDestinationViewControllerForTabSegueIdentifier:)], nil);

    JLTTabSegue *segue = nil;
    STAssertThrows(segue = [[JLTTabSegue alloc] initWithIdentifier:@"tab 0s" source:source destination:nil], nil);
    STAssertNil(segue, nil);
}

@end
