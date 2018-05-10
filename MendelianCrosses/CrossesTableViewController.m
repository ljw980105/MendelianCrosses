//
//  CrossesTableViewController.m
//  MendelianCrosses
//
//  Created by Jing Wei Li on 5/9/18.
//  Copyright © 2018 Jing Wei Li. All rights reserved.
//

#import "CrossesTableViewController.h"

@interface CrossesTableViewController ()

@end

@implementation CrossesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _crosses= [[MendelianCrossesModel alloc] init];
}

- (IBAction)computeCrosses:(UIBarButtonItem *)sender {
    // retrieve the texts
    NSIndexPath *firstIndex = [NSIndexPath indexPathForRow:0 inSection:0];
    UITextField *firstTextField = (UITextField *) [[[self.tableView cellForRowAtIndexPath: firstIndex] contentView] subviews][1];
    NSString *firstGenome = firstTextField.text;
    
    NSIndexPath *secondIndex = [NSIndexPath indexPathForRow:1 inSection:0];
    UITextField *secondTextField = (UITextField *) [[[self.tableView cellForRowAtIndexPath: secondIndex] contentView] subviews][1];
    NSString *secondGenome = secondTextField.text;
    //NSLog(@"First: %@, Second: %@",firstGenome, secondGenome);
    
    [firstTextField resignFirstResponder];
    [secondTextField resignFirstResponder];
    
    [_crosses setGenome:firstGenome secondString:secondGenome];
    [_crosses setCrossResults];
    if ([[_crosses getCrossResults] count] != 0){
        dispatch_async(dispatch_get_main_queue(), ^{
            [self performSegueWithIdentifier:@"showCrosses" sender:self];
        });
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"Illegal" message: @"The data entered has incorrect format" preferredStyle:UIAlertControllerStyleAlert];
        [alert view].tintColor = [UIColor colorWithRed:87/(Float32)255 green:169/(Float32)255 blue:67/(Float32)255 alpha:1];
        [alert addAction:[UIAlertAction actionWithTitle:@"Done" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {}]];
        [self presentViewController: alert animated:true completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Enter Information";
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"crossCell" forIndexPath:indexPath];
    if (cell != nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"crossCell"];
        cell.accessoryType = UITableViewCellAccessoryNone;
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(110, 10, 185, 30)];
        textField.adjustsFontSizeToFitWidth = YES;
        textField.textColor = [UIColor blackColor];
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        textField.backgroundColor = [UIColor whiteColor];
        
        switch ([indexPath row]) {
            case 0:
                //UITextField *textField1 = [[UITextField alloc] initWithFrame:CGRectMake(110, 10, 185, 30)];
                cell.textLabel.text = @"First";
                textField.placeholder = @"Enter First Genome";
                textField.returnKeyType = UIReturnKeyNext;
                break;
            case 1:
                cell.textLabel.text = @"Second";
                textField.placeholder = @"Enter Second Genome";
                textField.returnKeyType = UIReturnKeyDone;
                break;
            default:
                break;
        }
        [textField setEnabled:YES];
        [cell.contentView addSubview:textField];
    }
    
    // Configure the cell...
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier]  isEqual: @"showCrosses"]){
        ResultsViewController *vc = (ResultsViewController *) [segue destinationViewController];
        vc.crossResults = [_crosses getCrossResults];
    }
}


@end
