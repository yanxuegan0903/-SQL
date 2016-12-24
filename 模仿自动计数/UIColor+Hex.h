//
//  UIColor+Hex.h
//  模仿自动计数
//
//  Created by vsKing on 2016/12/23.
//  Copyright © 2016年 vsKing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)
+(UIColor*) colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
+(UIColor *)colorHaveAlphaWithHex:(NSInteger)hex;
+(UIColor *)colorWithHex:(NSInteger)hex;
@end
