//
//  ViewController.m
//  MenuVCInCode
//
//  Created by Mario Ruiz on 3/31/16.
//  Copyright © 2016 Kenetic Labs. All rights reserved.
//
// Local Constants
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))
#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

#import "ViewController.h"

@interface ViewController (){
    
    float yOffset;
    float screenWidth;
    float screenHeight;
}

@property (strong, nonatomic) NSArray *titles;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //--Background & Logo----------------------------------------------------------------------------
    
    screenWidth = self.view.bounds.size.width;
    screenHeight = self.view.bounds.size.height;
    
    UIImageView *background = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    [background setImage:[UIImage imageNamed:@"Box_Stats_Sign_in1_@2x.png"]];    [background setContentMode:UIViewContentModeScaleAspectFill];
    [self.view addSubview:background];
    [background sendSubviewToBack:self.view];
    
    UIImageView *logo = [[UIImageView alloc]initWithFrame:CGRectMake(screenWidth/2-80, 30, 160, 120)];
    [logo setImage:[UIImage imageNamed:@"logo_vector_gray"]];
    [logo setContentMode:UIViewContentModeScaleAspectFill];
    [self.view addSubview:logo];
    
    //--Array of Menu Titles--------------------------------------------------------------------------
    
    _titles = @[@"    FIGHTER SEARCH",@"    SOCIAL FEED",@"    GYM LOCATOR",@"    WEIGHTCLASS/BMI CALCULATOR",@"    SHARE BOXSTATS"];
    yOffset = 10;
    [self loop];
}

//--Scrollview and Button Creation per Array of Menu Titles----------------------------------------

- (void)loop
{
    UIScrollView *sview = [[UIScrollView alloc]initWithFrame:CGRectMake(24, 157, screenWidth, screenHeight-157)];
    UIButton *buttonSample;
    
    for (NSString *string in _titles) {
        
        buttonSample = [[UIButton alloc]initWithFrame:CGRectMake(0, yOffset, screenWidth, 46)];
        buttonSample.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.3];
        [buttonSample setTitle:string forState:UIControlStateNormal];
        [buttonSample titleLabel].font = [UIFont fontWithName:@"AvenirNext-Bold" size:13];
        buttonSample.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [sview addSubview:buttonSample];
        yOffset+=54;
        
    }
    float calcHeight = ((buttonSample.frame.size.height+20)*_titles.count)+140;
    
    //--Cleto Reyes Store Button------------------------------------------------------------------------
    
    UIButton *CRStore = [[UIButton alloc]initWithFrame:CGRectMake(20, yOffset+10, screenWidth, 46)];
    CRStore.backgroundColor = [[UIColor redColor]colorWithAlphaComponent:0.5];
    
    if (IS_IPHONE_4_OR_LESS || IS_IPHONE_5) {
        [CRStore setTitle:@"                    OFFICIAL STORE" forState:UIControlStateNormal];
    } else if (IS_IPHONE_6) {
        [CRStore setTitle:@"                    OFFICIAL STORE" forState:UIControlStateNormal];
    } else if (IS_IPHONE_6P) {
        [CRStore setTitle:@"                    OFFICIAL STORE" forState:UIControlStateNormal];
    }
    
    [CRStore titleLabel].font = [UIFont fontWithName:@"AvenirNext-Bold" size:13];
    CRStore.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    CRStore.titleLabel.textAlignment = NSTextAlignmentLeft;
    //[[CRStore imageView] setContentMode:UIViewContentModeScaleAspectFit];
    
    UIImageView *_CRStore = [[UIImageView alloc]initWithFrame:CGRectMake(-20, -27, 80, 100)];
    _CRStore.image = [UIImage imageNamed:@"CR_logo.png"];
    _CRStore.contentMode = UIViewContentModeScaleAspectFit;
    [CRStore addSubview:_CRStore];
    [sview addSubview:CRStore];
    
    //--Privacy Policy Button----------------------------------------------------------------------------
    
    UIButton *PrivPolicy = [[UIButton alloc]initWithFrame:CGRectMake(0, yOffset+65, screenWidth, 30)];
    [PrivPolicy setTitle:@"Privacy Policy" forState:UIControlStateNormal];
    [PrivPolicy titleLabel].font = [UIFont fontWithName:@"AvenirNext-Regular" size:13];
    //PrivPolicy.backgroundColor = [UIColor redColor];
    PrivPolicy.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [sview addSubview:PrivPolicy];
    
    //--Bug/Suggestion Button---------------------------------------------------------------------------
    
    UIButton *BugSubmit = [[UIButton alloc]initWithFrame:CGRectMake(0, yOffset+90, screenWidth, 30)];
    [BugSubmit setTitle:@"Submit Bug/Suggestion" forState:UIControlStateNormal];
    [BugSubmit titleLabel].font = [UIFont fontWithName:@"AvenirNext-Regular" size:13];
    //BugSubmit.backgroundColor = [UIColor redColor];
    BugSubmit.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [sview addSubview:BugSubmit];
    
    //--Kenetic Labs Button----------------------------------------------------------------------------
    
    UIButton *Klab = [[UIButton alloc]initWithFrame:CGRectMake(0, yOffset+115, screenWidth, 30)];
    [Klab setTitle:@"Made in the USA Kenetic Labs, Inc." forState:UIControlStateNormal];
    [Klab titleLabel].font = [UIFont fontWithName:@"AvenirNext-Regular" size:11];
    //Klab.backgroundColor = [UIColor redColor];
    Klab.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [sview addSubview:Klab];
    
    //--Copyright Label-------------------------------------------------------------------------------
    
    UILabel *copyrightLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, yOffset+135, screenWidth, 15)];
    [copyrightLabel setText:@"Copyright (c) 2016 BoxStats, Inc. All rights reserved."];
    [copyrightLabel setTextColor:[UIColor whiteColor]];
    [copyrightLabel setFont:[UIFont fontWithName:@"AvenirNext-Regular" size:9]];
    [sview addSubview:copyrightLabel];
     
    
    
    //--Scrollview Content size Calculator--------------------------------------------------------------
    
    //float calcHeight = ((buttonSample.frame.size.height+20)*_titles.count)+120;
    sview.contentSize = CGSizeMake(self.view.bounds.size.width, calcHeight);
    [self.view addSubview:sview];
}

@end
