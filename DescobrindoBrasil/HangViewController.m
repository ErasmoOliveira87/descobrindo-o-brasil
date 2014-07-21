//
//  HangControllerViewController.m
//  DescobrindoBrasil
//
//  Created by Matheus Alves Silveira on 15/07/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import "HangViewController.h"
#import "HangManView.h"

@interface HangViewController ()
@property (weak, nonatomic) IBOutlet HangManView *hangManView;
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
    
    [self.wordView resetWithWord:@"MATHEUS"];
    
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
    if(![self.wordView selectChar:key]){
        self.errors++;
        [self.hangManView addMember];
        
    }
        
}

-(void)resetButton{

    KeyboardView *viewKeyboard = self.keyboardView;
    self.errors = 0;
    [self.wordView resetWithWord:@"WORD"];
    
    [viewKeyboard buttonEnable];
    

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
