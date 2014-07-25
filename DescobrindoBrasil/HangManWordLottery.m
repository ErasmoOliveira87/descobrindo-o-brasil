//
//  HangManWordLottery.m
//  DescobrindoBrasil
//
//  Created by ELTON CARLOS DOS SANTOS on 21/07/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import "HangManWordLottery.h"

@implementation HangManWordLottery


- (id)init
{
    
    self = [super init];
    if(self){
        
        self.word = [[NSString alloc]init];
        self.charade = [[NSString alloc]init];
        
        
    }
    return self;
}



-(void) getRandomWord{
    
    NSDictionary *newDicionario = [self allWord];
    //escolha do array de categoria escolhida!
    NSArray *arrayConjuntoDeVerbo = [newDicionario objectForKey:@"Verbo"];
    NSArray *arrayConjuntodeCharada = [newDicionario objectForKey:@"Charada"];
    int randowIndexConjuntoDePalavras = arc4random() % [arrayConjuntoDeVerbo count];
    NSString *wordSeleted = [arrayConjuntoDeVerbo objectAtIndex:randowIndexConjuntoDePalavras];
    NSString *charadeSelect = [arrayConjuntodeCharada objectAtIndex:randowIndexConjuntoDePalavras];
    self.word = wordSeleted;
    self.charade = charadeSelect;
    
}

-(NSDictionary*)allWord{
    
    NSString *jsonPath2 = [[NSBundle mainBundle] pathForResource:@"palavras_categorias" ofType:@"json"];
    NSData *jsonData2 = [NSData dataWithContentsOfFile:jsonPath2];
    NSError *error = nil;
    NSDictionary *parseData = [NSJSONSerialization JSONObjectWithData:jsonData2 options:0 error:&error] ; nil;
    return parseData;
    
}


@end


