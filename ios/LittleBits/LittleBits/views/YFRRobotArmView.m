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


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [YFRStyleKit drawRobotArmViewWithAngle:-28.0];
}


@end
