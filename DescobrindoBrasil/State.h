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

@property (nonatomic) int points;
@property (nonatomic) int stars;

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSArray *questions;

-(State*)initWithName:(NSString*)stateName;

@end
