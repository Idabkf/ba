//
//  ScreenFourteenViewController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 16.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenFourteenViewController.h"
#import "RootViewController.h"

@interface ScreenFourteenViewController ()

@end

@implementation ScreenFourteenViewController

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
    
    //Rects to move to the right or to the left
    self.rectLeft = CGRectMake(0.0f, 0.0f, 100.0f, 768.0f);
    self.rectRight = CGRectMake(924.0f, 0.0f, 100.0f, 768.0f);
    
    // Adjust the image
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen14-Labyrinth+Wasser" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.backgroundView = [[UIImageView alloc] initWithImage:image];
    [self.backgroundView setUserInteractionEnabled:YES];
    CGRect rect = CGRectMake(0, 0, 2048.0f, 768.0f);
    self.backgroundView.frame = rect;
    
    [self.view addSubview:self.backgroundView];
    [self loadLabyrinth];
    [self setUboot];
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
-(void) loadLabyrinth{
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen14-UBoot" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.labyrinthView = [[UIImageView alloc]initWithImage:image];
    CGRect rect = CGRectMake(0.0f, 0.0f, 2048.0f, 768.0f);
    self.labyrinthView.frame = rect;
    [self.backgroundView addSubview:self.labyrinthView];
    self.labyrinthView.alpha = 0.0f;
}

-(void) setUboot{
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen14-UBoot" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.ubootView = [[UIImageView alloc]initWithImage:image];
    CGRect rect = CGRectMake(0.0f, 0.0f, image.size.width, image.size.height);
    self.ubootView.frame = rect;
    [self.ubootView setUserInteractionEnabled:YES];
    [self.backgroundView addSubview:self.ubootView];
    
    //GestureRecognizer Pan
    UIPanGestureRecognizer *panRecognizer1 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    panRecognizer1.delegate = self;
    [self.ubootView addGestureRecognizer:panRecognizer1];
    
}

-(void)handlePan:(UIPanGestureRecognizer *) recognizer{
    
    //move center of view
    CGPoint locationInHoleView = [recognizer locationInView:self.view];
    CGPoint locationInBackView = [recognizer locationInView:self.backgroundView];
    
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
    
    /*
    if (CGRectContainsPoint(self.labyrinthView.frame, locationInBackView)) {
    
    }
    */
    //move mushroom
    recognizer.view.center = [recognizer locationInView:self.backgroundView];
    
    
    //enable pageViews recognizer
    [self.rootViewController enablePan];
    self.panEnabled = YES;
}


@end
