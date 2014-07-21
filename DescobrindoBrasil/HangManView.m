//
//  HangManView.m
//  DescobrindoBrasil
//
//  Created by Erasmo Oliveira on 15/07/14.
//  Copyright (c) 2014 Erasmo Oliveira. All rights reserved.
//

#import "HangManView.h"

#define headInitialPosition CGRectMake(100, 100, 50, 50);
#define bodyInitialPosition CGRectMake(100, 100, 50, 50);
#define upperArmInitialPosition CGRectMake(100, 100, 50, 50);
#define leftArmInitialPosition CGRectMake(100, 100, 50, 50);
#define rightArmInitialPosition CGRectMake(100, 100, 50, 50);
#define upperLegInitialPosition CGRectMake(100, 100, 50, 50);
#define leftLegInitialPosition CGRectMake(100, 100, 50, 50);
#define rightLegInitialPosition CGRectMake(100, 100, 50, 50);

@interface HangManView()

@property (nonatomic, strong) UIView *head;
@property (nonatomic, strong) UIView *body;
@property (nonatomic, strong) UIView *upperArm;
@property (nonatomic, strong) UIView *leftArm;
@property (nonatomic, strong) UIView *rightArm;
@property (nonatomic, strong) UIView *upperLeg;
@property (nonatomic, strong) UIView *leftLeg;
@property (nonatomic, strong) UIView *rightLeg;

@property (nonatomic, strong) NSArray *bodyParts;

@property (nonatomic, strong) UIView *hangBase;
@property (nonatomic, strong) UIView *hangTower;
@property (nonatomic, strong) UIView *hangTop;

@property (nonatomic) int bodyCount;

@end

@implementation HangManView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        [self drawHang];
        [self drawHangMan];
        
        self.bodyParts = [[NSArray alloc] initWithObjects:self.head, self.body, self.leftLeg, self.leftArm, self.rightArm, self.rightLeg, self.upperLeg, self.upperArm, nil];
        self.bodyCount = 0;
        
    }
    return self;
}

-(void) drawHang
{

    UIColor *blackColor = [[UIColor alloc] initWithRed:0 green:0 blue:0 alpha:1.0];


    self.hangBase = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 500, 500)];
    [self.hangBase setBackgroundColor:blackColor];
    [self addSubview:self.hangBase];
    
    self.hangTower = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 500, 500)];
    [self.hangTower setBackgroundColor:blackColor];
    [self addSubview:self.hangTower];
    
    self.hangTop = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 500, 500)];
    [self.hangTop setBackgroundColor:blackColor];
    [self addSubview:self.hangTop];

}

-(void) drawHangMan
{
    
    UIColor *blackColor = [[UIColor alloc] initWithRed:0 green:0 blue:0 alpha:1.0];
    
    self.head = [[UIView alloc] initWithFrame: CGRectMake(50, 100, 70, 70)];
    [self.head setBackgroundColor:blackColor];
    self.head.layer.cornerRadius = 30;
    
    
    self.body = [[UIView alloc] initWithFrame: CGRectMake(80, 125, 10, 160)];
    [self.body setBackgroundColor:blackColor];
    
    
    self.upperArm = [[UIView alloc] initWithFrame: CGRectMake(70, 180, 30, 10)];
    [self.upperArm setBackgroundColor:blackColor];
    
    
    self.rightArm = [[UIView alloc] initWithFrame: CGRectMake(60, 180, 10, 80)];
    [self.rightArm setBackgroundColor:blackColor];
    
    
    self.leftArm = [[UIView alloc] initWithFrame: CGRectMake(100, 180, 10, 80)];
    [self.leftArm setBackgroundColor:blackColor];
    
    
    self.upperLeg = [[UIView alloc] initWithFrame: CGRectMake(75, 280, 20, 10)];
    [self.upperLeg setBackgroundColor:blackColor];
    
    
    self.rightLeg = [[UIView alloc] initWithFrame: CGRectMake(95, 280, 10, 100)];
    [self.rightLeg setBackgroundColor:blackColor];
    
    
    self.leftLeg = [[UIView alloc] initWithFrame: CGRectMake(65, 280, 10, 100)];
    [self.leftLeg setBackgroundColor:blackColor];
    
    
}


-(void) addMember
{
    
    /*
     [self addSubview:self.head];
     [self addSubview:self.body];
     [self addSubview:self.upperArm];
     [self addSubview:self.rightArm];
     [self addSubview:self.leftArm];
     [self addSubview:self.upperLeg];
     [self addSubview:self.rightLeg];
     [self addSubview:self.leftLeg];
     */

    if (self.bodyCount < [self.bodyParts count])
    {
        [self addSubview:self.bodyParts[self.bodyCount]];
        self.bodyCount++;
    }
    
    
}

@end
