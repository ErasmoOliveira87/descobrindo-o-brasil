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
    
    NSString *wordLottery = [self.hangManWordLottery getRandomWord];
    
    [self.wordView resetWithWord:wordLottery];
    
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
       [self alert:@"VOCÊ GANHOU" :@"Muito Bom, Meus Parabéns, Continue assim" ];
    }
    
}



-(void)alert:(NSString*)title: (NSString*)subtitle{
    UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:title
                                                          message:subtitle delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [myAlertView show];
   // [self reset];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self reset];
}

-(void)reset{
    self.errors = 0;
    
    NSString *newWordLottery = [self.hangManWordLottery getRandomWord];
    [self.wordView resetWithWord:newWordLottery];
    
    [self.keyboardView buttonEnable];
    
    [self.hangManView eraseHangMan];
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
