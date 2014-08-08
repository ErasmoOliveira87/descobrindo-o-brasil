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
@property (strong, nonatomic) NSString * currentState;



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

-(void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:YES];
    
    [self.brazilView placeFlagsOnStates:self.statewithFlag];
    
    self.brazilView.overlay.delegate = self;
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark MapOverlay Delegate

//verifica se o estado é da região sudeste, em caso afirmativo ativa o segue para o HangViewController
-(void)tapOnState:(NSString *)state {
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
@end
