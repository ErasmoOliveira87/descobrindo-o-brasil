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
@property (nonatomic, strong) UIView *leftLeg;
@property (nonatomic, strong) UIView *rightLeg;

@property (nonatomic, strong) NSMutableArray *bodyParts;

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
        
    }
    return self;
}

//Desenha a forca
-(void) drawHang
{

    UIColor *blackColor = [[UIColor alloc] initWithRed:0 green:0 blue:0 alpha:1.0];

    self.hangBase = [[UIView alloc] initWithFrame:CGRectMake(100, 530, 100, 30)];
    [self.hangBase setBackgroundColor:blackColor];
    [self addSubview:self.hangBase];
    
    self.hangTower = [[UIView alloc] initWithFrame:CGRectMake(140, 150, 10, 400)];
    [self.hangTower setBackgroundColor:blackColor];
    [self addSubview:self.hangTower];
    
    self.hangTop = [[UIView alloc] initWithFrame:CGRectMake(140, 140, 300, 10)];
    [self.hangTop setBackgroundColor:blackColor];
    [self addSubview:self.hangTop];

}

//Desenha o boneco
-(void) drawHangMan
{
    int alpha = 0.0;
    UIColor *blackColor = [[UIColor alloc] initWithRed:0 green:0 blue:0 alpha:alpha];
    
    self.head = [[UIView alloc] initWithFrame: CGRectMake(350, 180, 70, 70)];
    [self.head setBackgroundColor:blackColor];
    self.head.layer.cornerRadius = 30;
    
    self.body = [[UIView alloc] initWithFrame: CGRectMake(380, 220, 10, 160)];
    [self.body setBackgroundColor:blackColor];
    
    self.upperArm = [[UIView alloc] initWithFrame: CGRectMake(370, 270, 30, 10)];
    [self.upperArm setBackgroundColor:blackColor];
    
    self.rightArm = [[UIView alloc] initWithFrame: CGRectMake(360, 270, 10, 80)];
    [self.rightArm setBackgroundColor:blackColor];
    
    self.leftArm = [[UIView alloc] initWithFrame: CGRectMake(400, 270, 10, 80)];
    [self.leftArm setBackgroundColor:blackColor];
    
    self.rightLeg = [[UIView alloc] initWithFrame: CGRectMake(390, 380, 10, 100)];
    [self.rightLeg setBackgroundColor:blackColor];
    
    self.leftLeg = [[UIView alloc] initWithFrame: CGRectMake(370, 380, 10, 100)];
    [self.leftLeg setBackgroundColor:blackColor];
    
    self.bodyParts = [[NSMutableArray alloc] initWithObjects:self.head, self.body, self.upperArm, self.leftLeg, self.leftArm, self.rightArm, self.rightLeg, nil];
    self.bodyCount = 0;
    
    
    int i = 0;
    while (i < [self.bodyParts count]) {
        [self addSubview:self.bodyParts[i]];
        i++;
    }
    

}

//Adiciona os membros no boneco
-(void) addMember
{
    int alpha = 1.0;
    UIColor *blackColor = [[UIColor alloc] initWithRed:0 green:0 blue:0 alpha:alpha];
    
    [self.bodyParts[self.bodyCount] setBackgroundColor:blackColor];
    
    self.bodyCount++;

    [self setNeedsDisplay];
    
}

//reinicia o boneco
-(void) eraseHangMan
{

    self.bodyCount = 0;
    
    int alpha = 0.0;
    UIColor *blackColor = [[UIColor alloc] initWithRed:0 green:0 blue:0 alpha:alpha];
    
    [self.head setBackgroundColor:blackColor];
    [self.body setBackgroundColor:blackColor];
    [self.upperArm setBackgroundColor:blackColor];
    [self.rightArm setBackgroundColor:blackColor];
    [self.leftArm setBackgroundColor:blackColor];
    [self.rightLeg setBackgroundColor:blackColor];
    [self.leftLeg setBackgroundColor:blackColor];
    
    [self setNeedsDisplay];

}

@end
