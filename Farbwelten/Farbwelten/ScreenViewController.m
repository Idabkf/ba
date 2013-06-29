//
//  ScreenViewController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 31.05.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenViewController.h"


@interface ScreenViewController ()

@end

@implementation ScreenViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    CGRect bounds = CGRectMake(0.0f, 0.0f, 1536.0f, 2048.0f);
    [self.view setBounds:bounds];
    self.panEnabled = YES;
    //NSLog(@"BOUNDS X: %f Y: %f", self.view.bounds.size.width, self.view.bounds.size.height);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) getReceiveTouch{
    return self.receiveTouch;
}

@end
