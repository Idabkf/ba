//
//  ModelController.h
//  Farbwelten
//
//  Created by Ida Buchwald on 31.05.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataViewController;
@class ScreenViewController;
@class RootViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>

@property (strong,nonatomic) RootViewController *rootViewController;

@property int numberOfScreens;
@property int numberOfFinishedScreens;

@property NSMutableArray *screenViews;

- (DataViewController *)dataViewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (ScreenViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (ScreenViewController *)newViewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(DataViewController *)viewController;

@end
