//
//  HangmanQuestion.m
//  DescobrindoBrasil
//
//  Created by Leonardo Yvens on 06/08/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import "HangmanQuestion.h"

@implementation HangmanQuestion

-initWithQuestion:(NSString*)question Answer:(NSString*)answer {
    
    self = [super init];
    
    if (self) {
        _question = question;
        _answer = answer;
    }
    
    return self;
}

@end
