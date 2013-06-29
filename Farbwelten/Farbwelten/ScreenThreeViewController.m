//
//  ScreenThreeViewController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 31.05.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenThreeViewController.h"

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
    
    self.imageFlg = 0;
    
    //GestureRecognizer Tap
    self.tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    self.tapRecognizer.delegate = self;
    //[self.view addGestureRecognizer:self.tapRecognizer];
    
    
    
    //GestureRecognizer Swipe
    UISwipeGestureRecognizer *swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeRecognizer.delegate = self;
    //swipeRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeRecognizer];
    
    self.tap1Locked = false;
    self.tap2Locked = false;
    self.tap3Locked = false;
    self.tap4Locked = false;
    self.tap5Locked = false;
    
    self.tapsLocked = [[NSMutableArray alloc] initWithObjects:false, false, false, false, false,  nil];
    self.boxViews = [[NSMutableArray alloc] initWithObjects:self.boxViewOne, self.boxViewTwo, self.boxViewThree, self.boxViewFour, self.boxViewFive,  nil];

    
    
   // NSLog(@"GESTURE RECOGNIZERS: %@", self.view.gestureRecognizers);
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

- (void)handleTapOld:(UITapGestureRecognizer *)recognizer {
    
    CGPoint tap = [recognizer locationInView:self.view];
    
    //NSLog(@"TAPPED : x: %f y:%f", tap.x, tap.y);
    
    if (CGRectContainsPoint(self.boxViewFive.frame, tap)) {
        //NSLog(@"TAPPED IN BOX 5");
    }
    else if (CGRectContainsPoint(self.boxViewFour.frame, tap)) {
        //NSLog(@"TAPPED IN BOX 4");
    }
    else if (CGRectContainsPoint(self.boxViewThree.frame, tap)) {
        //NSLog(@"TAPPED IN BOX 3");
    }
    else if (CGRectContainsPoint(self.boxViewTwo.frame, tap)) {
        //NSLog(@"TAPPED IN BOX 2");
    }
    else if (CGRectContainsPoint(self.boxViewOne.frame, tap)) {
        //NSLog(@"TAPPED IN BOX 1");
    }
    else {
        //NSLog(@"TAPPED : x: %f y:%f", tap.x, tap.y);
    }

    
    /*
    if (self.imageFlg == 0) {
        NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen03b" ofType:@"jpg"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        [(UIImageView *)self.view setImage:image];
        self.imageFlg = 1;
    }
    
    else if (self.imageFlg == 1) {
        NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen03a" ofType:@"jpg"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        [(UIImageView *)self.view setImage:image];
        self.imageFlg = 0;
    }
     */
}

-(void)handlePan:(UIPanGestureRecognizer *) recognizer{
   
    recognizer.view.center = [recognizer locationInView:self.view];
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        [recognizer.view removeFromSuperview];
        [self.boxViews removeObject:recognizer.view];
    }
}

- (void)handlePanOld:(UIPanGestureRecognizer *)recognizer
{
    if (self.boxViews.count == 0) {
        [self.view removeGestureRecognizer:recognizer];
    }
    CGPoint tap = [recognizer locationInView:self.view];
    
    CGPoint start = CGPointMake(recognizer.view.center.x, recognizer.view.center.y);
    CGPoint translation = [recognizer translationInView:self.view];
    CGPoint end = CGPointMake(recognizer.view.center.x + translation.x,
                              recognizer.view.center.y + translation.y);
    
    //NSLog(@"START: x:%f y:%f", start.x, start.y);
    //NSLog(@"TRANSLATION: x:%f y:%f", translation.x, translation.y);
   // NSLog(@"END: x:%f y:%f", end.x, end.y);
    
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        for (UIImageView *boxView in self.boxViews) {
            if (CGRectContainsPoint(boxView.frame, tap)) {
                [self setTapsLockedDespite:[self.boxViews indexOfObjectIdenticalTo:boxView]];
            }
        }
    }

    /*
    if (!self.tap5Locked && CGRectContainsPoint(self.boxViewFive.frame, tap)) {
       // NSLog(@"TAPPED IN BOX 5");
    
        CGPoint moveTo = CGPointMake(end.x - self.boxViewFive.frame.size.width/2,
                                  end.y - self.boxViewFive.frame.size.height/2);
       self.boxViewFive.center = moveTo;
    }
    else if (!self.tap4Locked && CGRectContainsPoint(self.boxViewFour.frame, tap)) {
        //NSLog(@"TAPPED IN BOX 4");
        CGPoint moveTo = CGPointMake(end.x - self.boxViewFour.frame.size.width/2,
                                     end.y - self.boxViewFour.frame.size.height/2);
        self.boxViewFour.center = moveTo;
    }
    else if (!self.tap3Locked && CGRectContainsPoint(self.boxViewThree.frame, tap)) {
        //NSLog(@"TAPPED IN BOX 3");
        CGPoint moveTo = CGPointMake(end.x - self.boxViewThree.frame.size.width/2,
                                     end.y - self.boxViewThree.frame.size.height/2);
        self.boxViewThree.center = moveTo;
    }
    else if (!self.tap2Locked && CGRectContainsPoint(self.boxViewTwo.frame, tap)) {
        //NSLog(@"TAPPED IN BOX 2");
        CGPoint moveTo = CGPointMake(end.x - self.boxViewTwo.frame.size.width/2,
                                     end.y - self.boxViewTwo.frame.size.height/2);
        self.boxViewTwo.center = moveTo;
    }
    else if (!self.tap1Locked && CGRectContainsPoint(self.boxViewOne.frame, tap)) {
        // NSLog(@"TAPPED IN BOX 1");
        CGPoint moveTo = CGPointMake(end.x - self.boxViewOne.frame.size.width/2,
                                     end.y - self.boxViewOne.frame.size.height/2);
        self.boxViewOne.center = moveTo;
    }
    else {
        //NSLog(@"TAPPED : x: %f y:%f", tap.x, tap.y);
    }
     */
    for (UIImageView *boxView in self.boxViews) {
        //BOOL *test = [[self.tapsLocked objectAtIndex:[self.boxViews indexOfObjectIdenticalTo:boxView]] boolValue];
        if (![self getTapLockedAtIndex:[self.boxViews indexOfObjectIdenticalTo:boxView]] && CGRectContainsPoint(boxView.frame, tap))
        {
            CGPoint moveTo = CGPointMake(end.x - boxView.frame.size.width/2,
                                         end.y - boxView.frame.size.height/2);
            boxView.center = moveTo;
        }
    }
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        NSLog(@"PAN ENDED");
        for (UIImageView *boxView in self.boxViews) {
            if (![self getTapLockedAtIndex:[self.boxViews indexOfObjectIdenticalTo:boxView]] &&CGRectContainsPoint(boxView.frame, tap)) {
                [boxView removeFromSuperview];
                [self.boxViews removeObject:boxView];
            }
        }

    }
}

