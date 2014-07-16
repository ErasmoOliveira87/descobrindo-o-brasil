//
//  BrazilMapContainer.m
//  DescobrindoBrasil
//
//  Created by Leonardo Yvens on 16/07/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import "MapOverlay.h"

@implementation MapOverlay

- (id)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        //fundo transparente
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
        NSLog(@"%f %f", frame.origin.x, frame.origin.y);
    }
    return self;
}


/*
 PATHS:
 
 SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"brazil_blank_map.png"];
 
 CGFloat offsetX = sprite.frame.size.width * sprite.anchorPoint.x;
 CGFloat offsetY = sprite.frame.size.height * sprite.anchorPoint.y;
 
 CGMutablePathRef path = CGPathCreateMutable();
 
 RS:
 
 CGPathMoveToPoint(path, NULL, 519 - offsetX, 8 - offsetY);
 CGPathAddLineToPoint(path, NULL, 603 - offsetX, 111 - offsetY);
 CGPathAddLineToPoint(path, NULL, 561 - offsetX, 158 - offsetY);
 CGPathAddLineToPoint(path, NULL, 496 - offsetX, 175 - offsetY);
 CGPathAddLineToPoint(path, NULL, 421 - offsetX, 98 - offsetY);
 
 CGPathCloseSubpath(path);
 
 
 SC:
 
 CGPathMoveToPoint(path, NULL, 604 - offsetX, 117 - offsetY);
 CGPathAddLineToPoint(path, NULL, 505 - offsetX, 177 - offsetY);
 CGPathAddLineToPoint(path, NULL, 508 - offsetX, 198 - offsetY);
 CGPathAddLineToPoint(path, NULL, 566 - offsetX, 189 - offsetY);
 CGPathAddLineToPoint(path, NULL, 585 - offsetX, 204 - offsetY);
 CGPathAddLineToPoint(path, NULL, 632 - offsetX, 200 - offsetY);
 CGPathAddLineToPoint(path, NULL, 628 - offsetX, 143 - offsetY);
 
 CGPathCloseSubpath(path);
 
 PARANÁ (OU NÃO, ENFIM):
 
 CGPathMoveToPoint(path, NULL, 632 - offsetX, 201 - offsetY);
 CGPathAddLineToPoint(path, NULL, 514 - offsetX, 196 - offsetY);
 CGPathAddLineToPoint(path, NULL, 487 - offsetX, 215 - offsetY);
 CGPathAddLineToPoint(path, NULL, 497 - offsetX, 249 - offsetY);
 CGPathAddLineToPoint(path, NULL, 530 - offsetX, 287 - offsetY);
 CGPathAddLineToPoint(path, NULL, 603 - offsetX, 279 - offsetY);
 
 CGPathCloseSubpath(path);
 
 SP:
 
 CGPathMoveToPoint(path, NULL, 643 - offsetX, 220 - offsetY);
 CGPathAddLineToPoint(path, NULL, 602 - offsetX, 278 - offsetY);
 CGPathAddLineToPoint(path, NULL, 533 - offsetX, 292 - offsetY);
 CGPathAddLineToPoint(path, NULL, 581 - offsetX, 353 - offsetY);
 CGPathAddLineToPoint(path, NULL, 660 - offsetX, 348 - offsetY);
 CGPathAddLineToPoint(path, NULL, 685 - offsetX, 278 - offsetY);
 CGPathAddLineToPoint(path, NULL, 696 - offsetX, 276 - offsetY);
 CGPathAddLineToPoint(path, NULL, 718 - offsetX, 288 - offsetY);
 CGPathAddLineToPoint(path, NULL, 716 - offsetX, 265 - offsetY);
 
 CGPathCloseSubpath(path);
 
 */


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    
    CGFloat offsetX = self.frame.size.width;
    CGFloat offsetY = self.frame.size.height;
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    //RS:
    
    CGPathMoveToPoint(path, NULL, offsetX - 519, offsetY - 8);
    CGPathAddLineToPoint(path, NULL, offsetX - 603, offsetY - 111);
    CGPathAddLineToPoint(path, NULL,  offsetX - 561, offsetY - 158);
    CGPathAddLineToPoint(path, NULL,  offsetX - 496, offsetY - 175);
    CGPathAddLineToPoint(path, NULL, offsetX - 421, offsetY - 98);
    
    CGPathCloseSubpath(path);
    
    
    //SC:
    
    CGPathMoveToPoint(path, NULL, offsetX - 604, offsetY - 117);
    CGPathAddLineToPoint(path, NULL, offsetX - 505, offsetY - 177);
    CGPathAddLineToPoint(path, NULL, offsetX - 508, offsetY - 198);
    CGPathAddLineToPoint(path, NULL, offsetX - 566, offsetY - 189);
    CGPathAddLineToPoint(path, NULL, offsetX - 585, offsetY - 204);
    CGPathAddLineToPoint(path, NULL,  offsetX - 632, offsetY - 200);
    CGPathAddLineToPoint(path, NULL, offsetX - 628 , offsetY - 143);
    
    CGPathCloseSubpath(path);
    
    //   PARANÁ (OU NÃO, ENFIM):
    /*
    CGPathMoveToPoint(path, NULL, 632 - offsetX, 201 - offsetY);
    CGPathAddLineToPoint(path, NULL, 514 - offsetX, 196 - offsetY);
    CGPathAddLineToPoint(path, NULL, 487 - offsetX, 215 - offsetY);
    CGPathAddLineToPoint(path, NULL, 497 - offsetX, 249 - offsetY);
    CGPathAddLineToPoint(path, NULL, 530 - offsetX, 287 - offsetY);
    CGPathAddLineToPoint(path, NULL, 603 - offsetX, 279 - offsetY);
    
    CGPathCloseSubpath(path);
    
    //SP:
    
    CGPathMoveToPoint(path, NULL, 643 - offsetX, 220 - offsetY);
    CGPathAddLineToPoint(path, NULL, 602 - offsetX, 278 - offsetY);
    CGPathAddLineToPoint(path, NULL, 533 - offsetX, 292 - offsetY);
    CGPathAddLineToPoint(path, NULL, 581 - offsetX, 353 - offsetY);
    CGPathAddLineToPoint(path, NULL, 660 - offsetX, 348 - offsetY);
    CGPathAddLineToPoint(path, NULL, 685 - offsetX, 278 - offsetY);
    CGPathAddLineToPoint(path, NULL, 696 - offsetX, 276 - offsetY);
    CGPathAddLineToPoint(path, NULL, 718 - offsetX, 288 - offsetY);
    CGPathAddLineToPoint(path, NULL, 716 - offsetX, 265 - offsetY);
    
    CGPathCloseSubpath(path);
    */
    
    UIBezierPath *bezPath = [UIBezierPath bezierPathWithCGPath:path];
    
    [[UIColor redColor] setStroke];
    [bezPath stroke];
}


@end
