//
//  Exercise.m
//  MasterDetailProject
//
//  Created by Douglas Voss on 5/8/15.
//  Copyright (c) 2015 Doug. All rights reserved.
//

#import "Exercise.h"

@implementation Exercise

-(id)Exercise {
    self.name = @"";
    self.bodyWeight = 0;
    self.workWeight = 0;
    self.warmupBaseWeight = 0;
    self.numWarmupSets = 0;
    self.numWorkSets = 0;
    self.workSetRepArr = [NSMutableArray arrayWithCapacity:self.numWorkSets];
    
    return self;
}

@end
