//
//  NSObject+UserInfo.h
//  NalaShop
//
//  Created by ice on 7/24/14.
//  Copyright (c) 2014 www.nala.com.cn 杭州徐娜拉电子商务有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (UserInfo)

- (NSMutableDictionary *)userInfo;
- (void)setUserInfo:(NSMutableDictionary *)userInfo;

@end
