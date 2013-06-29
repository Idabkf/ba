//
//  ScreenSixViewController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 07.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenSixViewController.h"

@interface ScreenSixViewController ()

@end

@implementation ScreenSixViewController

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
    //NSLog(@"FRAME X: %f Y: %f", self.view.frame.size.width, self.view.frame.size.height);
    [self setFigures];
    self.tappedFlag = false;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setFigures{
    //CHILD
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen06-Wald-Kind" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.childView = [[UIImageView alloc]initWithImage:image];
    CGRect rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
    self.childView.frame = rect;
    CGPoint point = CGPointMake(218.0f, 502.25f);
    [self.childView setCenter:point];
    [self.childView setUserInteractionEnabled:YES];
    [(UIImageView *)self.view addSubview:self.childView];
    
    //GROELM
    pathString = [[NSBundle mainBundle] pathForResource:@"Screen06-Wald-Groelm" ofType:@"png"];
    image = [UIImage imageWithContentsOfFile:pathString];
    self.groelmView = [[UIImageView alloc]initWithImage:image];
    rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
    self.groelmView.frame = rect;
    point = CGPointMake(139.5f, 563.0f);
    [self.groelmView setCenter:point];
    [self.groelmView setUserInteractionEnabled:YES];
    [(UIImageView *)self.view addSubview:self.groelmView];
    
    //ORF
    pathString = [[NSBundle mainBundle] pathForResource:@"Screen06-Wald-Cheforf" ofType:@"png"];
    image = [UIImage imageWithContentsOfFile:pathString];
    self.orfView = [[UIImageView alloc]initWithImage:image];
    rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
    self.orfView.frame = rect;
    point = CGPointMake(372.5f, 518.0f);
    [self.orfView setCenter:point];
    [self.orfView setUserInteractionEnabled:YES];
    //GestureRecognizer Tap
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    tapRecognizer.delegate = self;
    [self.orfView addGestureRecognizer:tapRecognizer];
    [(UIImageView *)self.view addSubview:self.orfView];
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer{
    NSLog(@"ORFVIEW TAPPED");
    if (self.tappedFlag) {
        [self.helpView removeFromSuperview];
        self.tappedFlag = false;
    }
    else {
        //CHILD
        NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen06-Wald-help" ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        self.helpView = [[UIImageView alloc]initWithImage:image];
        CGRect rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
        self.helpView.frame = rect;
        CGPoint point = CGPointMake(544.0f, 345.5f);
        [self.helpView setCenter:point];
        //[self.helpView setUserInteractionEnabled:YES];
        [(UIImageView *)self.view addSubview:self.helpView];
        self.tappedFlag = true;
    }
}

@end
