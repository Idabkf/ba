//
//  ScreenFourViewController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 31.05.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenFourViewController.h"

@interface ScreenFourViewController ()

@end

@implementation ScreenFourViewController

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
    
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen04a-Fressgroelm" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    self.groelmView = [[UIImageView alloc]initWithImage:image];
    CGRect rect = CGRectMake(80.0f, 150.0f, image.size.width/2, image.size.height/2);
    self.groelmView.frame = rect;
    [self.groelmView setUserInteractionEnabled:YES];
    [(UIImageView *)self.view addSubview:self.groelmView];
    
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
   // NSLog(@"Tapped");
    if (self.imageFlg == 0) {
        NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen04b-Schluckgroelm" ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        [self.groelmView setImage:image];
        //CGRect rect = CGRectMake(80.0f, 150.0f, image.size.width/2, image.size.height/2);
        //self.groelmView.frame = rect;
        [self.groelmView setUserInteractionEnabled:YES];
        [(UIImageView *)self.view addSubview:self.groelmView];
        
        self.imageFlg = 1;
    }
    else if (self.imageFlg == 1) {
        NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen04c-Spuckgroelm" ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        [self.groelmView setImage:image];
        //CGRect rect = CGRectMake(80.0f, 150.0f, image.size.width/2, image.size.height/2);
        //self.groelmView.frame = rect;
        [(UIImageView *)self.view addSubview:self.groelmView];
        
        pathString = [[NSBundle mainBundle] pathForResource:@"Screen04c-Kind" ofType:@"png"];
        image = [UIImage imageWithContentsOfFile:pathString];
        self.kindView = [[UIImageView alloc]initWithImage:image];
        CGRect rect = CGRectMake(750.0f, 300.0f, image.size.width/2, image.size.height/2);
        self.kindView.frame = rect;
        [(UIImageView *)self.view addSubview:self.kindView];
        
        self.imageFlg = 2;
    }
    else if (self.imageFlg == 2) {
        [self.kindView removeFromSuperview];
        NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen04a-Fressgroelm" ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        [self.groelmView setImage:image];
        //CGRect rect = CGRectMake(80.0f, 150.0f, image.size.width/2, image.size.height/2);
        //self.groelmView.frame = rect;
        [(UIImageView *)self.view addSubview:self.groelmView];
        
        self.imageFlg = 0;
    }

}

@end
