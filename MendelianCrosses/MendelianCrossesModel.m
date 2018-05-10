//
//  MendelianCrossesModel.m
//  MendelianCrosses
//
//  Created by Jing Wei Li on 5/9/18.
//  Copyright © 2018 Jing Wei Li. All rights reserved.
//

#import "MendelianCrossesModel.h"

@interface MendelianCrossesModel()

@end

@implementation MendelianCrossesModel

- (instancetype)init {
    if (self = [super init]) {
        _firstGenome = @"";
        _secondGenome = @"";
    }
    return self;
}

- (void)setGenome:(NSString *)first secondString:(NSString *)second{
    _firstGenome = first;
    _secondGenome = second;
}

- (NSMutableArray *)results{
    NSUInteger length1 = [_firstGenome length];
    NSUInteger length2 = [_secondGenome length];
    if (length1 != length2) return nil;
    if (!( length1 == 2 || length1 == 4 )) return nil;
    NSMutableArray *res = [[NSMutableArray alloc] init];
    if (length1 == 2){ // monohybrid cross
        
    } else { // dihybrid cross
        
    }
    return res;
}


@end




