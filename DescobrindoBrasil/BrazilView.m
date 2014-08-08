//
//  BrazilView.m
//  DescobrindoBrasil
//
//  Created by Matheus Alves Silveira on 15/07/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import "BrazilView.h"

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
        [self initialization];
    
    self.flagView = [[FlagView alloc]init];
    
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
        [self initialization];
    
    self.flagView = [[FlagView alloc]init];
    
    
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
    
    
    [self coordinatesOfStates];
    
    
}

#pragma mark Flags

-(void)placeFlagsOnStates:(NSArray *)states{
    
    
    for (State *state in states) {
        
        
        
        FlagView *flag = [[FlagView alloc]init];
        
        
        
        [self.mapContainerView addSubview:flag];
        
        NSValue *pointValue = [self.flagLocationForState objectForKey:state.name];
        
        
        
        flag.center = [pointValue CGPointValue];
        
        
        
        
    }
    
    
    
}


-(void)coordinatesOfStates{
    
    self.flagLocationForState= @{ @"SP":[NSValue valueWithCGPoint:CGPointMake(630.666687, 704)],
                                  @"MG":[NSValue valueWithCGPoint:CGPointMake(733.333313, 613.333313)],
                                  @"RJ":[NSValue valueWithCGPoint:CGPointMake(780, 706.666687)],
                                  @"ES":[NSValue valueWithCGPoint:CGPointMake(824, 640)],
                                  @"PR":[NSValue valueWithCGPoint:CGPointMake(570.666687, 757.333313)],
                                  @"SC":[NSValue valueWithCGPoint:CGPointMake(598.666687, 828)],
                                  @"RS":[NSValue valueWithCGPoint:CGPointMake(537.333313, 876)],
                                  @"GO":[NSValue valueWithCGPoint:CGPointMake(621.333313, 537.333313)],
                                  @"MT":[NSValue valueWithCGPoint:CGPointMake(464, 466.666656)],
                                  @"MS":[NSValue valueWithCGPoint:CGPointMake(489.333344, 649.333313)],
                                  @"DF":[NSValue valueWithCGPoint:CGPointMake(654.666687, 538.666687)],
                                  @"BA":[NSValue valueWithCGPoint:CGPointMake(816, 461.333344)],
                                  @"AM":[NSValue valueWithCGPoint:CGPointMake(252, 250.666672)],
                                  @"PE":[NSValue valueWithCGPoint:CGPointMake(906.666687, 358.666656)],
                                  @"SE":[NSValue valueWithCGPoint:CGPointMake(914.666687, 420)],
                                  @"AL":[NSValue valueWithCGPoint:CGPointMake(938.666687, 397.333344)],
                                  @"PB":[NSValue valueWithCGPoint:CGPointMake(950.666687, 328)],
                                  @"RN":[NSValue valueWithCGPoint:CGPointMake(941.333313, 294.666656)],
                                  @"CE":[NSValue valueWithCGPoint:CGPointMake(865.333313, 276)],
                                  @"PI":[NSValue valueWithCGPoint:CGPointMake(794.666687, 329.333344)],
                                  @"MA":[NSValue valueWithCGPoint:CGPointMake(706.666687, 262.666656)]};
    NSLog(@"coordinatesOfStates");
    
    
}

#pragma mark UIScrollView Delegate

//determina em qual view dar zoom
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    return self.mapContainerView;
    
}

@end
