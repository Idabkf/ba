//
//  ScreenThreeViewController.h
//  Farbwelten
//
//  Created by Ida Buchwald on 31.05.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenViewController.h"

@interface ScreenThreeViewController : ScreenViewController

@property int *imageFlg;
@property(strong, nonatomic) UIImageView *boxViewOne;
@property(strong, nonatomic) UIImageView *boxViewTwo;
@property(strong, nonatomic) UIImageView *boxViewThree;
@property(strong, nonatomic) UIImageView *boxViewFour;
@property(strong, nonatomic) UIImageView *boxViewFive;

@property BOOL *tap1Locked;
@property BOOL *tap2Locked;
@property BOOL *tap3Locked;
@property BOOL *tap4Locked;
@property BOOL *tap5Locked;

@property NSMutableArray *tapsLocked;
@property NSMutableArray *boxViews;

@property UITapGestureRecognizer *tapRecognizer;


- (void)handleTap:(UITapGestureRecognizer *)recognizer;

@end
