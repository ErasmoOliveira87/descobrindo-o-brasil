//
//  Score.m
//  DescobrindoBrasil
//
//  Created by Matheus Alves Silveira on 31/07/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import "Score.h"

@implementation Score


-(id)init
{
    self = [super init];
    if (self) {
        NSArray * estates = @[@"AC",@"AL",@"AP",@"AM",@"BA",@"CE",@"DF",@"ES",@"GO",@"MA",@"MT",@"MS",@"MG",@"PA",@"PB",@"PR",@"PE",@"PI",@"RJ",@"RN",@"RS",@"RO",@"RR",@"SC",@"SP",@"SE",@"TO"];
        for (int c = 0; c< 27; c++) {
            self.points[[estates objectAtIndex:c]] = [NSNumber numberWithInt:0];
        }
    }
    return self;
}


-(void)replaceScorePoints:(int)scorePoints inState:(NSString *)state
{
    [self.points setObject:[NSNumber numberWithInt:scorePoints] forKey:state];
}

-(int)starsForState: (NSString*)state
{
    NSNumber * points = [self.points objectForKey:state];
    if ([points intValue] ==200) {
        return 3;
    }
    else if ([points intValue] >=100)
        return 2;
    else
    {
        return 0;
    }
    
}


-(int)pointsForState: (NSString*)state
{
    return [[self.points objectForKey:state] intValue];
}



@end
