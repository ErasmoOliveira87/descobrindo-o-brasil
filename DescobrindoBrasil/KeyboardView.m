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
    
    self.arrayDeBotoes = [[NSMutableArray alloc]init];
    
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
    
    [self addButton:sender];
    
    sender.enabled = NO;
    sender.hidden = YES;
}




-(void)addButton:(UIButton *)sender{


    [self.arrayDeBotoes addObject:sender];

}

-(void)buttonEnable{

    int contador=0;
    
    while(contador<[self.arrayDeBotoes count]){
    
    UIButton *botton = self.arrayDeBotoes[contador];
        
        botton.enabled = YES;
        botton.hidden = NO;
        
        contador++;
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
