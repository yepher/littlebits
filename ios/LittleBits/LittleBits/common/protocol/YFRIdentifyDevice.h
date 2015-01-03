//
//  YFRIdentifyDevice.h
//  LittleBits
//
//  Created by Chris Wilson on 12/31/14.
//  Copyright (c) 2014 Yepher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YFRBaseRequest.h"

typedef void (^YFRIdentifyDeviceRequestCompleteBlock) (BOOL wasSuccessful, NSArray *symbols);

@interface YFRIdentifyDevice : YFRBaseRequest


- (void)fetchSymbols: (YFRIdentifyDeviceRequestCompleteBlock)callback;


@end
