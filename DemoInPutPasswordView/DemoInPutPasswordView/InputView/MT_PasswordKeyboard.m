//
//  MT_PasswordKeyboard.m
//  mimizhushou
//
//  Created by jiaying on 15/12/23.
//  Copyright © 2015年 lechuangzaixian. All rights reserved.
//

#import "MT_PasswordKeyboard.h"

#import "LMPopInputPasswordView.h"

@interface MT_PasswordKeyboard () <LMPopInputPassViewDelegate>

@property (nonatomic ,retain) LMPopInputPasswordView *popPassword;

@property (nonatomic ,copy) MT_KeyboardPasswordHandleBlock copyBlock;

@end

@implementation MT_PasswordKeyboard
+(id)instance{
    static MT_PasswordKeyboard *singleInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!singleInstance) {
            singleInstance = [MT_PasswordKeyboard new];
        }
    });
    return singleInstance;
}

+(void)showKeyboardPasswordHandleBlock:(MT_KeyboardPasswordHandleBlock)block{
    MT_PasswordKeyboard *singleInstance = [MT_PasswordKeyboard instance];
    
    singleInstance.popPassword=[[LMPopInputPasswordView alloc]init];
    singleInstance.popPassword.frame = CGRectMake(40, 290/2, [UIScreen mainScreen].bounds.size.width-80, 338/2);
    singleInstance.popPassword.delegate = singleInstance;
    
    singleInstance.copyBlock = [block copy];
    
    [singleInstance.popPassword pop];
}

+(void)hidePasswordKeyboard{
    MT_PasswordKeyboard *single = [MT_PasswordKeyboard instance];
    [single.popPassword dismiss];
}

#pragma mark ---LMPopInputPassViewDelegate
-(void)buttonClickedAtIndex:(NSUInteger)index withText:(NSString *)text{
    if (self.copyBlock) {
        self.copyBlock(index ,text);
    }
}

@end
