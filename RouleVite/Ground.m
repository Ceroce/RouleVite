//
//  Ground.m
//  RouleVite
//
//  Created by Renaud Pradenc on 03/07/12.
//  Copyright (c) 2012 Céroce. All rights reserved.
//

#import "Ground.h"
#import "GroundBlock.h"

#define BLOCKS_IN_WIDTH     20
#define UPPER_LAYER_HEIGHT  8.0

const char kObstacles[] = "_________________________ww______________ww______ww________________________ww______________________wwww____________________wwww______wwwwwwww____________________ww____ww____ww____ww_______ww__________________";

@interface Ground ()
{
    CFTimeInterval timePosition;
}

@property (nonatomic, strong) NSMutableArray *blocks;

+ (void) _drawUndergroundInRect:(CGRect)rect;

@end

@implementation Ground

@synthesize screenSize;
@synthesize height;
@synthesize blocks;

- (id)init
{
    self = [super init];
    if (self) {
        blocks = [[NSMutableArray alloc] init];
        unsigned blockIndex;
        for(blockIndex = 0; blockIndex <= BLOCKS_IN_WIDTH; blockIndex++)
        {
            GroundBlock *block = [[GroundBlock alloc] init];
            [blocks addObject:block];
        }
    }
    return self;
}

- (void) updateAtTimePosition:(CFTimeInterval)newTimePosition
{
    timePosition = newTimePosition;
    
    float animationPosition = timePosition*15.0;
    unsigned leftCharIndex = animationPosition;
    float blockPartOnLeft = animationPosition - leftCharIndex;
    float blockWidth = screenSize.width/BLOCKS_IN_WIDTH;
    
    NSUInteger blockIndex;
    for(blockIndex = 0; blockIndex <= BLOCKS_IN_WIDTH; blockIndex++)
    {
        GroundBlock *block = [blocks objectAtIndex:blockIndex];
        block.rect = CGRectMake((blockIndex-blockPartOnLeft) * blockWidth, 
                                 screenSize.height-height, 
                                 blockWidth, 
                                 UPPER_LAYER_HEIGHT);
        
        char obstacle = kObstacles[leftCharIndex+blockIndex];
        if(obstacle == '_')
            block.type = GroundBlockType_Basalt;
        else
            block.type = GroundBlockType_Peaks;
    }
}

- (void) draw
{
    CGRect undergroundRect = CGRectMake(0.0, 
                                        screenSize.height-height+UPPER_LAYER_HEIGHT, 
                                        screenSize.width, height-UPPER_LAYER_HEIGHT);
    [[self class] _drawUndergroundInRect:undergroundRect];
   
    for(GroundBlock *block in blocks)
        [block draw];

}

+ (void) _drawUndergroundInRect:(CGRect)rect
{
    [[UIColor colorWithRed:125.0/255.0 green:70.0/255.0 blue:25.0/255.0 alpha:1.0] setFill];
    UIRectFill(rect);     
}




@end
