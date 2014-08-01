//
//  Score.h
//  DescobrindoBrasil
//
//  Created by Matheus Alves Silveira on 31/07/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Score : NSObject

@property (nonatomic, strong) NSMutableDictionary * points;

-(int)starsForState: (NSString*)state;

-(void)replaceScorePoints:(int)scorePoints inState:(NSString *)state;


@end
