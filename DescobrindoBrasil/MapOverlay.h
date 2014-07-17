//
//  BrazilMapContainer.h
//  DescobrindoBrasil
//
//  Created by Leonardo Yvens on 16/07/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol mapOverlayDelegate

-(void)tapOnState:(NSString*)state;

@end


@interface MapOverlay : UIView

@property (weak, nonatomic) id<mapOverlayDelegate> delegate;

@end
