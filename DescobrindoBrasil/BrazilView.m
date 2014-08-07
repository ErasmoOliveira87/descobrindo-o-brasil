//
//  BrazilView.m
//  DescobrindoBrasil
//
//  Created by Matheus Alves Silveira on 15/07/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import "BrazilView.h"
#import "FragView.h"

@interface BrazilView ()

//contém a imagem do mapa + overlay para detectar toques
@property (strong, nonatomic) UIView *mapContainerView;

@end

@implementation BrazilView

#pragma mark Inits

-(id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self)
        [self initialization];
    
    self.flagView = [[FragView alloc]init];
    
   // [self addFlag:self.flagView.flagView];
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
        [self initialization];
    
    self.flagView = [[FragView alloc]init];
    
  //  [self addFlag:self.flagView.flagView];
    
    return self;
}

-(void)initialization {
    
    UIImage *brazilMap = [UIImage imageNamed:@"brazil_blank_map"];
    UIImageView *mapImageView = [[UIImageView alloc] initWithImage:brazilMap];
    
    //adiciona a imagem do mapa com o overlay ao mapContainerView
    _mapContainerView = [[UIView alloc] initWithFrame:mapImageView.frame];
    
    [_mapContainerView addSubview:mapImageView];
    
    MapOverlay *overlay = [[MapOverlay alloc] initWithFrame:mapImageView.frame];
    _overlay = overlay;
    
    [_mapContainerView addSubview:overlay];
    
    [self addSubview:_mapContainerView];
    
    //configura scroll
    self.clipsToBounds = YES;
    self.contentSize = _mapContainerView.frame.size;
    
    //configura zoom
    self.delegate = self;
    self.maximumZoomScale = 2.0;
    self.minimumZoomScale = 0.75;
    self.zoomScale = 0.75;
}

#pragma mark UIScrollView Delegate

//determina em qual view dar zoom
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    return self.mapContainerView;
    
}

@end
