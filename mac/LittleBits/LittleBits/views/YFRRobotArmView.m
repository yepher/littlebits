//
//  YFRRobotArmView.m
//  LittleBits
//
//  Created by Chris Wilson on 1/3/15.
//  Copyright (c) 2015 Yepher. All rights reserved.
//

#import "YFRRobotArmView.h"
#import "YFRStyleKit.h"

@implementation YFRRobotArmView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.angle = -29.0f;
    }
    return self;
}


- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    [YFRStyleKit drawRobtarmWithAngle:_angle];
}

@end
