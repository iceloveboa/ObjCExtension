//
//  UILabel+Paste.m
//  NalaShop
//
//  Created by ice on 8/20/14.
//  Copyright (c) 2014 www.nala.com.cn 杭州徐娜拉电子商务有限公司. All rights reserved.
//

#import "UILabel+Copy.h"
#import "NSObject+UserInfo.h"

@implementation UILabel (Copy)

const NSString *COPYENABLED = @"CopyEnabled";
const NSString *COPYTEXT = @"CopyText";

//-(instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        UILongPressGestureRecognizer *ges = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressed)];
//        [self addGestureRecognizer:ges];
//    }
//    return self;
//}

-(BOOL)canBecomeFirstResponder
{
    return YES;
}

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    if (action == @selector(copy:)) {
        return YES;
    }
    return NO;
}

-(NSString *)copyText
{
    return self.userInfo[COPYTEXT];
}

-(void)setCopyText:(NSString *)copyText
{
    NSMutableDictionary *userInfo = self.userInfo;
    if (!userInfo) {
        userInfo = [NSMutableDictionary dictionary];
    }
    if (copyText) {
        [userInfo setObject:copyText forKey:COPYTEXT];
    }
    self.userInfo = userInfo;
    
}

-(BOOL)copyEnabled
{
    NSNumber *enabled = self.userInfo[COPYENABLED];
    if (!enabled) {
        return NO;
    }else{
        return enabled.boolValue;
    }
}

-(void)setCopyEnabled:(BOOL)enabled
{
    if (enabled && !self.copyEnabled) {
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressed)];
        [self addGestureRecognizer:longPress];
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped)];
//        [self addGestureRecognizer:tap];
    }else if(!enabled){
        for (id ges in self.gestureRecognizers) {
            [self removeGestureRecognizer:ges];
        }
    }
    NSMutableDictionary *userInfo = self.userInfo;
    if (!userInfo) {
        userInfo = [NSMutableDictionary dictionary];
    }
    [userInfo setObject:[NSNumber numberWithBool:enabled] forKey:COPYENABLED];
    self.userInfo = userInfo;
  
}

-(void)longPressed{
    [self becomeFirstResponder];
    UIMenuController *menuController = [UIMenuController sharedMenuController];
    [menuController setTargetRect:self.frame inView:self.superview];
    [menuController setMenuVisible:YES animated:YES];
//    [[UIPasteboard generalPasteboard]setString:self.text];
//    [ToolUtil showHUD:@"文本已复制到剪切板" duration:1.0];
}

-(void)tapped{
    [self becomeFirstResponder];
    UIMenuController *menuController = [UIMenuController sharedMenuController];
    [menuController setTargetRect:self.frame inView:self];
    [menuController setMenuVisible:YES animated:YES];
}

- (void)copy:(id)sender {
    if (self.copyText) {
        [[UIPasteboard generalPasteboard] setString:self.copyText];
    }else{
        [[UIPasteboard generalPasteboard] setString:self.text];
    }
}


@end
