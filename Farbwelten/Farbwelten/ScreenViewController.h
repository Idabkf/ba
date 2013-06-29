//
//  ScreenViewController.h
//  Farbwelten
//
//  Created by Ida Buchwald on 31.05.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RootViewController;

@interface ScreenViewController : UIViewController

@property (strong,nonatomic) RootViewController *rootViewController;
@property BOOL panEnabled;

@property (strong, nonatomic) id dataObject;

@property BOOL receiveTouch;

- (BOOL) getReceiveTouch;

@end
