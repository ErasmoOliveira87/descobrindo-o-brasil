//
//  FragView.m
//  DescobrindoBrasil
//
//  Created by ELTON CARLOS DOS SANTOS on 05/08/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import "FlagView.h"

@interface FlagView()





@end


@implementation FlagView





- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
     //   self.flagView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
        
        [self buildFlag];
        
        [self addSubview:self.flagView];
        
    }
    return self;
}



-(void)buildFlag{

    UIImage *imageteste = [UIImage imageNamed:@"flag-of-brazil_t"];
    
    UIImage *imageTeste = [[UIImage alloc]initWithCGImage:imageteste.CGImage scale:5.5 orientation:UIImageOrientationUp ];
    
   // [self.flagView setImage:imageteste];
    
    self.flagView= [[UIImageView alloc]initWithImage:imageTeste];
    
    

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
