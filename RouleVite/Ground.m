//
//  Ground.m
//  RouleVite
//
//  Created by Renaud Pradenc on 03/07/12.
//  Copyright (c) 2012 Céroce. All rights reserved.
//

#import "Ground.h"

@implementation Ground

@synthesize screenSize;
@synthesize height;

- (void) updateAtTimestamp:(CFTimeInterval)timestamp
{
    
}

- (void) draw
{
    [[UIColor colorWithRed:125.0/255.0 green:70.0/255.0 blue:25.0/255.0 alpha:1.0] setFill];
    UIRectFill(CGRectMake(0.0, screenSize.height-height, screenSize.width, height));     
}

@end
