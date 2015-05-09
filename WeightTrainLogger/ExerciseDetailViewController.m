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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIColor *backgroundPatternColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"chrome-mesh.png"]];
    self.tableView.backgroundColor = backgroundPatternColor;
    
    //self.numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 0, CGRectGetHeight(self.view.frame)*0.1)];
    self.numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    self.numberToolbar.items = [NSArray arrayWithObjects:
     [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                   [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [self.numberToolbar sizeToFit];
    
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
    return 4+self.exercise.numWarmupSets+1+self.exercise.numWorkSets;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DetailCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:(NSString *)cellID];
    if (cell==nil) {
        // create the cell
        cell = [[DetailCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:(NSString *)cellID];
    }
    // Configure the cell...
    if (indexPath.row == 0) {
        cell.descLabel.text = @"Bodyweight";
        //cell.textField.text = @"";
        //cell.plateCalcView = ;
    } else if (indexPath.row == 1) {
        cell.descLabel.text = @"Work Weight";
        //cell.textField.text = @"";
    } else if (indexPath.row == 2) {
        cell.descLabel.text = @"Start Weight";
        //cell.textField.text = @"";
    } else if (indexPath.row == 3) {
        cell.descLabel.text = @"# Warmup Sets";
        //cell.textField.text = @"";
    } else if (indexPath.row >= 4 && indexPath.row < 4 + self.exercise.numWarmupSets) {
        cell.descLabel.text = [NSString stringWithFormat:@"Warmup Set #%d", (int)((indexPath.row-4)+1)];
        //cell.textField.text = @"";
    } else if (indexPath.row == (4 + self.exercise.numWarmupSets)) {
        cell.descLabel.text = @"# Work Sets";
        //cell.textField.text = @"";
    } else {
        cell.descLabel.text = [NSString stringWithFormat:@"Work Set #%d", (int)(indexPath.row - (4 + self.exercise.numWarmupSets))];
        //cell.textField.text = @"";
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
