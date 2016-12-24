//
//  UIColor+Hex.m
//  模仿自动计数
//
//  Created by vsKing on 2016/12/23.
//  Copyright © 2016年 vsKing. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)
/**
 *  六位颜色值选用（指定透明度）
 */
+(UIColor*) colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0
                           alpha:alphaValue];
}

/**
 *  八位颜色值选用（带透明度）
 */

+(UIColor *)colorHaveAlphaWithHex:(NSInteger)hex{
    return [UIColor colorWithRed:((hex&0xff0000)>>16) / 255.0f
                           green:((hex&0xff00)>>8) / 255.0f
                            blue:((hex&0xff)>>0) / 255.0f
                           alpha:((hex&0xff000000)>>24) / 255.0f ];
    
}
@end