-(BOOL *) getTapLockedAtIndex: (int) index{
    if (index == 0) {
        return self.tap1Locked;
    }
    else if (index == 1) {
        return self.tap2Locked;
    }
    else if (index == 2) {
        return self.tap3Locked;    }
    else if (index == 3) {
        return self.tap4Locked;
    }
    else if (index == 4) {
        return self.tap5Locked;
    }
    return nil;
}


-(void) setTapsLockedDespite: (int) number
{
    if (number == 0) {
        self.tap1Locked = false;
        self.tap2Locked = true;
        self.tap3Locked = true;
        self.tap4Locked = true;
        self.tap5Locked = true;
    }
    else if (number == 1) {
        self.tap1Locked = true;
        self.tap2Locked = false;
        self.tap3Locked = true;
        self.tap4Locked = true;
        self.tap5Locked = true;
    }
    else if (number == 2) {
        self.tap1Locked = true;
        self.tap2Locked = true;
        self.tap3Locked = false;
        self.tap4Locked = true;
        self.tap5Locked = true;
    }
    else if (number == 3) {
        self.tap1Locked = true;
        self.tap2Locked = true;
        self.tap3Locked = true;
        self.tap4Locked = false;
        self.tap5Locked = true;
    }
    else if (number == 4) {
        self.tap1Locked = true;
        self.tap2Locked = true;
        self.tap3Locked = true;
        self.tap4Locked = true;
        self.tap5Locked = false;
    }

}

- (void)handleSwipe:(UISwipeGestureRecognizer *)recognizer
{
    NSLog(@"SWIPE RIGHT");
    
     CGPoint tap = [recognizer locationInView:self.view];
     /*
     CGPoint start = CGPointMake(recognizer.view.center.x, recognizer.view.center.y);
     CGPoint translation = [recognizer translationInView:self.view];
     CGPoint end = CGPointMake(recognizer.view.center.x + translation.x,
     recognizer.view.center.y + translation.y);
     
     //NSLog(@"START: x:%f y:%f", start.x, start.y);
     //NSLog(@"TRANSLATION: x:%f y:%f", translation.x, translation.y);
     // NSLog(@"END: x:%f y:%f", end.x, end.y);
     */
     if (CGRectContainsPoint(self.boxViewFive.frame, tap)) {
     // NSLog(@"TAPPED IN BOX 5");
         CGPoint out = CGPointMake(self.boxViewFive.frame.size.width, -self.boxViewFive.frame.size.height);
         [UIView animateWithDuration:5.0
                               delay:0.0
                             options:UIViewAnimationOptionAllowUserInteraction
                          animations:^{
                              self.boxViewFive.center = out;
                          }
                          completion:nil
          ];
     }
     else if (CGRectContainsPoint(self.boxViewFour.frame, tap)) {
     //NSLog(@"TAPPED IN BOX 4");
     }
     else if (CGRectContainsPoint(self.boxViewThree.frame, tap)) {
     //NSLog(@"TAPPED IN BOX 3");
     }
     else if (CGRectContainsPoint(self.boxViewTwo.frame, tap)) {
     //NSLog(@"TAPPED IN BOX 2");
     }
     else if (CGRectContainsPoint(self.boxViewOne.frame, tap)) {
     // NSLog(@"TAPPED IN BOX 1");
     }
     else {
     //NSLog(@"TAPPED : x: %f y:%f", tap.x, tap.y);
     }
    
}

@end
