//
//  UILabel+Paste.h
//  NalaShop
//
//  Created by ice on 8/20/14.
//  Copyright (c) 2014 www.nala.com.cn 杭州徐娜拉电子商务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Copy)

-(NSString *)copyText;
-(void)setCopyText:(NSString *)copyText;

-(BOOL)copyEnabled;
-(void)setCopyEnabled:(BOOL)enabled;

@end
