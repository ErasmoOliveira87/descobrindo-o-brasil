//
//  FragView.m
//  DescobrindoBrasil
//
//  Created by ELTON CARLOS DOS SANTOS on 05/08/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import "FragView.h"

@interface FragView()





@end


@implementation FragView





- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.flagView = [[UIImageView alloc]initWithFrame:CGRectMake(700, 700, 25, 25)];
        
        [self buildFlag];
        
    }
    return self;
}



-(void)buildFlag{

    UIImage *imageteste = [UIImage imageNamed:@"flag-of-brazil_t"];
    
    [self.flagView setImage:imageteste];

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
