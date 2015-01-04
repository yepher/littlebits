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
        self.angle = -50.0;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [YFRStyleKit drawRobotArmViewWithAngle:self.angle];
}


@end
