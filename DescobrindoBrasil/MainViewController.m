//
//  ViewController.m
//  DescobrindoBrasil
//
//  Created by Matheus Alves Silveira on 14/07/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet BrazilView *brazilView;



@end

@implementation MainViewController

#pragma mark VC Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
  //  self.statewithFlag = [[NSMutableArray alloc]initWithArray:@[@"SP" ]];
    
    self.statewithFlag = [[NSMutableArray alloc]init];
    
    //recebe eventos de toque do mapa
    self.brazilView.overlay.delegate = self;
    
    
}

-(void)viewDidAppear:(BOOL)animated{

    [super viewDidAppear:YES];
    
    [self.brazilView placeFlagsOnStates:self.statewithFlag];
    
   
        self.brazilView.overlay.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark MapOverlay Delegate

//verifica se o estado é da região sudeste, em caso afirmativo ativa o segue para o HangViewController
-(void)tapOnState:(NSString *)state {
    NSLog(@"passei aqui");
    
    //informacoes de model
    NSArray *sudeste = [NSArray arrayWithObjects:@"SP", @"MG", @"ES", @"RJ", nil];
    
    for (NSString *sudesteState in sudeste) {
        
        if([state isEqualToString:sudesteState])
        {
            
            [self.statewithFlag addObject:state];
            [self performSegueWithIdentifier:@"HangViewController" sender:self];
            break;
        }
    }
}

@end
