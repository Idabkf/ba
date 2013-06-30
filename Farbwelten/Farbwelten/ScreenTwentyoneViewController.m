//
//  ScreenTwentyoneViewController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 29.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenTwentyoneViewController.h"
#import "RootViewController.h"

@interface ScreenTwentyoneViewController ()

@end

@implementation ScreenTwentyoneViewController

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
    self.rectLeft = CGRectMake(0.0f, 0.0f, 100.0f, 768.0f);
    self.rectRight = CGRectMake(924.0f, 0.0f, 100.0f, 768.0f);
    
    // Adjust the image
    
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen21-RAETSEL-3-vIda_mitKorken" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.backgroundView = [[UIImageView alloc] initWithImage:image];
    [self.backgroundView setUserInteractionEnabled:YES];
    CGRect rect = CGRectMake(0, 0, 2048.0f, 768.0f);
    self.backgroundView.frame = rect;
    [self.view addSubview:self.backgroundView];
    
    self.sandView = [[EraserView alloc] initWithFrame:self.backgroundView.frame];
    [self.backgroundView addSubview:self.sandView];
    
    /*
    pathString = [[NSBundle mainBundle] pathForResource:@"Screen21-RAETSEL-3-vIda_Sand" ofType:@"png"];
    image = [UIImage imageWithContentsOfFile:pathString];
    self.sandView = [[UIImageView alloc] initWithImage:image];
    [self.sandView setUserInteractionEnabled:YES];
    rect = CGRectMake(0, 0, 2048.0f, 768.0f);
    self.sandView.frame = rect;
    [self.backgroundView addSubview:self.sandView];
    */
    
    //Swipe to adjust center of view
    UISwipeGestureRecognizer *swipeLRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeLRecognizer.delegate = self;
    swipeLRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLRecognizer];
    
    UISwipeGestureRecognizer *swipeRRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeRRecognizer.delegate = self;
    swipeRRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRRecognizer];
    
    //GestureRecognizer Pan
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    panRecognizer.delegate = self;
    [self.view addGestureRecognizer:panRecognizer];
}


-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if (self.panEnabled) {
        //disable pageViews recognizer
        [self.rootViewController disablePan];
        self.panEnabled = NO;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
-(void) eraseAtLocation:(CGPoint)location{
    UIGraphicsBeginImageContext(CGSizeMake(30.0f, 30.0f));
    if (!self.erasing) {
        
    }
    
    [self.eraser drawAtPoint:location blendMode:kCGBlendModeDestinationOut alpha:0.2];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}
*/

-(void)handlePan:(UIPanGestureRecognizer *) recognizer{
    
    //move center of view
    CGPoint locationInHoleView = [recognizer locationInView:self.view];
    
    //show left side
    if (CGRectContainsPoint(self.rectLeft, locationInHoleView)) {
        if (self.backgroundView.frame.origin.x<0) {
            CGRect rect = CGRectMake(self.backgroundView.frame.origin.x+8.0f, self.backgroundView.frame.origin.y, 2048.0f, 768.0f);
            self.backgroundView.frame = rect;
        }
    }
    
    //show right side
    if (CGRectContainsPoint(self.rectRight, locationInHoleView)) {
        if (self.backgroundView.frame.origin.x>-1024.0f) {
            CGRect rect = CGRectMake(self.backgroundView.frame.origin.x-8.0f, self.backgroundView.frame.origin.y, 2048.0f, 768.0f);
            self.backgroundView.frame = rect;
        }
    }
    
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        self.sandView.erasing = YES;
    }
    
    self.sandView.location = [recognizer locationInView:self.backgroundView];
    [self.sandView setNeedsDisplay];
}

- (void)handleSwipe:(UISwipeGestureRecognizer *)recognizer{
    //show left side
    if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        if (self.backgroundView.frame.origin.x>-1024.0f) {
            CGRect rect = CGRectMake(self.backgroundView.frame.origin.x-8.0f, self.backgroundView.frame.origin.y, 2048.0f, 768.0f);
            self.backgroundView.frame = rect;
        }
    }
    //show right side
    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
        if (self.backgroundView.frame.origin.x>-1024.0f) {
            CGRect rect = CGRectMake(self.backgroundView.frame.origin.x-8.0f, self.backgroundView.frame.origin.y, 2048.0f, 768.0f);
            self.backgroundView.frame = rect;
        }
    }
    
}


@end
