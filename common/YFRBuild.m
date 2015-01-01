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

NSString *const YFR_BUILD_VERSION = @"14";

NSString *const YFR_GIT_HASH = @"f6c00396a9221646c39f7fc97fe2d8b24a6baed7";

NSString *const YFR_GIT_LAST = @"Tue Dec 30 22:23:18 2014 -0600";

NSString *const YFR_BUILD_DATE = @"Wed Dec 31 15:00:54 UTC 2014";



@end
