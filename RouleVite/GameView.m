//
//  CeGameView.m
//  RouleVite
//
//  Created by Renaud Pradenc on 03/07/12.
//  Copyright (c) 2012 Céroce. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "GameView.h"
#import "Ball.h"
#import "Ground.h"

#define GROUND_HEIGHT   48.0


@interface GameView ()
{
    CFTimeInterval timePosition;
}

@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, strong) Ball *ball;
@property (nonatomic, strong) Ground *ground;
@property (nonatomic, strong) UITextField *distanceTextField;

- (void) _drawBackground;

@end


@implementation GameView


@synthesize displayLink;
@synthesize ball;
@synthesize ground;
@synthesize distanceTextField;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) 
    {
        ball = [[Ball alloc] init];
        ball.skyHeight = self.frame.size.height-GROUND_HEIGHT;
        
        ground = [[Ground alloc] init];
        ground.screenSize = self.frame.size;
        ground.height = GROUND_HEIGHT;

        displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(_displayLinkDidFire:)];
        [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        
        distanceTextField = [[UITextField alloc] initWithFrame:CGRectMake(396.0, 15.0, 67.0, 20.0)];
        distanceTextField.textAlignment = UITextAlignmentRight;
        [self addSubview:distanceTextField];
    }
    return self;
}

- (void)dealloc
{
    [displayLink invalidate];
}

// MARK: Sequencing
- (void) _displayLinkDidFire:(CADisplayLink *)sender
{    
    timePosition += (sender.duration * sender.frameInterval);
    unsigned distance = timePosition*30.0;
    distanceTextField.text = [NSString stringWithFormat:@"%u m", distance];
    
    [ball updateAtTimePosition:timePosition];
    [ground updateAtTimePosition:timePosition];
    
    [self setNeedsDisplay];
    
    // Is the ball hitting peaks ?
    if((ball.elevation == 0.0) && [ground peaksHitAtX:ball.center.x])
    {
        displayLink.paused = YES;
        
        NSString *message = [NSString stringWithFormat:@"Distance parcourue: %i m", distance];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Perdu!" message:message delegate:self cancelButtonTitle:@"Recommencer" otherButtonTitles:nil];
        [alertView show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    timePosition = 0.0;
    displayLink.paused = NO;
}



// MARK: Drawing

- (void)drawRect:(CGRect)rect
{
    [self _drawBackground];
    [ground draw];
    [ball draw];
}


- (void) _drawBackground
{
    [[UIColor colorWithRed:118.0/255.0 green:181.0/255.0 blue:252.0/255.0 alpha:1.0] setFill];
    UIRectFill(self.bounds);    
}


// MARK: Touch events
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [ball touchBegan];
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [ball touchEnded];
}

@end
