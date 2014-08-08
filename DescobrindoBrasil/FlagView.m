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
        
        [self buildFlag];
        
        [self addSubview:self.flagView];
        
    }
    return self;
}


-(void)buildFlag{

    UIImage *imageteste = [UIImage imageNamed:@"flag"];
    
    UIImage *imageTeste = [[UIImage alloc]initWithCGImage:imageteste.CGImage scale:8.5 orientation:UIImageOrientationUp ];
    
    self.flagView= [[UIImageView alloc]initWithImage:imageTeste];

}


@end
