//
//  HangmanQuestion.h
//  DescobrindoBrasil
//
//  Created by Leonardo Yvens on 06/08/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HangmanQuestion : NSObject

@property NSString *question;
@property NSString *answer;

-(id)initWithQuestion:(NSString*)question Answer:(NSString*)answer;

@end
