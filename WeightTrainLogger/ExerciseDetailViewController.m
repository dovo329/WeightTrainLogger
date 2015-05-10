//
//  DetailViewController.m
//  MasterDetailProject
//
//  Created by Douglas Voss on 5/8/15.
//  Copyright (c) 2015 Doug. All rights reserved.
//

#import "ExerciseDetailViewController.h"
#import "DetailCellTableViewCell.h"

static const NSString *cellID = @"detailCellID";

@interface ExerciseDetailViewController ()

@end

@implementation ExerciseDetailViewController

-(void)viewWillDisappear:(BOOL)animated {
    NSString *itemToPassBack = @"Pass this value back to ListViewController";
    [self.delegate addItemViewController:self didFinishEnteringItem:itemToPassBack];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //UIColor *backgroundPatternColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"chrome-mesh.png"]];
    //self.tableView.backgroundColor = backgroundPatternColor;
    
    //self.numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 0, CGRectGetHeight(self.view.frame)*0.1)];
    self.numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    self.numberToolbar.items = [NSArray arrayWithObjects:
     [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                   [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [self.numberToolbar sizeToFit];
    
    self.title = self.exercise.name;
    
    for (int i=0; i< self.exercise.numWorkSets; i++) {
        [self.exercise.workSetRepArr addObject:[NSNumber numberWithInt:0]];
    }
    
    //UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    //[self.view addGestureRecognizer:tap];
}

/*- (void)handleTap:(UITapGestureRecognizer *)recognizer
{
    [self.view endEditing:YES];
    //[self.view resignFirstResponder];
    //NSLog(@"handleTap started");
}*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    //NSLog(@"numberOfRowsInSection got called");
    return 4+self.exercise.numWarmupSets+1+self.exercise.numWorkSets;
}


- (void)textFieldDidEndEditing:(UITextField *)textField {
    // textField.tag == indexPath.row
    //NSLog(@"got here; textField.tag==%d", textField.tag);
    if (textField.tag == 0) {
        self.exercise.bodyWeight = [textField.text intValue];
    } else if (textField.tag == 1) {
        self.exercise.workWeight = [textField.text intValue];
    } else if (textField.tag == 2) {
        self.exercise.warmupBaseWeight = [textField.text intValue];
    } else if (textField.tag == 3) {
        self.exercise.numWarmupSets = [textField.text intValue];
    } else if (textField.tag >= 4 && textField.tag < 4 + self.exercise.numWarmupSets) {

    } else if (textField.tag == (4 + self.exercise.numWarmupSets)) {
        self.exercise.numWorkSets = [textField.text intValue];
    } else {
        int workSetNum = (int)((textField.tag - (4 + self.exercise.numWarmupSets))-1);
        [self.exercise.workSetRepArr insertObject:[NSNumber numberWithInt:[textField.text intValue]] atIndex:workSetNum];
    }
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DetailCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:(NSString *)cellID];
    if (cell==nil) {
        // create the cell
        cell = [[DetailCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:(NSString *)cellID];
        //UITextField *newTextField = [[UITextField alloc] init];
        //cell.accessoryView = newTextField;
    }
    //UITextField *textField = [[UITextField alloc] initWithFrame:cell.accessoryView.frame];
    //UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0.0, 0.0, 50.0, 40.0)];
    cell.textField.tag = indexPath.row;
    cell.textField.delegate = self;
    //NSLog(@"cell.accessoryView=%@", cell.accessoryView);
    //NSLog(@"cell.accessoryView.frame=%@", cell.accessoryView.frame);
    // Configure the cell...
    if (indexPath.row == 0) {
        cell.descLabel.text = @"Bodyweight"; // UITableViewCell
        //cell.textLabel.text = @"Bodyweight";
        cell.textField.text = [NSString stringWithFormat:@"%d",(int)self.exercise.bodyWeight];
        //textField.text = [NSString stringWithFormat:@"%d",(int)self.exercise.bodyWeight];
        //textField.backgroundColor = [UIColor redColor];
        //cell.accessoryView = textField;
        //NSLog(@"0 cell.textField.tag == %d", cell.textField.tag);
        //cell.plateCalcView = ;
    } else if (indexPath.row == 1) {
        cell.descLabel.text = @"Work Weight";
        //cell.textLabel.text = @"Work Weight";
        cell.textField.text = [NSString stringWithFormat:@"%d",(int)self.exercise.bodyWeight];
        
        //NSLog(@"1 cell.textField.tag == %d", cell.textField.tag);
    } else if (indexPath.row == 2) {
        cell.descLabel.text = @"Start Weight";
        //cell.textLabel.text = @"Start Weight";
        cell.textField.text = [NSString stringWithFormat:@"%d",(int)self.exercise.warmupBaseWeight];
        
        //NSLog(@"2 cell.textField.tag == %d", cell.textField.tag);
    } else if (indexPath.row == 3) {
        cell.descLabel.text = @"# Warmup Sets";
        //cell.textLabel.text = @"# Warmup Sets";
        cell.textField.text = cell.textField.text = [NSString stringWithFormat:@"%d",(int)self.exercise.numWarmupSets];
        
        //NSLog(@"3 cell.textField.tag == %d", cell.textField.tag);
    } else if (indexPath.row >= 4 && indexPath.row < 4 + self.exercise.numWarmupSets) {
        //cell.textLabel.text = [NSString stringWithFormat:@"Warmup Set #%d", (int)((indexPath.row-4)+1)];
        cell.descLabel.text = [NSString stringWithFormat:@"Warmup Set #%d", (int)((indexPath.row-4)+1)];
        
        int startWeight = self.exercise.warmupBaseWeight;
        int endWeight = self.exercise.workWeight;
        int slope = ((endWeight - startWeight)/self.exercise.numWarmupSets);
        int warmupSetNum = (indexPath.row - 4);
        
        int warmupWeight = startWeight + (slope*warmupSetNum);
        warmupWeight = round(warmupWeight/5)*5; // round to nearest 5 lbs
        
        cell.textField.text = [NSString stringWithFormat:@"%d",(int)warmupWeight];
        
        //NSLog(@"4 cell.textField.tag == %d", cell.textField.tag);
        
    } else if (indexPath.row == (4 + self.exercise.numWarmupSets)) {
        cell.descLabel.text = @"# Work Sets";
        //cell.textLabel.text = @"# Work Sets";
        cell.textField.text = [NSString stringWithFormat:@"%d",(int)self.exercise.numWorkSets];
        
        //NSLog(@"work set cell.textField.tag == %d", cell.textField.tag);
    } else {
        int workSetNum = (int)(indexPath.row - (4 + self.exercise.numWarmupSets));
        cell.descLabel.text = [NSString stringWithFormat:@"Work Set #%d", workSetNum];
        int numReps = [[self.exercise.workSetRepArr objectAtIndex:(workSetNum-1)] intValue];
        if (numReps > 0) {
            cell.textField.text = [NSString stringWithFormat:@"%d", numReps];
        } else {
            cell.textField.text = @"";
        }
        //cell.textLabel.text = [NSString stringWithFormat:@"Work Set #%d", workSetNum];
        //cell.textField.text = @"";
        //NSLog(@"work set #%d cell.textField.tag == %d", workSetNum, cell.textField.tag);
    }
    
    cell.textField.inputAccessoryView = self.numberToolbar;
    
    return cell;
}

-(void)doneWithNumberPad{
    //NSLog(@"got here");
    [self.view endEditing:YES];
}

/*
 + (instancetype)constraintWithItem:(id)view1
 attribute:(NSLayoutAttribute)attr1
 relatedBy:(NSLayoutRelation)relation
 toItem:(id)view2
 attribute:(NSLayoutAttribute)attr2
 multiplier:(CGFloat)multiplier
 constant:(CGFloat)c
 Parameters
 view1
 The view for the left side of the constraint.
 attr1
 The attribute of the view for the left side of the constraint.
 relation
 The relationship between the left side of the constraint and the right side of the constraint.
 view2
 The view for the right side of the constraint.
 attr2
 The attribute of the view for the right side of the constraint.
 multiplier
 The constant multiplied with the attribute on the right side of the constraint as part of getting the modified attribute.
 c
 The constant added to the multiplied attribute value on the right side of the constraint to yield the final modified attribute.
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

@end
