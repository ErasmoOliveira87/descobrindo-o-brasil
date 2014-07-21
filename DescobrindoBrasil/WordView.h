//
//  WordView.h
//  DescobrindoBrasil
//
//  Created by Matheus Alves Silveira on 15/07/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol WordViewDelegate <NSObject>

-(void)addWordInLabel:(NSString*) latter;

@end

@interface WordView : UIView


@property (weak, nonatomic) id<WordViewDelegate> delegate;

-(void)InLabel:(NSString*)latter;


@end
