//
//  State.h
//  DescobrindoBrasil
//
//  Created by Leonardo Yvens on 06/08/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HangmanQuestion.h"

@interface State : NSObject

//sigla do estado
@property (nonatomic, strong) NSString *name;

//informacoes do jogo Hangman
@property (nonatomic) int hangmanPoints;
@property (nonatomic) int hangmanStars;
@property (nonatomic, strong) NSArray *hangmanQuestions;

-(State*)initWithName:(NSString*)stateName;

@end
