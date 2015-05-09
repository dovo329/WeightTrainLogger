//
//  ListViewController.m
//  MasterDetailProject
//
//  Created by Douglas Voss on 5/8/15.
//  Copyright (c) 2015 Doug. All rights reserved.
//

#import "ExerciseListViewController.h"
#import "ExerciseSettings.h"
#import "ExerciseDetailViewController.h"

static const NSString *cellID = @"cellID";

@interface ExerciseListViewController ()

@end

@implementation ExerciseListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor yellowColor];
    self.title = @"Exercises";
    
    //UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(40.0, 80.0, 40.0, 40.0)];
    //UIView *subView = [[UIView alloc] init];
    //subView.frame = CGRectMake(20.0, 80.0, 20.0, 20.0);
    //subView.backgroundColor = [UIColor blueColor];
    //[self.view addSubview:subView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [[ExerciseSettings sharedInstance] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:(NSString *)cellID];
    if (cell==nil) {
        // create the cell
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:(NSString *)cellID];
    }
    // Configure the cell...
    ExerciseSettings *exSettings = [ExerciseSettings sharedInstance];
    if (indexPath.row > [exSettings count]) {
        NSLog(@"Why is there a cell being requested at a row that is greater than the sharedInstance count?  The numberOfRowsInSection return value ought to make this impossible");
    }
    Exercise *exObj = [exSettings.exerciseObjects objectAtIndex:indexPath.row];
    cell.textLabel.text = exObj.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ExerciseDetailViewController *detailVC = [ExerciseDetailViewController new];
    
    ExerciseSettings *exSettings = [ExerciseSettings sharedInstance];
    detailVC.exercise = [exSettings.exerciseObjects objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:detailVC animated:YES];
}

//- tableView
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
