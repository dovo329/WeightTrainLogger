//
//  DetailCellTableViewCell.h
//  WeightTrainLogger
//
//  Created by Douglas Voss on 5/8/15.
//  Copyright (c) 2015 DougsApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailCellTableViewCell : UITableViewCell

@property (nonatomic, strong, readwrite) UILabel *descLabel;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIView *plateCalcView;

@end
