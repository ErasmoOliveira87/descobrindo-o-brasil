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
        _questions = [State questionsForStateName:stateName];
        
    }
    
    return self;
}

//le as perguntas do JSON
+(NSArray*)questionsForStateName:(NSString*)name {
    
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"HangManAsks" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
    NSError *error = nil;
    NSDictionary *parsedData = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    NSDictionary *questionsDict = [parsedData objectForKey:name];
    
    NSMutableArray *questionsArray = [[NSMutableArray alloc] init];
    
    for (NSString* question in questionsDict.keyEnumerator) {
        
        [questionsArray addObject:[[HangmanQuestion alloc] initWithQuestion:[questionsDict objectForKey:question] Answer:question]];
    }
    
    return questionsArray;
}


-(int)getStars {
    
    if (self.points == 200) {
        return 3;
    }
    else if (self.points >=100)
        return 2;
    else
    {
        return 0;
    }
    
}

@end
