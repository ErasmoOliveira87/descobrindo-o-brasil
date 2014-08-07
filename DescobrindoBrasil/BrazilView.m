//
//  BrazilView.m
//  DescobrindoBrasil
//
//  Created by Matheus Alves Silveira on 15/07/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import "BrazilView.h"
#import "FlagView.h"

@interface BrazilView ()

//contém a imagem do mapa + overlay para detectar toques
@property (strong, nonatomic) UIView *mapContainerView;

@property(strong,nonatomic)NSDictionary *flagLocationForState;











@end

@implementation BrazilView

#pragma mark Inits

-(id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self)
        [self initialize];
    
    self.flagView = [[FlagView alloc]init];
    
   // [self addFlag:self.flagView.flagView];
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
        [self initialize];
    
    self.flagView = [[FlagView alloc]init];
    
  //  [self addFlag:self.flagView.flagView];
    
    return self;
}



-(void)addFlag:(CGPoint)point{

    [_mapContainerView addSubview:self.flagView.flagView];
    
    [self addSubview:_mapContainerView];
    

}


-(void)placeFlagsOnStates:(NSArray *)states{


    for (NSString *state in states) {
        
        NSLog(@"state: %@", states);
        
        FlagView *flag = [[FlagView alloc]init];
        
        [self.mapContainerView addSubview:flag];
        
        NSValue *pointValue = [self.flagLocationForState objectForKey:state];
        
        flag.center = [pointValue CGPointValue];
        
    }
    


}




-(void)initialize {
    
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
    
    
    CGPoint stateSP = CGPointMake(633.333313, 689.333313);
    
    NSValue *spValue = [NSValue valueWithCGPoint:stateSP];
    
    self.flagLocationForState = @{@"SP": spValue} ;
    
    
}

#pragma mark UIScrollView Delegate

//determina em qual view dar zoom
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    return self.mapContainerView;
    
}

@end
