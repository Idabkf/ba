//
//  ScreenTwelveViewController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 16.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenTwelveViewController.h"

@interface ScreenTwelveViewController ()

@end

@implementation ScreenTwelveViewController

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
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen12-drohgroelm" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.groelmView = [[UIImageView alloc]initWithImage:image];
    CGRect rect = CGRectMake(80.0f, 150.0f, image.size.width/2, image.size.height/2);
    self.groelmView.frame = rect;
    [self.groelmView setUserInteractionEnabled:YES];
    [self.view addSubview:self.groelmView];
    
    pathString = [[NSBundle mainBundle] pathForResource:@"Screen12-Kind" ofType:@"png"];
    image = [UIImage imageWithContentsOfFile:pathString];
    self.kindView = [[UIImageView alloc]initWithImage:image];
    rect = CGRectMake(765.0f, 326.0f, image.size.width/2, image.size.height/2);
    self.kindView.frame = rect;
    [self.view addSubview:self.kindView];
    
    self.imageFlg = 0;
    
    //GestureRecognizer Tap
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    recognizer.delegate = self;
    [self.view addGestureRecognizer:recognizer];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer
{
    if (self.imageFlg == 0) {
        [self.kindView removeFromSuperview];
        NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen12c-klettergroelm" ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        [self.groelmView setImage:image];
        CGRect rect = CGRectMake(80.0f, 150.0f, image.size.width/2, image.size.height/2);
        self.groelmView.frame = rect;
        [self.groelmView setUserInteractionEnabled:YES];
        [self.view addSubview:self.groelmView];
        
        self.imageFlg = 1;
    }
    else if (self.imageFlg == 1) {
        NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen12b-schluckgroelm" ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        [self.groelmView setImage:image];
        CGRect rect = CGRectMake(80.0f, 150.0f, image.size.width/2, image.size.height/2);
        self.groelmView.frame = rect;
        [self.view addSubview:self.groelmView];
        
        self.imageFlg = 2;
    }
    
    else if (self.imageFlg ==2){
        NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen12c-spuckgroelm" ofType:@"png"];
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
        self.imageFlg = 3;
    }
    
    else if (self.imageFlg == 3) {
        NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen12-drohgroelm" ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        [self.groelmView setImage:image];
        CGRect rect = CGRectMake(80.0f, 150.0f, image.size.width/2, image.size.height/2);
        self.groelmView.frame = rect;
        [self.view addSubview:self.groelmView];
        
        pathString = [[NSBundle mainBundle] pathForResource:@"Screen12-Kind" ofType:@"png"];
        image = [UIImage imageWithContentsOfFile:pathString];
        [self.kindView setImage:image];
        rect = CGRectMake(765.0f, 326.0f, image.size.width/2, image.size.height/2);
        self.kindView.frame = rect;
        [self.view addSubview:self.kindView];
        
        self.imageFlg = 0;
    }
    
}

@end
