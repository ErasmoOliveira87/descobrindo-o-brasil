//
//  State.m
//  DescobrindoBrasil
//
//  Created by Leonardo Yvens on 06/08/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import "State.h"

@implementation State

-(State*)initWithName:(NSString*)stateName {
    
    self = [super init];
    
    if(self) {
        
        _name = stateName;
        _hangmanQuestions = [State questionsForStateName:stateName];
        _hangmanPoints = 0;
    }
    
    return self;
}

//lê as perguntas do JSON
+(NSArray*)questionsForStateName:(NSString*)name {
    
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"HangManAsks" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
    NSError *error = nil;
    NSDictionary *parsedData = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    NSDictionary *questionsDict = [parsedData objectForKey:name];
    
    NSMutableArray *questionsArray = [[NSMutableArray alloc] init];
    
    for (NSString* answer in questionsDict) {
        
        [questionsArray addObject:[[HangmanQuestion alloc] initWithQuestion:[questionsDict objectForKey:answer] Answer:answer]];
    }
    
    return questionsArray;
}

#pragma mark getters & setters

-(int)hangmanStars
{
    if (self.hangmanPoints > 100) {
        return 3;
    }
    else if (self.hangmanPoints >=90)
        return 2;
    else if (self.hangmanPoints >=40)
        return 1;
    else
    {
        return 0;
    }
    
}

@end
