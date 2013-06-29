//
//  ModelController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 31.05.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ModelController.h"

#import "DataViewController.h"
#import "ScreenViewController.h"

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */

@interface ModelController()
@property (readonly, strong, nonatomic) NSMutableArray *pageData;
@end

@implementation ModelController

- (id)init
{
    self = [super init];
    if (self) {
        
        self.numberOfScreens = 24;
        self.numberOfFinishedScreens = 15;
        
        // Create the data model.
        /*_pageData = [NSArray array];
        for (int i = 0; i<25; i++) {
            [_pageData arrayByAddingObject:[NSNumber numberWithInt:i]];
        }
        */
        _pageData = [[NSMutableArray alloc] initWithCapacity:self.numberOfScreens];
        for (int i = 0; i<=self.numberOfScreens; i++) {
            [_pageData addObject:[NSNumber numberWithInt:i]];
        }
        
        
        self.screenViews = [[NSMutableArray alloc] init];
    }
    return self;
}

- (DataViewController *)dataViewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard
{   
    // Return the data view controller for the given index.
    if (([self.pageData count] == 0) || (index >= [self.pageData count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    DataViewController *dataViewController = [storyboard instantiateViewControllerWithIdentifier:@"DataViewController"];
    dataViewController.dataObject = self.pageData[index];
    return dataViewController;
}

- (ScreenViewController *)newViewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard
{
    /*
    // Return the data view controller for the given index.
    if (([self.pageData count] == 0) || (index >= [self.pageData count])) {
        return nil;
    }
    */
    // Create a new screen view controller and pass suitable data.
    
    NSString *identifier = @"0";
    
    if (index<=self.numberOfFinishedScreens) {
        identifier = [NSString stringWithFormat:@"%i", index];
    }
    
    /*The 10th screen is the same as the 17th and the 24th. In each case -1 because screen 5 is missing and -1 because starting with 0*/
    if (index == 15) {
        ScreenViewController *screenViewController = [self.screenViews objectAtIndex:8];
        screenViewController.dataObject = self.pageData[index];
        screenViewController.rootViewController = self.rootViewController;
        [self.screenViews addObject:screenViewController];
        return screenViewController;
    }
    
    if (index == 22) {
        ScreenViewController *screenViewController = [self.screenViews objectAtIndex:15];
        screenViewController.dataObject = self.pageData[index];
        screenViewController.rootViewController = self.rootViewController;
        [self.screenViews addObject:screenViewController];
        return screenViewController;
    }
    
    ScreenViewController *screenViewController = [storyboard instantiateViewControllerWithIdentifier:identifier];
    screenViewController.dataObject = self.pageData[index];
    screenViewController.rootViewController = self.rootViewController;
    [self.screenViews addObject:screenViewController];
    return screenViewController;
}

- (ScreenViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard{
    
    if (index>self.numberOfFinishedScreens) {
        return [self.screenViews objectAtIndex:1];
    }
    
    if (self.screenViews.count>index) {
        return [self.screenViews objectAtIndex:index];
    }
    else return [self newViewControllerAtIndex:index storyboard:storyboard];
}

- (NSUInteger)indexOfViewController:(ScreenViewController *)viewController
{   
     // Return the index of the given data view controller.
     // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
    return [self.pageData indexOfObject:viewController.dataObject];
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(ScreenViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(ScreenViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageData count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}




@end
