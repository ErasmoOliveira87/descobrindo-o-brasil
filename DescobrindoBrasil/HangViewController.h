//
//  HangControllerViewController.h
//  DescobrindoBrasil
//
//  Created by Matheus Alves Silveira on 15/07/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KeyboardView.h"
#import "WordView.h"
#import "State.h"

@interface HangViewController : UIViewController <KeyboardViewDelegate>

@property (weak, nonatomic) IBOutlet KeyboardView *keyboardView;
@property(nonatomic)IBOutlet WordView *wordView;
<<<<<<< HEAD
@property(strong,nonatomic) HangmanData *hangManData;
@property (nonatomic,strong) NSString * state;
=======
>>>>>>> b5b378aa686a23f894ead4a576cf50f6ee58ed80

//estado selecionado
@property (nonatomic, strong) State* state;

//metodo do KeyboardViewDelegate, recebe um caracter da keyboardView
-(void)didSelectChar:(NSString *)character;

@end
