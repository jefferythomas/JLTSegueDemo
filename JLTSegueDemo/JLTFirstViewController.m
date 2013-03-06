//
//  JLTFirstViewController.m
//  JLTSegueDemo
//
//  Created by Jeffery Thomas on 2/23/13.
//  Copyright (c) 2013 JLT Source. All rights reserved.
//

#import "JLTFirstViewController.h"

@interface JLTFirstViewController ()

@end

@implementation JLTFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark JLTTabSegueViewControllerChooser

- (NSUInteger)indexOfDestinationViewControllerForTabSegueIdentifier:(NSString *)identifier
{
    return 1;
}

@end
