//
//  ScreenTenViewController.m
//  Farbwelten
//
//  Created by Ida Buchwald on 07.06.13.
//  Copyright (c) 2013 Ida. All rights reserved.
//

#import "ScreenTenViewController.h"

@interface ScreenTenViewController ()

@end

@implementation ScreenTenViewController

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
    
    //ZOOM
    self.frameRect = self.view.frame;
    UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    pinchRecognizer.delegate = self;
    [self.view addGestureRecognizer:pinchRecognizer];
    
    //CITY
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen02-Stadt-wischbar_stadt" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:pathString];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    CGRect rect = CGRectMake(-30, 0, image.size.width/2, image.size.height/2);
    imageView.frame = rect;
    [self.view addSubview:imageView];

    //STOCK
    pathString = [[NSBundle mainBundle] pathForResource:@"Inventarleiste" ofType:@"png"];
    image = [UIImage imageWithContentsOfFile:pathString];
    self.stockView = [[UIImageView alloc]initWithImage:image];
    rect = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
    self.stockView.frame = rect;
    CGPoint point = CGPointMake(512.0f, 697.5f);
    [self.stockView setCenter:point];
    [self.stockView setUserInteractionEnabled:YES];
    [self.view addSubview:self.stockView];
    
    //MUSHROOMS
    [self initMushroomWithImage:0];
    [self initMushroomWithImage:1];
    [self initMushroomWithImage:2];
    
    //EYES
    NSNumber *data = self.dataObject;
    if ([data isEqualToNumber:[NSNumber numberWithInt:15]]) {
        NSLog(@"SCREEN 17");
        [self initEyeWithImage:0];
        [self initEyeWithImage:1];
        [self initEyeWithImage:2];
    }
    
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

-(void)initMushroomWithImage:(int)imageId{
    CGPoint point = CGPointMake(0, 0);
    if(imageId == 0){
        NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen09-BelohnungPilz-pinki" ofType:@"png"];
        self.mushroom1 = [UIImage imageWithContentsOfFile:pathString];
        self.mushroom1View = [[UIImageView alloc]initWithImage:self.mushroom1];
        CGRect rect = CGRectMake(0, 0, self.mushroom1.size.width/8, self.mushroom1.size.height/8);
        self.mushroom1View.frame = rect;
        point = CGPointMake(59.75f, 699.5f);
        [self.mushroom1View setCenter:point];
        [self.mushroom1View setUserInteractionEnabled:YES];
        [self.view addSubview:self.mushroom1View];
        UIPanGestureRecognizer *panRecognizer1 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        panRecognizer1.delegate = self;
        [self.mushroom1View addGestureRecognizer:panRecognizer1];
    }
    else if(imageId == 1){
        NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen09-BelohnungPilz-scharlach" ofType:@"png"];
        self.mushroom2 = [UIImage imageWithContentsOfFile:pathString];
        self.mushroom2View = [[UIImageView alloc]initWithImage:self.mushroom2];
        CGRect rect = CGRectMake(0, 0, self.mushroom2.size.width/8, self.mushroom2.size.height/8);
        self.mushroom2View.frame = rect;
        point = CGPointMake(169.5f, 704.25f);
        [self.mushroom2View setCenter:point];
        [self.mushroom2View setUserInteractionEnabled:YES];
        [self.view addSubview:self.mushroom2View];
        UIPanGestureRecognizer *panRecognizer2 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        panRecognizer2.delegate = self;
        [self.mushroom2View addGestureRecognizer:panRecognizer2];
    }
    else{
        NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen09-BelohnungPilz-zinnober" ofType:@"png"];
        self.mushroom3 = [UIImage imageWithContentsOfFile:pathString];
        self.mushroom3View = [[UIImageView alloc]initWithImage:self.mushroom3];
        CGRect rect = CGRectMake(0, 0, self.mushroom3.size.width/8, self.mushroom3.size.height/8);
        self.mushroom3View.frame = rect;
        point = CGPointMake(288.25f, 701.0f);
        [self.mushroom3View setCenter:point];
        [self.mushroom3View setUserInteractionEnabled:YES];
        [self.view addSubview:self.mushroom3View];
        UIPanGestureRecognizer *panRecognizer3 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        panRecognizer3.delegate = self;
        [self.mushroom3View addGestureRecognizer:panRecognizer3];
    }
}

