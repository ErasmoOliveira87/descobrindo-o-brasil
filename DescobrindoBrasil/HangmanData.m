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
        NSArray * estates = @[@"AC",@"AL",@"AP",@"AM",@"BA",@"CE",@"DF",@"ES",@"GO",@"MA",@"MT",@"MS",@"MG",@"PA",@"PB",@"PR",@"PE",@"PI",@"RJ",@"RN",@"RS",@"RO",@"RR",@"SC",@"SP",@"SE",@"TO"];
        for (int c = 0; c< 27; c++) {
            self.data[[estates objectAtIndex:c]] = [[NSMutableArray alloc]init];
        }
        
        [self addAsk:@"Capital do Estado" forAnswer:@"São Paulo" inState:@"SP"];
    }
    return self;
}

-(void)addAsk: (NSString*)ask forAnswer: (NSString*)answer inState: (NSString*)state
{
    NSDictionary * question = [NSDictionary dictionaryWithObject:ask forKey:answer];
    [[self.data objectForKey:state]addObject:question];
}


-(NSDictionary*) sortAskFor: (NSString*)state{
    NSMutableArray * stateArray = [self.data objectForKey:state];
    int randonIndex = arc4random() % [stateArray count];
    NSDictionary* dictionary =[[NSDictionary alloc]initWithDictionary:[stateArray objectAtIndex:randonIndex]];
    return dictionary;
}




@end
