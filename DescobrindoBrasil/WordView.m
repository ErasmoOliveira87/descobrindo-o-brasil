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
@property (nonatomic, strong) NSMutableString * updatedWord;


@end

@implementation WordView




-(int)selectChar:(char) key
{
    int control = 0;
    
    for (int aux = 0; aux < self.word.length; aux++)
    {
        NSMutableString * str = [[NSMutableString alloc]initWithString:self.hangWord.text];
        
        if([[self getWordWithouAccent] characterAtIndex:aux] == key)
        {
            NSString *subWord = [self.word substringWithRange:NSMakeRange(aux, 1)];
            char newKey = [subWord characterAtIndex:0];
            self.hangWord.text = [str stringByReplacingCharactersInRange:NSMakeRange(aux *2 , 1) withString:[NSString stringWithFormat:@"%c",newKey]];
            self.updatedWord = [[self.updatedWord stringByReplacingCharactersInRange:NSMakeRange(aux , 1) withString:[NSString stringWithFormat:@"%c",newKey]]mutableCopy];
            if ([self.word isEqualToString:self.updatedWord]) {
                control = 2;
                
        }
            else
            {
                control = 1;
            }
        }
        
    }
    return control;
}

//remove acentos e letras maiúsculas
-(NSString *)getWordWithouAccent
{
    NSString *simpleWord = [self.word stringByFoldingWithOptions:NSDiacriticInsensitiveSearch locale:[NSLocale currentLocale]];
    
    return [simpleWord stringByFoldingWithOptions:NSCaseInsensitiveSearch locale:[NSLocale currentLocale]];
}

-(void)updateDisplayWord:(NSString*)word
{
    NSMutableString *string = [[NSMutableString alloc]init];
    NSMutableString *stringWord = [[NSMutableString alloc]init];
    
    for (int aux = 0; aux<word.length; aux++) {
        [string appendString:[NSString stringWithFormat:@"%c",[word characterAtIndex:aux]]];
        [stringWord appendString:[NSString stringWithFormat:@"%c",[word characterAtIndex:aux]]];
        [string appendString:@" "];
    }
    self.hangWord.text = string;
    self.updatedWord = stringWord;
    
    [self setNeedsDisplay];
}


-(void)resetWithWord:(NSString*)word
{
    self.word = word;
    NSString * str = [self encodingWord:word.length];
    [self updateDisplayWord:str];
    [self selectChar:' '];
    [self selectChar:'-'];
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
