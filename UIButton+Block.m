//
//  UIButton+Block.m
//  NalaShop
//
//  Created by ice on 7/15/14.
//  Copyright (c) 2014 www.nala.com.cn 杭州徐娜拉电子商务有限公司. All rights reserved.
//

#import "UIButton+Block.h"
#import <objc/runtime.h>

const static char * actionblockkey = "actionblockkey";

@implementation UIButton (Block)

- (void) handleControlEvent: (UIControlEvents)event withBlock: (ActionBlock)action
{
    objc_setAssociatedObject(self, actionblockkey, action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(performAction:) forControlEvents:event];
}

- (void)performAction:(id)sender
{
    ActionBlock action = objc_getAssociatedObject(self, actionblockkey);
    if (action) {
        action();
    }
}

@end
