//
//  BrazilView.m
//  DescobrindoBrasil
//
//  Created by Matheus Alves Silveira on 15/07/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import "BrazilView.h"

@interface BrazilView ()

@property (strong, nonatomic) UIImageView *mapImageView;

@end

@implementation BrazilView

#pragma mark Inits

-(id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self)
        [self initialize];
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
        [self initialize];
    
    return self;
}

-(void)initialize {
    
    //inicializa imagem
    UIImage *brazilMap = [UIImage imageNamed:@"brazil_blank_map"];
    
    _mapImageView = [[UIImageView alloc] initWithImage:brazilMap];
    
    //adiciona imagem como subview
    [self addSubview:_mapImageView];
    
    //configura scroll
    self.clipsToBounds = YES;
    self.contentSize = _mapImageView.frame.size;
    
    //configura zoom
    self.delegate = self;
    self.maximumZoomScale = 2.0;
}

#pragma mark UIScrollView Delegate

//determina em qual view dar zoom
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    return self.mapImageView;
    
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    cgcontex
    CGFloat offsetX = sprite.frame.size.width * sprite.anchorPoint.x;
    CGFloat offsetY = sprite.frame.size.height * sprite.anchorPoint.y;
    
    CGMutablePathRef path = CGPathCreateMutable();
    
//RS:
    
    CGPathMoveToPoint(path, NULL, 519 - offsetX, 8 - offsetY);
    CGPathAddLineToPoint(path, NULL, 603 - offsetX, 111 - offsetY);
    CGPathAddLineToPoint(path, NULL, 561 - offsetX, 158 - offsetY);
    CGPathAddLineToPoint(path, NULL, 496 - offsetX, 175 - offsetY);
    CGPathAddLineToPoint(path, NULL, 421 - offsetX, 98 - offsetY);
    
    CGPathCloseSubpath(path);
    
    
//SC:
    
    CGPathMoveToPoint(path, NULL, 604 - offsetX, 117 - offsetY);
    CGPathAddLineToPoint(path, NULL, 505 - offsetX, 177 - offsetY);
    CGPathAddLineToPoint(path, NULL, 508 - offsetX, 198 - offsetY);
    CGPathAddLineToPoint(path, NULL, 566 - offsetX, 189 - offsetY);
    CGPathAddLineToPoint(path, NULL, 585 - offsetX, 204 - offsetY);
    CGPathAddLineToPoint(path, NULL, 632 - offsetX, 200 - offsetY);
    CGPathAddLineToPoint(path, NULL, 628 - offsetX, 143 - offsetY);
    
    CGPathCloseSubpath(path);
    
 //   PARANÁ (OU NÃO, ENFIM):
    
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
}
*/

@end
