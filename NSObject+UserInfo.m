//
//  NSObject+UserInfo.m
//  NalaShop
//
//  Created by ice on 7/24/14.
//  Copyright (c) 2014 www.nala.com.cn 杭州徐娜拉电子商务有限公司. All rights reserved.
//

#import "NSObject+UserInfo.h"
#import <objc/runtime.h>

const static char* key = "NsObjectUserInfoKey";

@implementation NSObject (UserInfo)



- (NSMutableDictionary *)userInfo
{
   return  objc_getAssociatedObject(self, key);
}

- (void)setUserInfo:(NSMutableDictionary *)userInfo{
    objc_setAssociatedObject(self, key, userInfo, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
