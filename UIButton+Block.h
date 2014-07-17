//
//  UIButton+Block.h
//  NalaShop
//
//  Created by ice on 7/15/14.
//  Copyright (c) 2014 www.nala.com.cn 杭州徐娜拉电子商务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ActionBlock)();

@interface UIButton (Block)

- (void) handleControlEvent: (UIControlEvents)event withBlock: (ActionBlock)action;

@end
