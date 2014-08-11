//
//  BrazilView.h
//  DescobrindoBrasil
//
//  Created by Matheus Alves Silveira on 15/07/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapOverlay.h"
#import "FlagView.h"
#import "State.h"

@interface BrazilView : UIScrollView <UIScrollViewDelegate>

@property (weak, nonatomic) MapOverlay *overlay;
@property(strong,nonatomic)FlagView *flagView;


-(void)placeFlagsOnStates:(NSArray*)state;

@end
