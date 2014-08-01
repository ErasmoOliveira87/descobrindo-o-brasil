//
//  HangControllerViewController.m
//  DescobrindoBrasil
//
//  Created by Matheus Alves Silveira on 15/07/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import "HangViewController.h"
#import "HangManView.h"
#import "HangManWordLottery.h"
#import "ScoreViewController.h"
#import "Score.h"


@interface HangViewController () <UIAlertViewDelegate>
@property (strong, nonatomic) HangManView *hangManView;
@property int errors;
@property (weak, nonatomic) IBOutlet UILabel *charadaLabel;
@property (weak, nonatomic) IBOutlet UIButton *chanceButton;
@property(strong,nonatomic) UIAlertView *alertView;
@property(strong,nonatomic) UIAlertView *alertViewMensagem;
@property(weak,nonatomic)NSString *valueButtonChancer;
@property (nonatomic, strong) Score * score;
@property (nonatomic,strong) NSString * state;
@property int pontuation;




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
    [super viewDidLoad];
    self.score = [[Score alloc]init];
    self.state = @"SP";                                                               // estático
    self.hangManView = [[HangManView alloc] initWithFrame:CGRectMake(20, 20, 728, 516)];
    [self.view addSubview:self.hangManView];
    self.hangManWordLottery = [[HangManWordLottery alloc]init];
    [self.hangManWordLottery getRandomWord]; //sorteia palavra e charada!
    NSString *wordLottery = self.hangManWordLottery.word;
    [self.wordView resetWithWord:wordLottery];
    self.charadaLabel.text = self.hangManWordLottery.charade;
    self.keyboardView.delegate = self;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didSelectChar:(NSString *)character {
    char key = [character characterAtIndex:0];
    int control = [self.wordView selectChar:key];
    if(control ==0){
        self.errors++;
        [self.hangManView addMember];
        if (self.errors > 6) {
            self.pontuation = 0;
            [self performSegueWithIdentifier:@"score" sender:self];
        }
    }
    else if (control == 2)
    {
        self.pontuation = [self getPontuation];
        [self.score replaceScorePoints:self.pontuation inState:self.state];
        [self performSegueWithIdentifier:@"score" sender:self];
        
    }
    
}

-(int)stars
{
    if (self.pontuation >150) {
        return 3;
    }
    else if (self.pontuation >=100)
        return 2;
    else if (self.pontuation >=40)
        return 1;
    else
    {
        return 0;
    }
    
}

-(int)getPontuation {
    if (self.errors == 0) {
        return 100;
    }
    else {
        return (100 - self.errors*10);
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    //alertView: Chutar
    if(alertView == self.alertView){
        
        NSString *wordLottery = self.hangManWordLottery.word;
        NSString *wordChance = [[[self.alertView textFieldAtIndex:0] text] uppercaseString];
        
        
        switch (buttonIndex) {
            case 0:
                //Cancelar
                break;
            case 1:
                //Compara a a palavra sorteada com a palavra digitada!
                if([wordLottery isEqualToString:wordChance] ){
                    
                    self.pontuation = ([self getPontuation]+100);
                    [self.score replaceScorePoints: self.pontuation inState:self.state];
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
    self.errors = 0;
    
    [self.hangManWordLottery getRandomWord];
    
    NSString *newWordLottery = self.hangManWordLottery.word;
    
    self.charadaLabel.text = self.hangManWordLottery.charade;
    [self.wordView resetWithWord:newWordLottery];
    
    [self.keyboardView buttonEnable];
    
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
