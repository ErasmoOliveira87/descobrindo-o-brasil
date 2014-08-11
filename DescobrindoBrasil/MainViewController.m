//
//  ViewController.m
//  DescobrindoBrasil
//
//  Created by Matheus Alves Silveira on 14/07/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import "MainViewController.h"
#import "HangViewController.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet BrazilView *brazilView;
<<<<<<< HEAD
@property (strong, nonatomic) NSString * currentState;

=======
@property (nonatomic) State* tappedState;

@property(nonatomic, strong) NSString *  currentState;
>>>>>>> b5b378aa686a23f894ead4a576cf50f6ee58ed80


@end

@implementation MainViewController

#pragma mark VC Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //  self.statewithFlag = [[NSMutableArray alloc]initWithArray:@[@"SP" ]];
    
<<<<<<< HEAD
    self.statewithFlag = [[NSMutableArray alloc]init];
=======
    self.statesWithFlag = [[NSMutableArray alloc]init];
>>>>>>> b5b378aa686a23f894ead4a576cf50f6ee58ed80
    
    //recebe eventos de toque do mapa
    self.brazilView.overlay.delegate = self;
    
    
}

<<<<<<< HEAD
-(void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:YES];
    
    [self.brazilView placeFlagsOnStates:self.statewithFlag];
    
    self.brazilView.overlay.delegate = self;
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    
=======
-(void)viewDidAppear:(BOOL)animated{

    [super viewDidAppear:YES];
    
    //posiciona a bandeira em estados com estrela no Hangman
    for (State *state in [StatesRepository sharedStates]) {
        
        if (state.hangmanStars > 0) {
            [self.statesWithFlag addObject:state];
        }
        
    }
    
    //posiciona bandeiras
    [self.brazilView placeFlagsOnStates:self.statesWithFlag];
    
    self.brazilView.overlay.delegate = self;
>>>>>>> b5b378aa686a23f894ead4a576cf50f6ee58ed80
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark MapOverlay Delegate

//verifica se o estado é da região sudeste, em caso afirmativo ativa o segue para o HangViewController
-(void)tapOnState:(NSString *)state {
<<<<<<< HEAD
    [self.statewithFlag addObject:state];
    self.currentState = state;
    
    [self.statewithFlag addObject:state];
    [self performSegueWithIdentifier:@"HangViewController" sender:self];
    
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"HangViewController" ]) {
        HangViewController * hangManViewController = [segue destinationViewController];
        hangManViewController.state = self.currentState;
        
    }
    
}
=======

    self.tappedState = [StatesRepository stateForName:state];
    
            [self performSegueWithIdentifier:@"HangViewController" sender:self];
    
    
}

 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
     if ([[segue identifier] isEqualToString:@"HangViewController" ]) {
         HangViewController * hangManViewController = [segue destinationViewController];
         hangManViewController.state = self.tappedState;
         
     }
     
 }
>>>>>>> b5b378aa686a23f894ead4a576cf50f6ee58ed80
@end
