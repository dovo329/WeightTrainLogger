//
//  DetailViewController.h
//  MasterDetailProject
//
//  Created by Douglas Voss on 5/8/15.
//  Copyright (c) 2015 Doug. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Exercise.h"

@class ExerciseDetailViewController;

/*@protocol ExerciseDetailViewControllerDelegate <NSObject>
- (void)addItemViewController:(ExerciseDetailViewController *)controller didFinishEnteringItem:(NSString *)item;
@end*/

@interface ExerciseDetailViewController : UITableViewController <UITableViewDataSource, UIScrollViewDelegate, UITextFieldDelegate>

@property (nonatomic, strong) Exercise *exercise;
@property (nonatomic, strong) UIToolbar *numberToolbar;

//@property (nonatomic, weak) id <ExerciseDetailViewControllerDelegate> delegate;

@end
