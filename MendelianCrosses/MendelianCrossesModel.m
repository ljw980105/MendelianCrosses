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
        _results = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)setGenome:(NSString *)first secondString:(NSString *)second{
    _firstGenome = first;
    _secondGenome = second;
}

- (void) setCrossResults{
    [_results removeAllObjects];
    NSUInteger length1 = [_firstGenome length];
    NSUInteger length2 = [_secondGenome length];
    if (length1 != length2) return;
    if (!( length1 == 2 || length1 == 4 )) return;
    if (length1 == 2){ // monohybrid cross
        NSRange firstRange = NSMakeRange(0, 1);
        NSRange secondRange = NSMakeRange(1, 1);
        NSString *first = [_firstGenome substringWithRange:firstRange];
        NSString *second = [_firstGenome substringWithRange:secondRange];
        NSString *third = [_secondGenome substringWithRange:firstRange];
        NSString *fourth = [_secondGenome substringWithRange:secondRange];
        [_results addObject:first];
        [_results addObject:second];
        [_results addObject:third];
        [_results addObject:fourth];
        [_results addObject:[first stringByAppendingString:third]];
        [_results addObject:[second stringByAppendingString: third]];
        [_results addObject:[first stringByAppendingString:fourth]];
        [_results addObject:[second stringByAppendingString:fourth]];
    }
}

- (NSMutableArray<NSString *> *)getCrossResults{
    return _results;
}


@end
