//
//  GroundBlock.m
//  RouleVite
//
//  Created by Renaud Pradenc on 03/07/12.
//  Copyright (c) 2012 Céroce. All rights reserved.
//

#import "GroundBlock.h"

@implementation GroundBlock

@synthesize rect;
@synthesize type;

- (void) draw
{
    UIColor *color;
    if(type == GroundBlockType_Basalt)
        color = [UIColor grayColor];
    else
        color = [UIColor whiteColor];
    
    [color setFill];
    UIRectFill(rect);
}

@end
