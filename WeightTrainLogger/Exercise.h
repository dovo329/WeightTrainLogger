//
//  Exercise.h
//  MasterDetailProject
//
//  Created by Douglas Voss on 5/8/15.
//  Copyright (c) 2015 Doug. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Exercise : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic) int bodyWeight;
@property (nonatomic) int workWeight;
@property (nonatomic) int warmupBaseWeight;
@property (nonatomic) int numWarmupSets;
@property (nonatomic) int numWorkSets;

-(id)Exercise;

@end
