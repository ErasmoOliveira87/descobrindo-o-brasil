//
//  Score.m
//  DescobrindoBrasil
//
//  Created by Matheus Alves Silveira on 31/07/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import "Score.h"

@implementation Score



-(void)addScorePoints:(int)scorePoints inState:(NSString *)state
{
    [self.points setObject:[NSNumber numberWithInt:scorePoints] forKey:state];
} @end
