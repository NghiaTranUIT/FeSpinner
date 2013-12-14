//
//  UIColor+flat.m
//  SaiGonRain
//
//  Created by Bang Nguyen on 26/09/2013.
//  Copyright (c) 2013 Bang Nguyen. All rights reserved.
//

#import "UIColor+flat.h"

@implementation UIColor (flat)

+ (UIColor*)flatTurquoiseColor {
    return [UIColor colorWithRed:26.0f/255.0f
                           green:188.0f/255.0f
                            blue:156.0f/255.0f
                           alpha:1.0f];
}

+ (UIColor*)flatGreenSeaColor {
    return [UIColor colorWithRed:22.0f/255.0f
                           green:160.0f/255.0f
                            blue:133.0f/255.0f
                           alpha:1.0f];
}

+ (UIColor*)flatEmeraldColor {
    return [UIColor colorWithRed:46.0f/255.0f
                           green:204.0f/255.0f
                            blue:113.0f/255.0f
                           alpha:1.0f];
}

+ (UIColor*)flatNephritisColor {
    return [UIColor colorWithRed:39.0f/255.0f
                           green:174.0f/255.0f
                            blue:96.0f/255.0f
                           alpha:1.0f];
}

+ (UIColor*)flatPeterRiverColor {
    return [UIColor colorWithRed:52.0f/255.0f
                           green:152.0f/255.0f
                            blue:219.0f/255.0f
                           alpha:1.0f];
}

+ (UIColor*)flatBelizeHoleColor {
    return [UIColor colorWithRed:41.0f/255.0f
                           green:128.0f/255.0f
                            blue:185.0f/255.0f
                           alpha:1.0f];
}

+ (UIColor*)flatAmethystColor {
    return [UIColor colorWithRed:155.0f/255.0f
                           green:89.0f/255.0f
                            blue:182.0f/255.0f
                           alpha:1.0f];
}

+ (UIColor*)flatWisteriaColor {
    return [UIColor colorWithRed:142.0f/255.0f
                           green:68.0f/255.0f
                            blue:173.0f/255.0f
                           alpha:1.0f];
}

+ (UIColor*)flatWetAsphaltColor {
    return [UIColor colorWithRed:52.0f/255.0f
                           green:73.0f/255.0f
                            blue:94.0f/255.0f
                           alpha:1.0f];
}

+ (UIColor*)flatMidNightColor {
    return [UIColor colorWithRed:44.0f/255.0f
                           green:62.0f/255.0f
                            blue:80.0f/255.0f
                           alpha:1.0f];
}

+ (UIColor*)flatSunFlowerColor {
    return [UIColor colorWithRed:241.0f/255.0f
                           green:196.0f/255.0f
                            blue:15.0f/255.0f
                           alpha:1.0f];
}

+ (UIColor*)flatOrangeColor {
    return [UIColor colorWithRed:243.0f/255.0f
                           green:156.0f/255.0f
                            blue:18.0f/255.0f
                           alpha:1.0f];
}

+ (UIColor*)flatCarrotColor {
    return [UIColor colorWithRed:230.0f/255.0f
                           green:126.0f/255.0f
                            blue:34.0f/255.0f
                           alpha:1.0f];
}

+ (UIColor*)flatPumpkinColor {
    return [UIColor colorWithRed:211.0f/255.0f
                           green:84.0f/255.0f
                            blue:0.0f/255.0f
                           alpha:1.0f];
}

+ (UIColor*)flatAlizarinColor {
    return [UIColor colorWithRed:231.0f/255.0f
                           green:76.0f/255.0f
                            blue:60.0f/255.0f
                           alpha:1.0f];
}

+ (UIColor*)flatPomegranateColor {
    return [UIColor colorWithRed:192.0f/255.0f
                           green:57.0f/255.0f
                            blue:43.0f/255.0f
                           alpha:1.0f];
}

+ (UIColor*)flatCloudColor {
    return [UIColor colorWithRed:236.0f/255.0f
                           green:240.0f/255.0f
                            blue:241.0f/255.0f
                           alpha:1.0f];
}

+ (UIColor*)flatSilverColor {
    return [UIColor colorWithRed:189.0f/255.0f
                           green:195.0f/255.0f
                            blue:199.0f/255.0f
                           alpha:1.0f];
}

+ (UIColor*)flatConcreteColor {
    return [UIColor colorWithRed:149.0f/255.0f
                           green:165.0f/255.0f
                            blue:166.0f/255.0f
                           alpha:1.0f];
}

+ (UIColor*)flatAsbestosColor {
    return [UIColor colorWithRed:127.0f/255.0f
                           green:140.0f/255.0f
                            blue:141.0f/255.0f
                           alpha:1.0f];
}

+(UIColor *) colorWithHexCode:(NSString *)hexCode
{
    NSString *cleanString = [hexCode stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if([cleanString length] == 3) {
        cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                       [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
                       [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
                       [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
    }
    if([cleanString length] == 6) {
        cleanString = [cleanString stringByAppendingString:@"ff"];
    }
    
    unsigned int baseValue;
    [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];
    
    float red = ((baseValue >> 24) & 0xFF)/255.0f;
    float green = ((baseValue >> 16) & 0xFF)/255.0f;
    float blue = ((baseValue >> 8) & 0xFF)/255.0f;
    float alpha = ((baseValue >> 0) & 0xFF)/255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

@end
