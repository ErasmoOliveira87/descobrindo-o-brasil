//
//  HangControllerViewController.m
//  DescobrindoBrasil
//
//  Created by Matheus Alves Silveira on 15/07/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import "HangViewController.h"
#import "HangManView.h"
#import "ScoreViewController.h"
#import "StatesRepository.h"


@interface HangViewController () <UIAlertViewDelegate>
@property (strong, nonatomic) HangManView *hangManView;
@property int errors;
@property (weak, nonatomic) IBOutlet UILabel *askLabel;
@property (weak, nonatomic) IBOutlet UIButton *chanceButton;
@property(strong,nonatomic) UIAlertView *alertView;
@property(strong,nonatomic) UIAlertView *alertViewMensagem;
@property(weak,nonatomic)NSString *valueButtonChancer;
@property (nonatomic, strong) NSString * sortedWord;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnBack;
@property (nonatomic) int pontuation;





@end

@implementation HangViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];                                                           // estático
    self.hangManView = [[HangManView alloc] initWithFrame:CGRectMake(20, 20, 728, 516)];
    [super viewDidLoad];                                                           // estático

    [self reset];
    
    self.keyboardView.delegate = self;
    
    [self.navigationItem setTitle:@"Forca Misteriosa"];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    [self.keyboardView resetKeyboard];
    [self reset];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didSelectChar:(NSString *)character {
    
    int control=1;
    
    NSString *simpleCharacter = [character stringByFoldingWithOptions:NSDiacriticInsensitiveSearch locale:[NSLocale currentLocale]];
    simpleCharacter = [simpleCharacter stringByFoldingWithOptions:NSCaseInsensitiveSearch locale:[NSLocale currentLocale]];
    
    char key = [simpleCharacter characterAtIndex:0];
    control = [self.wordView selectChar:key];

    if(control ==0){
        self.errors++;
        [self.hangManView addMember];
         NSLog(@"control %i", control);
        if (self.errors > 6) {
            [self performSegueWithIdentifier:@"score" sender:self];
        }
    }    //Se o control for 2 o jogador conquista a vitória.
    else if (control == 2)
    {
        self.state.points = self.pontuation;
        
    }
    
}

-(int)stars
{
    if (self.pontuation >150) {
        return 3;
    }
    else if (self.pontuation >=90)
        return 2;
    else if (self.pontuation >=40)
        return 1;
    else
    {
        return 0;
    }
    
}

-(int)pontuation {
    
    int score = (100 - self.errors*10);
    
    return score;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    //alertView: Chutar
    if(alertView == self.alertView){

        NSString *wordChance = [[[self.alertView textFieldAtIndex:0] text] uppercaseString];
        
        
        switch (buttonIndex) {
            case 0:
                //Cancelar
                break;
            case 1:
                //Compara a a palavra sorteada com a palavra digitada!
                if([self.sortedWord isEqualToString:wordChance] ){
                    
                    self.state.points = (self.pontuation+100);
                    [self performSegueWithIdentifier:@"score" sender:self];
                    
                }
                else{
                    [self performSegueWithIdentifier:@"score" sender:self];
                    
                    
                }
                break;
            default:
                
                break;
        }
        
        //alertView: Parabens você ganhou
    }else if(alertView == self.alertViewMensagem){
        
        [self reset];
        
    }
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"score"]) {
        ScoreViewController * scoreViewController = [segue destinationViewController];
        scoreViewController.score = self.pontuation;
        scoreViewController.stars = [self stars];
        
    }
}

-(void)reset{
    self.stateLabel.text = self.state.name;
    self.errors = 0;
    
    if([self.state.questions count] == 0) {
        NSLog(@"erro, estado sem perguntas");
        self.state = [StatesRepository stateForName:@"PE"];
    }
    
    HangmanQuestion * question = [self.state.questions objectAtIndex:arc4random() % [self.state.questions count]];
    self.sortedWord = question.answer;
    self.askLabel.text = question.question;
    [self.wordView resetWithWord:self.sortedWord];
    [self.keyboardView resetKeyboard];
    [self.hangManView eraseHangMan];
}


- (IBAction)evenChance:(UIButton *)sender {
    self.alertView = [[UIAlertView alloc] initWithTitle:@"Você vai arriscar?"
                                                message:@"Boa Sorte!" delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:@"OK", nil];
    
    self.alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    self.valueButtonChancer = sender.currentTitle;
    
    [self.alertView show];
    
    
}




/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
