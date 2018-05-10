//
//  MendelianCrossesModel.h
//  MendelianCrosses
//
//  Created by Jing Wei Li on 5/9/18.
//  Copyright © 2018 Jing Wei Li. All rights reserved.
//s

#import <Foundation/Foundation.h>

@interface MendelianCrossesModel : NSObject

@property (strong, nonatomic) NSString* firstGenome;
@property (strong, nonatomic) NSString* secondGenome;

- (void) setGenome: (NSString *)first secondString:(NSString *)second;
- (NSMutableArray *) results;

@end



