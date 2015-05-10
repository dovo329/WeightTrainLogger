//
//  ExerciseSettings.h
//  MasterDetailProject
//
//  Created by Douglas Voss on 5/8/15.
//  Copyright (c) 2015 Doug. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Exercise.h"

@interface ExerciseSettings : NSObject

@property (nonatomic, strong) NSMutableArray *exerciseObjects;

+(ExerciseSettings *)sharedInstance;
-(int)count;
//-(void)setWorkSetRepForExercise:(Exercise *)exercise set:(int)set reps:(int)reps;

@end
