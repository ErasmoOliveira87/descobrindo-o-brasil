//
//  ScoreViewController.m
//  DescobrindoBrasil
//
//  Created by Matheus Alves Silveira on 31/07/14.
//  Copyright (c) 2014 Matheus Alves Silveira. All rights reserved.
//

#import "ScoreViewController.h"
#import "ScoreView.h"

@interface ScoreViewController ()

@property (weak, nonatomic) IBOutlet ScoreView *scoreView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel;
@property (weak, nonatomic) IBOutlet UIButton *avanceButton;
@property (weak, nonatomic) IBOutlet UIButton *playAgainButton;


@end

@implementation ScoreViewController

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
    

    // Do any additional setup after loading the view.
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.stars == 0) {
        self.titleLabel.text = @"Você Perdeu!";
        [self.scoreView.firstStar setImage:[UIImage imageNamed:@"starLose"]];
        [self.scoreView.secondStar setImage:[UIImage imageNamed:@"starLose"]];
        [self.scoreView.thirdStar setImage:[UIImage imageNamed:@"starLose"]];
        self.avanceButton.enabled = false;
        
    }
    else{
         self.titleLabel.text = @"Parabéns!";
        if (self.stars == 1) {
                  self.avanceButton.enabled = true;
            [self.scoreView.firstStar setImage:[UIImage imageNamed:@"starWin"]];
            [self.scoreView.secondStar setImage:[UIImage imageNamed:@"starLose"]];
            [self.scoreView.thirdStar setImage:[UIImage imageNamed:@"starLose"]];
        }
        else if (self.stars == 2){
            [self.scoreView.firstStar setImage:[UIImage imageNamed:@"starWin"]];
            [self.scoreView.secondStar setImage:[UIImage imageNamed:@"starWin"]];
            [self.scoreView.thirdStar setImage:[UIImage imageNamed:@"starLose"]];
        }
        else{
            [self.scoreView.firstStar setImage:[UIImage imageNamed:@"starWin"]];
            [self.scoreView.secondStar setImage:[UIImage imageNamed:@"starWin"]];
            [self.scoreView.thirdStar setImage:[UIImage imageNamed:@"starWin"]];
        }
    }
self.pointsLabel.text = [NSString stringWithFormat:@"%d pontos",self.score];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backToRoot:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)backHangman:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
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
