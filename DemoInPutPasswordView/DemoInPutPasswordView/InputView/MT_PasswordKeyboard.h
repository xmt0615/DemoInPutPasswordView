//
//  MT_PasswordKeyboard.h
//  mimizhushou
//
//  Created by jiaying on 15/12/23.
//  Copyright © 2015年 lechuangzaixian. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^MT_KeyboardPasswordHandleBlock)(NSUInteger index ,NSString *text);

@interface MT_PasswordKeyboard : NSObject

+(void)showKeyboardPasswordHandleBlock:(MT_KeyboardPasswordHandleBlock)block;

+(void)hidePasswordKeyboard;

@end
