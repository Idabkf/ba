//
//  ScreenEighteenViewController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 29.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenEighteenViewController.h"
#import "RootViewController.h"

@interface ScreenEighteenViewController ()

@end

@implementation ScreenEighteenViewController

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
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen17b-Groelm" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.groelmView = [[UIImageView alloc]initWithImage:image];
    CGRect rect = CGRectMake(80.0f, 150.0f, image.size.width/2, image.size.height/2);
    self.groelmView.frame = rect;
    [self.groelmView setUserInteractionEnabled:YES];
    [self.view addSubview:self.groelmView];
    
    self.imageFlg = 0;
    
    //GestureRecognizer Tap
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    recognizer.delegate = self;
    [self.view addGestureRecognizer:recognizer];
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

- (void)handleTap:(UITapGestureRecognizer *)recognizer
{
    if (self.imageFlg == 0) {
        NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen18-Groelm" ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        [self.groelmView setImage:image];
        CGRect rect = CGRectMake(80.0f, 150.0f, image.size.width/2, image.size.height/2);
        self.groelmView.frame = rect;
        [self.groelmView setUserInteractionEnabled:YES];
        [self.view addSubview:self.groelmView];
        
        pathString = [[NSBundle mainBundle] pathForResource:@"Screen18-Kind" ofType:@"png"];
        image = [UIImage imageWithContentsOfFile:pathString];
        self.kindView = [[UIImageView alloc]initWithImage:image];
        rect = CGRectMake(765.0f, 326.0f, image.size.width/2, image.size.height/2);
        self.kindView.frame = rect;
        [self.view addSubview:self.kindView];
        
        self.imageFlg = 1;
    }
    else if (self.imageFlg == 1) {
        [self.kindView removeFromSuperview];
        NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen18a-Klettergroelm" ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        [self.groelmView setImage:image];
        CGRect rect = CGRectMake(80.0f, 150.0f, image.size.width/2, image.size.height/2);
        self.groelmView.frame = rect;
        [self.groelmView setUserInteractionEnabled:YES];
        [self.view addSubview:self.groelmView];
        
        self.imageFlg = 2;
    }
    else if (self.imageFlg == 2) {
        NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen18b-Groelmgeschluckt" ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        [self.groelmView setImage:image];
        CGRect rect = CGRectMake(80.0f, 150.0f, image.size.width/2, image.size.height/2);
        self.groelmView.frame = rect;
        [self.view addSubview:self.groelmView];
        
        self.imageFlg = 3;
    }
    
    else if (self.imageFlg == 3){
        NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen18c-Groelmausspuck" ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        [self.groelmView setImage:image];
        CGRect rect = CGRectMake(80.0f, 150.0f, image.size.width/2, image.size.height/2);
        self.groelmView.frame = rect;
        [self.view addSubview:self.groelmView];
        
        pathString = [[NSBundle mainBundle] pathForResource:@"Screen04c-Kind" ofType:@"png"];
        image = [UIImage imageWithContentsOfFile:pathString];
        [self.kindView setImage:image];
        rect = CGRectMake(750.0f, 300.0f, image.size.width/2, image.size.height/2);
        self.kindView.frame = rect;
        [self.view addSubview:self.kindView];
        
        //enable pageViews recognizer
        [self.rootViewController enablePan];
        self.panEnabled = YES;
        
        self.imageFlg = 4;
    }
    
}

@end
