//
//  HangControllerViewController.h
//  DescobrindoBrasil
//
//  Created by Matheus Alves Silveira on 15/07/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KeyboardView.h"

@interface HangViewController : UIViewController <KeyboardViewDelegate>

@property (weak, nonatomic) IBOutlet KeyboardView *keyboardView;



-(void)didSelectChar:(NSString *)character;

@end
