//
//  ViewController.h
//  DescobrindoBrasil
//
//  Created by Matheus Alves Silveira on 14/07/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BrazilView.h"
#import "MapOverlay.h"
#import "HangViewController.h"
#import "State.h"
#import "StatesRepository.h"

@interface MainViewController : UIViewController <mapOverlayDelegate>


@property(nonatomic,strong)NSMutableArray *statesWithFlag;

@end
