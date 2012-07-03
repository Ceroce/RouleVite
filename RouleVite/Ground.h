//
//  Ground.h
//  RouleVite
//
//  Created by Renaud Pradenc on 03/07/12.
//  Copyright (c) 2012 Céroce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ground : NSObject

@property (nonatomic, assign) CGSize screenSize;
@property (nonatomic, assign) CGFloat height;

- (void) update;
- (void) draw;

@end
