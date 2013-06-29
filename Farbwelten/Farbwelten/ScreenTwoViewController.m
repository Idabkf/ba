//
//  ScreenTwoViewController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 31.05.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenTwoViewController.h"

@interface ScreenTwoViewController ()

@end

@implementation ScreenTwoViewController

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
	NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen02-Stadt-wischbar_stadt" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];

    
    self.cityView = [[UIImageView alloc]initWithImage:image];
    CGRect rect = CGRectMake(-30, 0, image.size.width/2, image.size.height/2);
    self.cityView.frame = rect;
    //CGPoint point = CGPointMake(512.0f, 393.25f);
    //[self.cityView setCenter:point];
    
    rect = CGRectMake(0, 0, 1536.0f, 2048.0f);
    self.rotationView = [[UIView alloc] initWithFrame:rect];
    [self.view addSubview:self.rotationView];
    
    [self.rotationView addSubview:self.cityView];
    [self.cityView setUserInteractionEnabled:YES];
    [self.rotationView setUserInteractionEnabled:YES];
    
    //GestureRecognizer Tap
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    tapRecognizer.delegate = self;
    [self.cityView addGestureRecognizer:tapRecognizer];
    [(UIImageView *)self.view addSubview:self.cityView];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer{
    NSLog(@"TAPPED");
    //for (float i = 0; i<5; i++) {
        self.rotationView.transform = CGAffineTransformMakeRotation(0.0f);
    //CGPoint tmp = self.cityView.center;
    //self.cityView.center = CGPointMake(768.0f, 512.0f);
        CGFloat angle = 6.0f;
        [UIView animateWithDuration:3.0
                              delay:0.0
                            options:UIViewAnimationOptionAutoreverse
                         animations:^{
                             self.rotationView.transform = CGAffineTransformMakeRotation(angle);
                         }
                         completion:^(BOOL finished){
                             self.rotationView.transform = CGAffineTransformMakeRotation(0.0f);
                             //self.rotationView.center = tmp;
                         }];
        /*[UIView animateWithDuration:3.0
                              delay:0.0
                            options:nil
                         animations:^{
                             self.cityView.transform = CGAffineTransformMakeRotation(0.0f);
                         }
                         completion:nil];
         */
    //}
    
    
}


@end
