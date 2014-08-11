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
<<<<<<< HEAD
=======
#import "State.h"
>>>>>>> b5b378aa686a23f894ead4a576cf50f6ee58ed80

@interface BrazilView : UIScrollView <UIScrollViewDelegate>

@property (weak, nonatomic) MapOverlay *overlay;
@property(strong,nonatomic)FlagView *flagView;


<<<<<<< HEAD


=======
>>>>>>> b5b378aa686a23f894ead4a576cf50f6ee58ed80
-(void)placeFlagsOnStates:(NSArray*)state;

@end
