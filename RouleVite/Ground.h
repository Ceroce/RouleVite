//
//  Ground.h
//  RouleVite
//
//  Created by Renaud Pradenc on 03/07/12.
//  Copyright (c) 2012 Céroce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameItem.h"

@interface Ground : NSObject <GameItem>

@property (nonatomic, assign) CGSize screenSize;
@property (nonatomic, assign) CGFloat height;

@end
