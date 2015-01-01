//
//  YFRBuild.m
//  LittleBits
//
//  Created by Chris Wilson on 12/31/14.
//  Copyright (c) 2014 Yepher. All rights reserved.
//

#import "YFRBuild.h"

/********************
 WARNING: this file is automatically updated by XCode during the build.
 Modifications should be make to YFRBuild.m.template instead of YFRBuild.m 
 ********************/


@implementation YFRBuild

NSString *const YFR_VERSION = @"1.0"
#ifdef DEBUG
// Show "d" after version if this is a DEBUG build
@" d"
#endif
;

NSString *const YFR_BUILD_VERSION = @"15";

NSString *const YFR_GIT_HASH = @"ad8f676eb03c36491ba1459349574c8f3b308602";

NSString *const YFR_GIT_LAST = @"Wed Dec 31 19:03:34 2014 -0600";

NSString *const YFR_BUILD_DATE = @"Thu Jan  1 02:52:19 UTC 2015";



@end
