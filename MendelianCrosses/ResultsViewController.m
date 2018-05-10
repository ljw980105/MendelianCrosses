//
//  ResultsViewController.m
//  MendelianCrosses
//
//  Created by Jing Wei Li on 5/10/18.
//  Copyright © 2018 Jing Wei Li. All rights reserved.
//

#import "ResultsViewController.h"

@interface ResultsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *firstHeader;
@property (weak, nonatomic) IBOutlet UILabel *secondHeader;
@property (weak, nonatomic) IBOutlet UILabel *thirdHeader;
@property (weak, nonatomic) IBOutlet UILabel *fourthHeader;

@property (weak, nonatomic) IBOutlet UILabel *firstCombined;
@property (weak, nonatomic) IBOutlet UILabel *secondCombined;
@property (weak, nonatomic) IBOutlet UILabel *thirdCombined;
@property (weak, nonatomic) IBOutlet UILabel *fourthCombined;
@end

@implementation ResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // set the green headers
    _firstHeader.text = _crossResults[0];
    _secondHeader.text = _crossResults[1];
    _thirdHeader.text = _crossResults[2];
    _fourthHeader.text = _crossResults[3];
    
    //set cross results
    _firstCombined.text = _crossResults[4];
    _secondCombined.text = _crossResults[5];
    _thirdCombined.text = _crossResults[6];
    _fourthCombined.text = _crossResults[7];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
