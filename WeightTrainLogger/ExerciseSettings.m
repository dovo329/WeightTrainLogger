//
//  ExerciseSettings.m
//  MasterDetailProject
//
//  Created by Douglas Voss on 5/8/15.
//  Copyright (c) 2015 Doug. All rights reserved.
//

#import "ExerciseSettings.h"
#import "Exercise.h"

@implementation ExerciseSettings

+(ExerciseSettings *)sharedInstance
{
    static ExerciseSettings *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ExerciseSettings alloc] init];
    });
    return sharedInstance;
}

-(id)init
{
    self.exerciseObjects = [[NSMutableArray alloc] init];
    
    Exercise *exercise1 = [[Exercise alloc] init];
    exercise1.name = @"Squat";
    exercise1.bodyWeight = 275;
    exercise1.workWeight = 275;
    exercise1.warmupBaseWeight = 45;
    exercise1.numWarmupSets = 4;
    exercise1.numWorkSets = 3;
    [self.exerciseObjects addObject:exercise1];
    
    Exercise *exercise2 = [[Exercise alloc] init];
    exercise2.name = @"Deadlift";
    exercise2.bodyWeight = 275;
    exercise2.workWeight = 315;
    exercise2.warmupBaseWeight = 135;
    exercise2.numWarmupSets = 3;
    exercise2.numWorkSets = 1;
    [self.exerciseObjects addObject:exercise2];
    
    Exercise *exercise3 = [[Exercise alloc] init];
    exercise3.name = @"Overhead Press";
    exercise3.bodyWeight = 275;
    exercise3.workWeight = 125;
    exercise3.warmupBaseWeight = 45;
    exercise3.numWarmupSets = 4;
    exercise3.numWorkSets = 3;
    [self.exerciseObjects addObject:exercise3];
    
    return self;
}

-(int)count {
    return (int)([self.exerciseObjects count]);
}

@end
