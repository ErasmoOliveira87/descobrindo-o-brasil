//
//  HangManWordLottery.m
//  DescobrindoBrasil
//
//  Created by ELTON CARLOS DOS SANTOS on 21/07/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import "HangManWordLottery.h"

@implementation HangManWordLottery





-(NSString*) getRandomWord{
    
    NSDictionary *newDicionario = [self allWord];
    
    NSArray *arrayCategorias= @[@"Frutas",@"Ferramentas"];
    
    int randowIndexCategoria = arc4random() % [arrayCategorias count];
    
    NSString *categoriaEscolha = arrayCategorias[randowIndexCategoria];
    
    //escolha do array de categoria escolhida!
    NSArray *arrayConjuntoDePalavras = [newDicionario objectForKey:categoriaEscolha];
    
    int randowIndexConjuntoDePalavras = arc4random() % [arrayConjuntoDePalavras count];
    
    
    NSString *wordSeleted = [arrayConjuntoDePalavras objectAtIndex:randowIndexConjuntoDePalavras];
    
    
    
    
    return wordSeleted;
}

-(NSDictionary*)allWord{

  
    
    NSString *jsonPath2 = [[NSBundle mainBundle] pathForResource:@"palavras_categorias" ofType:@"json"];
    
    NSData *jsonData2 = [NSData dataWithContentsOfFile:jsonPath2];
    
    NSError *error = nil;
    
    //   NSDictionary *parsedData =  [NSJSONSerialization JSONObjectWithData:jsonData2 options:0 error:&error] ; nil;
    
    
    NSDictionary *parseData = [NSJSONSerialization JSONObjectWithData:jsonData2 options:0 error:&error] ; nil;


    return parseData;

}


@end


