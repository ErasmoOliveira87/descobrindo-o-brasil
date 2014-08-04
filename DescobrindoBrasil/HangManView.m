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

@property (strong, nonatomic) UIDynamicAnimator *animator;
@property (strong, nonatomic) UIGravityBehavior *gravity;
@property (strong, nonatomic) UICollisionBehavior *collision;
@property (strong, nonatomic) UIDynamicItemBehavior *itemBehaviour;
@property (strong, nonatomic) UIAttachmentBehavior *attachment;

@end

@implementation HangManView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        [self drawHang];
        [self drawHangMan];
        
        self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
        self.gravity = [[UIGravityBehavior alloc] initWithItems:@[self.leftLeg, self.leftArm, self.rightArm, self.rightLeg]];
        
        self.gravity.gravityDirection = CGVectorMake(0.0, 0.9);
        
        self.itemBehaviour = [[UIDynamicItemBehavior alloc] initWithItems:@[self.leftLeg, self.leftArm, self.rightArm, self.rightLeg]];
        self.itemBehaviour.elasticity = 1.0;
        self.itemBehaviour.friction = 1.0;
        self.itemBehaviour.density = 1.0;
        self.itemBehaviour.allowsRotation = NO;
        [self.animator addBehavior:self.itemBehaviour];
        
        float damping = 10.0;
        float frequency = 10.0;
        
        UIAttachmentBehavior * attachHeadToPoint = [[UIAttachmentBehavior alloc] initWithItem:self.head attachedToAnchor:CGPointMake(self.center.x, self.center.y)];
        attachHeadToPoint.damping = damping;
        attachHeadToPoint.frequency = frequency;
        
        UIAttachmentBehavior * attachBodyToHead = [[UIAttachmentBehavior alloc] initWithItem:self.body attachedToAnchor:CGPointMake(self.center.x, self.center.y)];
        attachBodyToHead.damping = damping;
        attachBodyToHead.frequency = frequency;
        
        UIAttachmentBehavior * attachShoulderToBody = [[UIAttachmentBehavior alloc] initWithItem:self.upperArm attachedToAnchor:CGPointMake(self.center.x, self.center.y)];
        attachShoulderToBody.damping = damping;
        attachShoulderToBody.frequency = frequency;
        
        UIAttachmentBehavior * attachLeftArmToShoulders = [[UIAttachmentBehavior alloc] initWithItem:self.leftArm attachedToAnchor:CGPointMake(self.center.x, self.center.y)];
        attachLeftArmToShoulders.damping = damping;
        attachLeftArmToShoulders.frequency = frequency;
        
        UIAttachmentBehavior * attachRightArmToBody = [[UIAttachmentBehavior alloc] initWithItem:self.rightArm attachedToAnchor:CGPointMake(self.center.x, self.center.y)];
        attachRightArmToBody.damping = damping;
        attachRightArmToBody.frequency = frequency;
        
        UIAttachmentBehavior * attachRightLegToBody = [[UIAttachmentBehavior alloc] initWithItem:self.rightLeg attachedToAnchor:CGPointMake(self.center.x, self.center.y)];
        attachRightLegToBody.damping = damping;
        attachRightLegToBody.frequency = frequency;
        
        UIAttachmentBehavior * attachLeftLegToBody = [[UIAttachmentBehavior alloc] initWithItem:self.leftLeg attachedToAnchor:CGPointMake(self.center.x, self.center.y)];
        attachLeftLegToBody.damping = damping;
        attachLeftLegToBody.frequency = frequency;
        
        [self.animator addBehavior:attachHeadToPoint];
        [self.animator addBehavior:attachBodyToHead];
        [self.animator addBehavior:attachShoulderToBody];
        [self.animator addBehavior:attachLeftArmToShoulders];
        [self.animator addBehavior:attachRightArmToBody];
        [self.animator addBehavior:attachRightLegToBody];
        [self.animator addBehavior:attachLeftLegToBody];
        
        [self.animator addBehavior:self.gravity];
        
        [self setNeedsDisplay];
        
    }
    return self;
}

//Desenha a forca
-(void) drawHang
{
    
    self.hangBase = [[UIView alloc] initWithFrame:CGRectMake(200, 570, 87, 44)];
    [self.hangBase setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"hangBase"]]];
    [self addSubview:self.hangBase];
    
    self.hangTower = [[UIView alloc] initWithFrame:CGRectMake(240, 251, 21, 320)];
    [self.hangTower setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"hangTower"]]];
    [self addSubview:self.hangTower];
    
    self.hangTop = [[UIView alloc] initWithFrame:CGRectMake(240, 230, 205, 21)];
    [self.hangTop setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"hangTop"]]];
    [self addSubview:self.hangTop];
    
}

//Desenha o boneco
-(void) drawHangMan
{
    int alpha = 0.0;
    UIColor *blackColor = [[UIColor alloc] initWithRed:0 green:0 blue:0 alpha:alpha];
    
    self.head = [[UIView alloc] initWithFrame: CGRectMake(350, 280, 70, 70)];
    [self.head setBackgroundColor:blackColor];
    self.head.layer.cornerRadius = 30;
    
    self.body = [[UIView alloc] initWithFrame: CGRectMake(380, 320, 10, 160)];
    [self.body setBackgroundColor:blackColor];
    
    self.upperArm = [[UIView alloc] initWithFrame: CGRectMake(370, 370, 30, 10)];
    [self.upperArm setBackgroundColor:blackColor];
    
    self.rightArm = [[UIView alloc] initWithFrame: CGRectMake(360, 370, 10, 80)];
    [self.rightArm setBackgroundColor:blackColor];
    
    self.leftArm = [[UIView alloc] initWithFrame: CGRectMake(400, 370, 10, 80)];
    [self.leftArm setBackgroundColor:blackColor];
    
    self.rightLeg = [[UIView alloc] initWithFrame: CGRectMake(370, 470, 10, 100)];
    [self.rightLeg setBackgroundColor:blackColor];
    
    self.leftLeg = [[UIView alloc] initWithFrame: CGRectMake(390, 470, 10, 100)];
    [self.leftLeg setBackgroundColor:blackColor];
    
    self.bodyParts = [[NSMutableArray alloc] initWithObjects:self.head, self.body, self.upperArm, self.leftLeg, self.leftArm, self.rightArm, self.rightLeg, nil];
    self.bodyCount = 0;
    
    
    int i = 0;
    while (i < [self.bodyParts count]) {
        [self addSubview:self.bodyParts[i]];
        i++;
    }
    
    
    [self setNeedsDisplay];
    
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
    UIColor *transparentColor = [[UIColor alloc] initWithRed:0 green:0 blue:0 alpha:alpha];
    
    [self.head setBackgroundColor:transparentColor];
    [self.body setBackgroundColor:transparentColor];
    [self.upperArm setBackgroundColor:transparentColor];
    [self.rightArm setBackgroundColor:transparentColor];
    [self.leftArm setBackgroundColor:transparentColor];
    [self.rightLeg setBackgroundColor:transparentColor];
    [self.leftLeg setBackgroundColor:transparentColor];
    
    [self setNeedsDisplay];
    
}

@end
