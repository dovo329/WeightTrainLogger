//
//  DetailCellTableViewCell.m
//  WeightTrainLogger
//
//  Created by Douglas Voss on 5/8/15.
//  Copyright (c) 2015 DougsApps. All rights reserved.
//

#import "DetailCellTableViewCell.h"

@implementation DetailCellTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.backgroundColor = [UIColor colorWithHue:0.6 saturation:0.2 brightness:1.0 alpha:1.0];
        
        self.descLabel = [[UILabel alloc] init];
        self.textField = [[UITextField alloc] init];
        self.plateCalcView = [[UIView alloc] init];
        
        //self.descLabel.backgroundColor = [UIColor clearColor];
        self.descLabel.backgroundColor = self.backgroundColor;
        self.textField.backgroundColor = [UIColor whiteColor];
        //self.plateCalcView.backgroundColor = [UIColor orangeColor];
        
        //self.descLabel.frame = CGRectMake(0.0, 80.0, 320.0, 10.0);
        //self.textField.frame = CGRectMake(0.0, 120.0, 320.0, 10.0);
        //self.plateCalcView.frame = CGRectMake(0.0, 200.0, 320.0, 10.0);
        
        [self.contentView addSubview:self.descLabel];
        [self.contentView addSubview:self.textField];
        //[self.contentView addSubview:self.plateCalcView];
        
    
        NSMutableArray *constraintsMutArr = [NSMutableArray new];
        [self descLabelConstraints:constraintsMutArr];
        [self textFieldConstraints:constraintsMutArr];
        [self.contentView addConstraints:constraintsMutArr];

        //self.descLabel.lineBreakMode = NSLineBreakByClipping;
        self.descLabel.textAlignment = NSTextAlignmentLeft;
        self.descLabel.numberOfLines = 1;
        self.descLabel.adjustsFontSizeToFitWidth = NO;
        int fontHeight = (int)(0.4*CGRectGetHeight(self.contentView.frame));
        self.descLabel.font = [UIFont systemFontOfSize:fontHeight];
        
        [self.textField setKeyboardType:UIKeyboardTypeNumberPad];
        self.textField.textAlignment = NSTextAlignmentCenter;
        self.textField.adjustsFontSizeToFitWidth = NO;
        self.textField.font = [UIFont systemFontOfSize:fontHeight];
        
        //self.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"CellNormal.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:0.0]];
        //self.selectedBackgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"CellHighlight.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:0.0]];
    }
    
    return self;
}

-(void)descLabelConstraints:(NSMutableArray *)mutArr {
    
    [self.descLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *descLabelXPosConstraint =
    [NSLayoutConstraint constraintWithItem:self.descLabel
                                 attribute:NSLayoutAttributeLeadingMargin
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.contentView
                                 attribute:NSLayoutAttributeLeadingMargin
                                multiplier:1.0
                                  constant:0.0];
    [mutArr addObject:descLabelXPosConstraint];
    
    NSLayoutConstraint *descLabelYPosConstraint =
    [NSLayoutConstraint constraintWithItem:self.descLabel
                                 attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.contentView
                                 attribute:NSLayoutAttributeCenterY
                                multiplier:1.0
                                  constant:0.0];
    [mutArr addObject:descLabelYPosConstraint];
    
    NSLayoutConstraint *descLabelWidthConstraint =
    [NSLayoutConstraint constraintWithItem:self.descLabel
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.contentView
                                 attribute:NSLayoutAttributeWidth
                                multiplier:0.7
                                  constant:0.0];
    [mutArr addObject:descLabelWidthConstraint];
    
    NSLayoutConstraint *descLabelHeightConstraint =
    [NSLayoutConstraint constraintWithItem:self.descLabel
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.contentView
                                 attribute:NSLayoutAttributeHeight
                                multiplier:0.9
                                  constant:0.0];
    [mutArr addObject:descLabelHeightConstraint];
}

-(void)textFieldConstraints:(NSMutableArray *)mutArr {
    
    [self.textField setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *xPosConstraint =
    [NSLayoutConstraint constraintWithItem:self.textField
                                 attribute:NSLayoutAttributeTrailingMargin
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.contentView
                                 attribute:NSLayoutAttributeTrailingMargin
                                multiplier:1.0
                                  constant:0.0];
    [mutArr addObject:xPosConstraint];
    
    NSLayoutConstraint *yPosConstraint =
    [NSLayoutConstraint constraintWithItem:self.textField
                                 attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.contentView
                                 attribute:NSLayoutAttributeCenterY
                                multiplier:1.0
                                  constant:0.0];
    [mutArr addObject:yPosConstraint];
    
    NSLayoutConstraint *widthConstraint =
    [NSLayoutConstraint constraintWithItem:self.textField
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.contentView
                                 attribute:NSLayoutAttributeWidth
                                multiplier:0.3
                                  constant:0.0];
    [mutArr addObject:widthConstraint];
    
    NSLayoutConstraint *heightConstraint =
    [NSLayoutConstraint constraintWithItem:self.textField
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.contentView
                                 attribute:NSLayoutAttributeHeight
                                multiplier:0.9
                                  constant:0.0];
    [mutArr addObject:heightConstraint];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    UIColor *backgroundColor = self.textField.backgroundColor;
    [super setHighlighted:highlighted animated:animated];
    self.imageView.backgroundColor = backgroundColor;
    [self resetBackgroundColors:backgroundColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    UIColor *backgroundColor = self.textField.backgroundColor;
    [super setSelected:selected animated:animated];
    self.imageView.backgroundColor = backgroundColor;
    [self resetBackgroundColors:backgroundColor];
}

- (void)resetBackgroundColors:(UIColor *)backgroundColor
{
    self.textField.backgroundColor = backgroundColor;
}

@end
