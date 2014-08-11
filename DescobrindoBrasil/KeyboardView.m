//
//  KeyboardView.m
//  DescobrindoBrasil
//
//  Created by Matheus Alves Silveira on 15/07/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import "KeyboardView.h"
#define originTransform = 0

@implementation KeyboardView

-(id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if(self) {
        
    }
    
    return self;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (IBAction)keyTouched:(UIButton *)sender {
    
    [self.delegate didSelectChar:sender.titleLabel.text];
    
    [self animateKeyBoard:sender];
    
    sender.enabled = NO;
<<<<<<< HEAD
    //sender.hidden = YES;
=======
>>>>>>> b5b378aa686a23f894ead4a576cf50f6ee58ed80
}

-(void)resetKeyboard{
    
    for(UIView *subView in self.subviews )
    {
        if([subView isKindOfClass:[UIButton class]]){
            
            UIButton *button = (UIButton *) subView;
            button.enabled = YES;
<<<<<<< HEAD
            //button.hidden = NO;
=======
>>>>>>> b5b378aa686a23f894ead4a576cf50f6ee58ed80
            button.alpha = 1.0;
            button.transform = CGAffineTransformMakeScale(1.25, 1.25);
        }
    }
}

-(void) animateKeyBoard: (UIButton*)pressedKey
{
    [UIView animateWithDuration:0.2 animations:^{

        pressedKey.transform = CGAffineTransformMakeScale(2.5, 2.5);
        pressedKey.transform = CGAffineTransformMakeRotation(360.0);
        pressedKey.alpha = 0.0;
<<<<<<< HEAD
        //pressedKey.hidden = YES;
=======
>>>>>>> b5b378aa686a23f894ead4a576cf50f6ee58ed80

    }];
    
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
