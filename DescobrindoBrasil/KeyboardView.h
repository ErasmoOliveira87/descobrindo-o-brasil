//
//  KeyboardView.h
//  DescobrindoBrasil
//
//  Created by Matheus Alves Silveira on 15/07/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KeyboardViewDelegate <NSObject>

-(void)didSelectChar:(NSString*)character;

-(void)resetButton;

@end


@interface KeyboardView : UIView

@property (weak, nonatomic) id<KeyboardViewDelegate> delegate;


-(void)buttonEnable;

@end