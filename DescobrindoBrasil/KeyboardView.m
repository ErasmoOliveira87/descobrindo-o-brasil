//
//  KeyboardView.m
//  DescobrindoBrasil
//
//  Created by Matheus Alves Silveira on 15/07/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import "KeyboardView.h"

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
    
    NSLog(@"Identifica Botão %@", sender.currentTitle);
    sender.enabled = NO;
    sender.hidden = YES;
}


-(void)buttonEnable{
    
    for(UIView *subView in self.subviews )
    {
        if([subView isKindOfClass:[UIButton class]]){
            
            UIButton *button = (UIButton *) subView;
            
        //    NSLog(@"valor botao %@", button.titleLabel.text);
            
            button.enabled = YES;
            button.hidden = NO;
        }
    }
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
