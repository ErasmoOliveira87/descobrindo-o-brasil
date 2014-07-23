//
//  HangManWordLottery.h
//  DescobrindoBrasil
//
//  Created by ELTON CARLOS DOS SANTOS on 21/07/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HangManWordLottery : NSObject


@property(strong,nonatomic)NSString *word;
@property(strong,nonatomic)NSString *charade;


-(void)getRandomWord;

-(NSDictionary*)allWord;

@end
