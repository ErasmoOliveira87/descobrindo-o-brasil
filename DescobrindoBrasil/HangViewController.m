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
    
  //  character.doubleValue;
    char key='a';
    int control=1;
    
    NSArray *accentedLetters=@[@"A",@"Á",@"Â",@"Ã",@"E",@"É",@"C",@"Ç",@"I",@"Í",@"O",@"Ó",@"Ô",@"U",@"Ú",@"Û"];
    NSArray *accentedA= @[@"A",@"Á",@"Â",@"Ã"];
    NSArray *accentedE= @[@"E",@"É",@"Ê"];
    NSArray *accentedI= @[@"I",@"Í"];
    NSArray *accentedO= @[@"O",@"Ó",@"Ô"];
    NSArray *accentedU= @[@"U",@"Ú",@"Û"];
    NSArray *accentedC= @[@"C",@"Ç"];
    
    
    if([character isEqualToString:@"A"]){
    
         for(int lettersCount=0;lettersCount<[accentedA count];lettersCount++){
             
             key = [accentedA[lettersCount] characterAtIndex:0];
             
             
             
             NSLog(@"valor da variavel(A: %c", key);
             
             control = [self.wordView selectChar:key];
    
    }
        
    }//fim do if de A
    if ([character isEqualToString:@"E"]) {
        for(int lettersCount=0;lettersCount<[accentedE count];lettersCount++){
            
            key = [accentedE[lettersCount] characterAtIndex:0];
            
            
            
            NSLog(@"valor da variavel(E): %c", key);
            
            control = [self.wordView selectChar:key];
            
        }
    }//fim do if de E
    
    if ([character isEqualToString:@"I"]) {
        for(int lettersCount=0;lettersCount<[accentedI count];lettersCount++){
            
            key = [accentedI[lettersCount] characterAtIndex:0];
            
            
            
            NSLog(@"valor da variavel(I: %c", key);
            
            control = [self.wordView selectChar:key];
            
        }
    }//fim do if de I
    
    if ([character isEqualToString:@"O"]) {
        for(int lettersCount=0;lettersCount<[accentedO count];lettersCount++){
            
            key = [accentedO[lettersCount] characterAtIndex:0];
            
            
            
            NSLog(@"valor da variavel(O): %c", key);
            
            control = [self.wordView selectChar:key];
            
        }
    }//fim do if de O
    
    if ([character isEqualToString:@"U"]) {
        for(int lettersCount=0;lettersCount<[accentedU count];lettersCount++){
            
            key = [accentedU[lettersCount] characterAtIndex:0];
            
            
            
            NSLog(@"valor da variavel(U): %c", key);
            
            control = [self.wordView selectChar:key];
            
        }
    }//fim do if de U
    
    
    if ([character isEqualToString:@"C"]) {
        for(int lettersCount=0;lettersCount<[accentedC count];lettersCount++){
            
            key = [accentedC[lettersCount] characterAtIndex:0];
            
            
            
            NSLog(@"valor da variavel(C): %c", key);
            
            control = [self.wordView selectChar:key];
            
        }
    }else{
    
    key = [character characterAtIndex:0];
    
    
    
    NSLog(@"valor da variavel sem vogais ou C: %c", key);
    
    control = [self.wordView selectChar:key];
    
    NSLog(@"valor do CONTROL: %i", control);
    
    
    
}
/*
    if(([character isEqualToString:@"A"])||([character isEqualToString:@"B"])||([character isEqualToString:@"C"])||([character isEqualToString:@"D"])||([character isEqualToString:@"E"])||([character isEqualToString:@"C"])){
        
        for(int lettersCount=0;lettersCount<[accentedLetters count];lettersCount++){
        
            
            
            key = [accentedLetters[lettersCount] characterAtIndex:0];
            
            
            
            NSLog(@"valor da variavel(A,B,C,D,E,C): %c", key);
            
            control = [self.wordView selectChar:key];
            
            NSLog(@"valor do CONTROL: %i", control);
        
            
           // if((control==1)||(control==2)){
            
            //    lettersCount = [accentedLetters count];
                
            //    NSLog(@"Quando control é 1 ou 2, Valor da variavel: %c", key);

           // }
            
        }
        
        
        
     // NSLog(@"valor da variavel %i", character.length);
    }else{
    
        key = [character characterAtIndex:0];
        
        
        
        NSLog(@"valor da variavel sem vogais ou C: %c", key);
        
        control = [self.wordView selectChar:key];
        
        NSLog(@"valor do CONTROL: %i", control);
    
    
    
    }
    */
    
    // key = [character characterAtIndex:0];
    // control = [self.wordView selectChar:key];
    if(control ==0){
        self.errors++;
        [self.hangManView addMember];
        if (self.errors > 6) {
            
            [self alert:@"VOCÊ ERROU!  A palavra era:"subtitle:self.hangManWordLottery.word];        }
    }
    else if (control == 2)
    {
        
        [self alert:@"VOCÊ GANHOU" subtitle: [NSString stringWithFormat:@"Muito Bom, Meus Parabéns você atingiu %d pontos",[self getPontuation]]];
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


-(void)alert:(NSString*)title subtitle: (NSString*)subtitle{
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
                    
                    [self alert:@"VOCÊ GANHOU!  A palavra era essa mesma"  subtitle: [NSString stringWithFormat:@"Super Pontuacao: %d ",[self getPontuation] + 100]];
                    
                    
                    
                }else{
                    [self alert:@"VOCÊ ERROU!  A palavra era:"subtitle:wordLottery];
                    
                    
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
