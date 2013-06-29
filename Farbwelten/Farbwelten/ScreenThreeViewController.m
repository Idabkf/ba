//
//  ScreenThreeViewController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 31.05.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenThreeViewController.h"
#import "RootViewController.h"

@interface ScreenThreeViewController ()

@end

@implementation ScreenThreeViewController

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
    
    [self setBoxes];

    self.boxViews = [[NSMutableArray alloc] initWithObjects:self.boxViewOne, self.boxViewTwo, self.boxViewThree, self.boxViewFour, self.boxViewFive,  nil];
    
   // NSLog(@"GESTURE RECOGNIZERS: %@", self.view.gestureRecognizers);
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


-(void) setBoxes
{
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen03a-Kiste1" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.boxViewOne = [[UIImageView alloc]initWithImage:image];
    CGRect rect = CGRectMake(450.0f, 400.0f, image.size.width/2, image.size.height/2);
    self.boxViewOne.frame = rect;
    [self.boxViewOne setUserInteractionEnabled:YES];
    
    //GestureRecognizer Pan
    UIPanGestureRecognizer *panRecognizer1 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    panRecognizer1.delegate = self;
    [self.boxViewOne addGestureRecognizer:panRecognizer1];
    
    [(UIImageView *)self.view addSubview:self.boxViewOne];
    
    /*
    NSLog(@"RECT: w:%f h:%f", rect.size.width, rect.size.height);
    NSLog(@"SUBVIEW: w:%f h:%f", boxViewOne.frame.size.width, boxViewOne.frame.size.height);
    NSLog(@"IMAGEVIEW: w:%f h:%f", self.view.frame.size.width, self.view.frame.size.height);
    */
    
    
    pathString = [[NSBundle mainBundle] pathForResource:@"Screen03a-Kiste2" ofType:@"png"];
    image = [UIImage imageWithContentsOfFile:pathString];
    self.boxViewTwo = [[UIImageView alloc]initWithImage:image];
    rect = CGRectMake(250.0f, 170.0f, image.size.width/2, image.size.height/2);
    self.boxViewTwo.frame = rect;
    [self.boxViewTwo setUserInteractionEnabled:YES];
    //GestureRecognizer Pan
    UIPanGestureRecognizer *panRecognizer2 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    panRecognizer2.delegate = self;
    [self.boxViewTwo addGestureRecognizer:panRecognizer2];
    [(UIImageView *)self.view addSubview:self.boxViewTwo];
    
    pathString = [[NSBundle mainBundle] pathForResource:@"Screen03a-Kiste3" ofType:@"png"];
    image = [UIImage imageWithContentsOfFile:pathString];
    self.boxViewThree = [[UIImageView alloc]initWithImage:image];
    rect = CGRectMake(480.0f, 120.0f, image.size.width/2, image.size.height/2);
    self.boxViewThree.frame = rect;
    [self.boxViewThree setUserInteractionEnabled:YES];
    //GestureRecognizer Pan
    UIPanGestureRecognizer *panRecognizer3 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    panRecognizer3.delegate = self;
    [self.boxViewThree addGestureRecognizer:panRecognizer3];
    [(UIImageView *)self.view addSubview:self.boxViewThree];
    
    pathString = [[NSBundle mainBundle] pathForResource:@"Screen03a-Kiste2" ofType:@"png"];
    image = [UIImage imageWithContentsOfFile:pathString];
    self.boxViewFour = [[UIImageView alloc]initWithImage:image];
    rect = CGRectMake(520.0f, 80.0f, image.size.width/2.5, image.size.height/2.5);
    self.boxViewFour.frame = rect;
    //spiegeln
    CGAffineTransform scale = CGAffineTransformMakeScale(-1.0, 1);
    self.boxViewFour.transform = scale;
    [self.boxViewFour setUserInteractionEnabled:YES];
    //GestureRecognizer Pan
    UIPanGestureRecognizer *panRecognizer4 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    panRecognizer4.delegate = self;
    [self.boxViewFour addGestureRecognizer:panRecognizer4];
    [(UIImageView *)self.view addSubview:self.boxViewFour];
    
    pathString = [[NSBundle mainBundle] pathForResource:@"Screen03a-Kiste4" ofType:@"png"];
    image = [UIImage imageWithContentsOfFile:pathString];
    self.boxViewFive = [[UIImageView alloc]initWithImage:image];
    rect = CGRectMake(320.0f, 30.0f, image.size.width/2, image.size.height/2);
    self.boxViewFive.frame = rect;
    [self.boxViewFive setUserInteractionEnabled:YES];
    //GestureRecognizer Pan
    UIPanGestureRecognizer *panRecognizer5 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    panRecognizer5.delegate = self;
    [self.boxViewFive addGestureRecognizer:panRecognizer5];
    [(UIImageView *)self.view addSubview:self.boxViewFive];
    
    //NSLog(@"SUBVIEWS: %@", self.view.subviews);
    
}

-(void)handlePan:(UIPanGestureRecognizer *) recognizer{
    
    
   
    recognizer.view.center = [recognizer locationInView:self.view];
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        [recognizer.view removeFromSuperview];
        [self.boxViews removeObject:recognizer.view];
        if (self.boxViews.count == 0) {
            //GestureRecognizer Tap
            UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
            tapRecognizer.delegate = self;
            [self.view addGestureRecognizer:tapRecognizer];
        }
    }
}

-(void)handleTap:(UITapGestureRecognizer *) recognizer{
    NSLog(@"HIER KOMMT NOCH TEXT HIN");
    
    //enable pageViews recognizer
    [self.rootViewController enablePan];
    self.panEnabled = YES;
}

@end