-(void)initEyeWithImage:(int)imageId{
    CGPoint point = CGPointMake(0, 0);
    if(imageId == 0){
        NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen16-Belohnung-punkteauge" ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        self.eye1View = [[UIImageView alloc]initWithImage:image];
        CGRect rect = CGRectMake(0, 0, image.size.width/8, image.size.height/8);
        self.eye1View.frame = rect;
        point = CGPointMake(400.0f, 699.5f);
        [self.eye1View setCenter:point];
        [self.eye1View setUserInteractionEnabled:YES];
        [self.view addSubview:self.eye1View];
        UIPanGestureRecognizer *panRecognizer1 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        panRecognizer1.delegate = self;
        [self.eye1View addGestureRecognizer:panRecognizer1];
    }
    else if(imageId == 1){
        NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen16-Belohnung-spiralauge" ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        self.eye2View = [[UIImageView alloc]initWithImage:image];
        CGRect rect = CGRectMake(0, 0, image.size.width/8, image.size.height/8);
        self.eye2View.frame = rect;
        point = CGPointMake(500.0f, 704.25f);
        [self.eye2View setCenter:point];
        [self.eye2View setUserInteractionEnabled:YES];
        [self.view addSubview:self.eye2View];
        UIPanGestureRecognizer *panRecognizer2 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        panRecognizer2.delegate = self;
        [self.eye2View addGestureRecognizer:panRecognizer2];
    }
    else{
        NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Screen16-Belohnung-tuerkischauge" ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathString];
        self.eye3View = [[UIImageView alloc]initWithImage:image];
        CGRect rect = CGRectMake(0, 0, image.size.width/8, image.size.height/8);
        self.eye3View.frame = rect;
        point = CGPointMake(600.0f, 701.0f);
        [self.eye3View setCenter:point];
        [self.eye3View setUserInteractionEnabled:YES];
        [self.view addSubview:self.eye3View];
        UIPanGestureRecognizer *panRecognizer3 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        panRecognizer3.delegate = self;
        [self.eye3View addGestureRecognizer:panRecognizer3];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)handlePan:(UIPanGestureRecognizer *) recognizer{
    if (recognizer.state == UIGestureRecognizerStateBegan){
        self.stockItemView = [[StockItemView alloc] initWithFrame:recognizer.view.frame];
        UIImageView *imageView = (UIImageView *)recognizer.view;
        UIImage *image = imageView.image;
        [self.stockItemView setImage:image];
        [self.view addSubview:self.stockItemView];
    }
    
    self.stockItemView.center = [recognizer locationInView:self.view];
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        if (CGRectIntersectsRect(self.stockItemView.frame, self.stockView.frame)) {
            [self.stockItemView removeFromSuperview];
        }
        
    }
}

-(void)handlePinch:(UIPinchGestureRecognizer *) recognizer{
    
    //if(self.zoomScale) self.zoomScale = MAX(self.zoomScale, recognizer.scale );
    self.zoomScale = recognizer.scale;
    self.zoomScale = MAX(self.zoomScale, 1.0);
    self.zoomScale = MIN(self.zoomScale, 3.0);
    
    
    recognizer.view.transform = CGAffineTransformMakeScale(self.zoomScale, self.zoomScale);
    /*
    
    
    if (recognizer.state == UIGestureRecognizerStateEnded){
        if (CGRectGetHeight(self.view.frame) < 769) {
            self.view.frame = self.frameRect;
            NSLog(@"HEIGHT: %f",CGRectGetHeight(self.view.frame) );
        }
    }*/
}

@end
