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


@interface HangViewController () <UIAlertViewDelegate>
@property (strong, nonatomic) HangManView *hangManView;
@property int errors;
@property (weak, nonatomic) IBOutlet UILabel *charadaLabel;

@property (weak, nonatomic) IBOutlet UIButton *chanceButton;

@property(strong,nonatomic) UIAlertView *alertView;

@property(strong,nonatomic) UIAlertView *alertViewMensagem;

@property(weak,nonatomic)NSString *valueButtonChancer;

@property(nonatomic)int confirma;


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
            
            [self alert:@"VOCÊ PERDEU" :@"Que pena, não foi dessa vez" ];
        }
    }
    else if (control == 2)
    {
        
       [self alert:@"VOCÊ GANHOU" : [NSString stringWithFormat:@"Muito Bom, Meus Parabéns você atingiu %d pontos",[self getPontuation]]];
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


-(void)alert:(NSString*)title: (NSString*)subtitle{
   // UIAlertView *myAlertView;
    
self.alertViewMensagem = [[UIAlertView alloc] initWithTitle:title
                                                          message:subtitle delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [self.alertViewMensagem show];
   // [self reset];
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
                    
                    [self alert:@"VOCÊ GANHOU!  A palavra era essa mesma"  : [NSString stringWithFormat:@"Super Pontuacao: %d ",[self getPontuation] + 1000]];
                    
                    NSLog(@"GANHOU:! ");
                    
                }else{
                    [self alert:@"VOCÊ ERROU!  A palavra era:":wordLottery];
                    
                    NSLog(@"ERROU:! ");
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

-(void)reset{
    self.errors = 0;
    
    [self.hangManWordLottery getRandomWord];
    
    NSString *newWordLottery = self.hangManWordLottery.word;
    
    self.charadaLabel.text = self.hangManWordLottery.charade;
    [self.wordView resetWithWord:newWordLottery];
    
    [self.keyboardView buttonEnable];
    
    [self.hangManView eraseHangMan];
}


- (IBAction)EvenChance:(UIButton *)sender {
    /*UIAlertView *myAlertView2*/; self.alertView = [[UIAlertView alloc] initWithTitle:@"Você vai arriscar?"
                                                          message:@"Boa Sorte!" delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:@"OK", nil];
    
    self.alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    self.valueButtonChancer = sender.currentTitle;
    
    [self.alertView show];
    
    
    /*
    NSLog(@"Botão valor: %@", self.valueButtonChancer);
    
    
   
        
        NSLog(@"QUE PALAVRA DIGITADA: %@",[[self.alertView textFieldAtIndex:0] text]);
        
        NSString *wordLottery = self.hangManWordLottery.word;
        NSString *wordChance = [[[self.alertView textFieldAtIndex:0] text] uppercaseString];
    if(self.confirma==1){
        
        
        //Compara a a palavra sorteada com a palavra digitada!
        if([wordLottery isEqualToString:wordChance] ){
            
               [self alert:@"VOCÊ GANHOU!  A palavra era essa mesma"  : wordLottery];
            
            NSLog(@"GANHOU:! ");
            
            
            
         //   [self reset];
            
        }else{
            [self alert:@"VOCÊ ERROU!  A palavra era:":wordLottery];
            
            
            NSLog(@"ERROU:! ");
           // [self reset];
        }
        
        self.confirma=0;
    }
    
        
        NSLog(@"wordLoterry:! %@", wordLottery);
        NSLog(@"wordChance! %@", wordChance);
    
    
    
    */
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
