//
//  HangmanData.m
//  DescobrindoBrasil
//
//  Created by Matheus Alves Silveira on 01/08/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import "HangmanData.h"

@implementation HangmanData
-(id)init
{
    self = [super init];
    if (self) {
        self.data = [[NSMutableDictionary alloc]init];
        NSArray * states = @[@"AC",@"AL",@"AP",@"AM",@"BA",@"CE",@"DF",@"ES",@"GO",@"MA",@"MT",@"MS",@"MG",@"PA",@"PB",@"PR",@"PE",@"PI",@"RJ",@"RN",@"RS",@"RO",@"RR",@"SC",@"SP",@"SE",@"TO"];
        for (int c = 0; c< [states count]; c++) {
            self.data[[states objectAtIndex:c]] = [[NSMutableArray alloc]init];
        }
        [self readJson];
    }
    return self;
}


-(BOOL)readJson
{
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"HangManAsks" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
    NSError *error = nil;
    NSDictionary *parseData = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error] ; nil;
    NSArray * statesData = [[NSArray alloc]initWithArray:[parseData objectForKey:@"estado"]];
    if (error == nil) {
        for (int c = 0; c< [statesData count]; c++) {
            NSDictionary * currentSate = [[NSDictionary alloc]initWithDictionary:[statesData objectAtIndex:c]];
            NSString * currentStateKey = [[NSString alloc]initWithString:[currentSate allKeys][0]];
            NSArray * stateArray = [[NSArray alloc]initWithArray:[currentSate objectForKey:currentStateKey]];
            [self.data setObject:[stateArray mutableCopy] forKey:currentStateKey];
        }
        
        
        return true;
    }
    else{
        return false;
    }

}

-(void)addAsk: (NSString*)ask forAnswer: (NSString*)answer inState: (NSString*)state
{
    NSDictionary * question = [NSDictionary dictionaryWithObject:ask forKey:answer];
    [[self.data objectForKey:state]addObject:question];
}

-(void)addAskwithDictionary: (NSDictionary*)dictionary inState: (NSString*)state
{    [[self.data objectForKey:state]addObject:dictionary];
}

-(NSDictionary*) sortAskFor: (NSString*)state{
    NSMutableArray * stateArray = [self.data objectForKey:state];
    int randonIndex = arc4random() % [stateArray count];
    NSDictionary* dictionary =[[NSDictionary alloc]initWithDictionary:[stateArray objectAtIndex:randonIndex]];
    return dictionary;
}




@end
