//
//  ScreenSixteenViewController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 16.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenSixteenViewController.h"

@interface ScreenSixteenViewController ()

@end

@implementation ScreenSixteenViewController

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
    
    
    
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen16-Belohnung-spiralauge" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.eyeView = [[UIImageView alloc]initWithImage:image];
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    self.eyeView.frame = rect;
    CGPoint point = CGPointMake(512, 384.0f);
    [self.eyeView setCenter:point];
    [self.view addSubview:self.eyeView];
    
    [UIImageView animateWithDuration:2.0
                               delay:0.0
                             options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveEaseInOut
                          animations:^{
                              self.eyeView.transform = CGAffineTransformMakeScale(0.8f, 0.8f);
                          }completion:^(BOOL finished){
                              self.eyeView.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
                          }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
