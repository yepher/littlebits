//
//  YFRDeviceTableViewCell.h
//  LittleBits
//
//  Created by Chris Wilson on 1/3/15.
//  Copyright (c) 2015 Yepher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFRDeviceTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView* deviceStateImageView;

@property (weak, nonatomic) IBOutlet UILabel* deviceLabel;

@end
