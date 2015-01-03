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

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    [YFRStyleKit drawRobtarmWithAngle:-29.0f];
}

@end
