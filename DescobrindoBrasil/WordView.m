//
//  WordView.m
//  DescobrindoBrasil
//
//  Created by Matheus Alves Silveira on 15/07/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import "WordView.h"

@interface WordView ()

@property (nonatomic,strong) NSString * word;
@property (weak, nonatomic) IBOutlet UILabel *hangWord;


@end

@implementation WordView

-(bool)selectChar:(char) caractere
{

    return false;
}


-(void)resetWithWord:(NSString*)word
{
    self.word = word;
   self.hangWord.text = [self encodingWord:word.length];
    
    
    
}
-(NSString*)encodingWord:(NSUInteger)wordLenght
{
    NSMutableString * string = [[NSMutableString alloc]init];
    for (int aux = 0; aux<wordLenght; aux++) {
        [string appendString:@"_"];
    }
    return string;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
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
