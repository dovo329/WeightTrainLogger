//
//  DetailViewController.h
//  MasterDetailProject
//
//  Created by Douglas Voss on 5/8/15.
//  Copyright (c) 2015 Doug. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Exercise.h"

@interface ExerciseDetailViewController : UITableViewController <UITableViewDataSource>

@property (nonatomic, strong) Exercise *exercise;
@property (nonatomic, strong) UIToolbar *numberToolbar;

@end
