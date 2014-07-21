//
//  WordView.h
//  DescobrindoBrasil
//
//  Created by Matheus Alves Silveira on 15/07/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface WordView : UIView


-(bool)selectChar:(char) key;

-(void)resetWithWord:(NSString*)word;



@end
