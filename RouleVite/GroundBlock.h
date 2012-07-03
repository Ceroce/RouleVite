//
//  GroundBlock.h
//  RouleVite
//
//  Created by Renaud Pradenc on 03/07/12.
//  Copyright (c) 2012 Céroce. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    GroundBlockType_Basalt = '_',
    GroundBlockType_Peaks = 'w'
    
} GroundBlockType;

@interface GroundBlock : NSObject

@property (nonatomic, assign) CGRect rect;
@property (nonatomic, assign) GroundBlockType type;
- (void) draw;

@end
