//
//  StatesRepository.h
//  DescobrindoBrasil
//
//  Created by Leonardo Yvens on 06/08/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "State.h"

//Singleton, base de dados dos estados

@interface StatesRepository : NSObject

//array com todos os estados
+(NSArray*)sharedStates;

//retorna o estado pela sigla
+(State*)stateForName:(NSString*)stateName;

@end
