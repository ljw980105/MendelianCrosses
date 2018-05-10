//
//  MendelianCrossesModel.h
//  MendelianCrosses
//
//  Created by Jing Wei Li on 5/9/18.
//  Copyright © 2018 Jing Wei Li. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MendelianCrossesModel : NSObject

@property (strong, nonatomic) NSString* firstGenome;
@property (strong, nonatomic) NSString* secondGenome;
@property (strong, nonatomic) NSMutableArray<NSString*>* results;

- (void) setGenome: (NSString *)first secondString:(NSString *)second;
- (void) setCrossResults;
- (NSMutableArray <NSString*> *) getCrossResults;

@end



