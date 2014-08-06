//
//  StatesRepository.m
//  DescobrindoBrasil
//
//  Created by Leonardo Yvens on 06/08/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import "StatesRepository.h"

@implementation StatesRepository

+(NSArray*)sharedStates {

    static NSArray* states;
    
    if(states == nil) {
        
        NSArray *stateNames = @[@"AC",@"AL",@"AP",@"AM",@"BA",@"CE",@"DF",@"ES",@"GO",@"MA",@"MT",@"MS",@"MG",@"PA",@"PB",@"PR",@"PE",@"PI",@"RJ",@"RN",@"RS",@"RO",@"RR",@"SC",@"SP",@"SE",@"TO"];
        
        NSMutableArray *statesMutable = [[NSMutableArray alloc] init];
        
        for (NSString *stateName in stateNames)
            [statesMutable addObject:[[State alloc] initWithName:stateName]];
        
        states = statesMutable;
    }
    
    return states;
}

+(State*)stateForName:(NSString *)stateName {
    
    for (State* state in [self sharedStates]) {
        
        if([state.name isEqualToString:stateName])
            return state;
    }
    
    NSLog(@"Erro, estado nao encontrado");
    
    return nil;
}

@end

