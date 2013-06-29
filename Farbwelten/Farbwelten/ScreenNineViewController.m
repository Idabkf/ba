//
//  ScreenNineViewController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 07.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenNineViewController.h"

@interface ScreenNineViewController ()

@end

@implementation ScreenNineViewController

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
    
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen09-BelohnungPilz-pinki" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.mushroomView = [[UIImageView alloc]initWithImage:image];
    CGRect rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
    self.mushroomView.frame = rect;
    CGPoint point = CGPointMake(518, 389.75);
    [self.mushroomView setCenter:point];
    [(UIImageView *)self.view addSubview:self.mushroomView];

    [UIImageView animateWithDuration:2.0
                               delay:0.0
                             options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveEaseInOut
                          animations:^{
                              self.mushroomView.transform = CGAffineTransformMakeScale(0.8f, 0.8f);
                          }completion:^(BOOL finished){
                              self.mushroomView.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
                          }];
    
    
}

/*Weiterblättern immer möglich
 -(void) viewDidAppear:(BOOL)animated{
 [super viewDidAppear:animated];
 
 if (self.panEnabled) {
 //disable pageViews recognizer
 [self.rootViewController disablePan];
 self.panEnabled = NO;
 }
 }
 */

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
