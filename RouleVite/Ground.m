//
//  Ground.m
//  RouleVite
//
//  Created by Renaud Pradenc on 03/07/12.
//  Copyright (c) 2012 Céroce. All rights reserved.
//

#import "Ground.h"

#define BLOCKS_IN_WIDTH     20
#define UPPER_LAYER_HEIGHT  8.0

const char kObstacles[] = "_________________________ww______________ww______ww________________________ww______________________wwww____________________wwww______wwwwwwww____________________ww____ww____ww____ww_______ww__________________";

@interface Ground ()
{
    CFTimeInterval timePosition;
}

+ (void) _drawUndergroundInRect:(CGRect)rect;
+ (void) _drawBasaltInRect:(CGRect)rect;
+ (void) _drawPeaksInRect:(CGRect)rect;

@end

@implementation Ground

@synthesize screenSize;
@synthesize height;

- (void) updateAtTimePosition:(CFTimeInterval)newTimePosition
{
    timePosition = newTimePosition;
    
}

- (void) draw
{
    CGRect undergroundRect = CGRectMake(0.0, 
                                        screenSize.height-height+UPPER_LAYER_HEIGHT, 
                                        screenSize.width, height-UPPER_LAYER_HEIGHT);
    [[self class] _drawUndergroundInRect:undergroundRect];
   
    float animationPosition = timePosition*15.0;
    unsigned leftCharIndex = animationPosition;
    float blockPartOnLeft = animationPosition - leftCharIndex;
    float blockWidth = screenSize.width/BLOCKS_IN_WIDTH;
    
    NSUInteger block;
    for(block = 0; block <= BLOCKS_IN_WIDTH; block++)
    {
        CGRect rect = CGRectMake((block-blockPartOnLeft) * blockWidth, 
                                 screenSize.height-height, 
                                 blockWidth, 
                                 UPPER_LAYER_HEIGHT);
        char obstacle = kObstacles[leftCharIndex+block];
        if(obstacle == '_')
            [[self class] _drawBasaltInRect:rect];
        else
            [[self class] _drawPeaksInRect:rect];
    }
}

+ (void) _drawUndergroundInRect:(CGRect)rect
{
    [[UIColor colorWithRed:125.0/255.0 green:70.0/255.0 blue:25.0/255.0 alpha:1.0] setFill];
    UIRectFill(rect);     
}

+ (void) _drawBasaltInRect:(CGRect)rect
{
    [[UIColor grayColor] setFill];
    UIRectFill(rect);    
}

+ (void) _drawPeaksInRect:(CGRect)rect
{
    [[UIColor whiteColor] setFill];
    UIRectFill(rect);        
}


@end
