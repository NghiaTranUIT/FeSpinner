//
//  FeVietNamBar.h
//  FeSpinner
//
//  Created by Nghia Tran on 12/30/13.
//  Copyright (c) 2013 fe. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface FeVietNamBar : CALayer
// init Vietnam Bar at index
-(id) initAtIndex:(NSInteger) index colors:(NSArray *) colors;

// Start animation
-(void) startAnimation;

// Stop animation
-(void) stopAnimation;
@end
/*
 //// General Declarations
 CGContextRef context = UIGraphicsGetCurrentContext();
 
 //// Color Declarations
 UIColor* fillColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0];
 UIColor* color = [UIColor colorWithRed: 0.781 green: 1 blue: 0.343 alpha: 1];
 UIColor* color2 = [UIColor colorWithRed: 0.114 green: 0.41 blue: 1 alpha: 1];
 
 //// Image Declarations
 UIImage* vietNamLoader = [UIImage imageNamed: @"vietNamLoader"];
 UIColor* vietNamLoaderPattern = [UIColor colorWithPatternImage: vietNamLoader];
 
 //// VietNamLoader 2 Drawing
 UIBezierPath* vietNamLoader2Path = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 320, 480)];
 CGContextSaveGState(context);
 CGContextSetPatternPhase(context, CGSizeMake(0, 0));
 [vietNamLoaderPattern setFill];
 [vietNamLoader2Path fill];
 CGContextRestoreGState(context);
 
 
 //// Rectangle Drawing
 UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(129, 36, 31, 10)];
 [fillColor setFill];
 [rectanglePath fill];
 [color setStroke];
 rectanglePath.lineWidth = 1;
 [rectanglePath stroke];
 
 
 //// Rectangle 2 Drawing
 UIBezierPath* rectangle2Path = [UIBezierPath bezierPathWithRect: CGRectMake(116.5, 48, 61, 10)];
 [fillColor setFill];
 [rectangle2Path fill];
 [color setStroke];
 rectangle2Path.lineWidth = 1;
 [rectangle2Path stroke];
 
 
 //// Rectangle 3 Drawing
 UIBezierPath* rectangle3Path = [UIBezierPath bezierPathWithRect: CGRectMake(84.5, 59.5, 101, 10)];
 [fillColor setFill];
 [rectangle3Path fill];
 [color setStroke];
 rectangle3Path.lineWidth = 1;
 [rectangle3Path stroke];
 
 
 //// Rectangle 4 Drawing
 UIBezierPath* rectangle4Path = [UIBezierPath bezierPathWithRect: CGRectMake(90.5, 71.5, 112, 10)];
 [fillColor setFill];
 [rectangle4Path fill];
 [color setStroke];
 rectangle4Path.lineWidth = 1;
 [rectangle4Path stroke];
 
 
 //// Rectangle 5 Drawing
 UIBezierPath* rectangle5Path = [UIBezierPath bezierPathWithRect: CGRectMake(97.5, 84.5, 88, 10)];
 [fillColor setFill];
 [rectangle5Path fill];
 [color setStroke];
 rectangle5Path.lineWidth = 1;
 [rectangle5Path stroke];
 
 
 //// Rectangle 6 Drawing
 UIBezierPath* rectangle6Path = [UIBezierPath bezierPathWithRect: CGRectMake(123.5, 95.5, 48, 10)];
 [fillColor setFill];
 [rectangle6Path fill];
 [color setStroke];
 rectangle6Path.lineWidth = 1;
 [rectangle6Path stroke];
 
 
 //// Rectangle 7 Drawing
 UIBezierPath* rectangle7Path = [UIBezierPath bezierPathWithRect: CGRectMake(126.5, 107.5, 39, 10)];
 [fillColor setFill];
 [rectangle7Path fill];
 [color setStroke];
 rectangle7Path.lineWidth = 1;
 [rectangle7Path stroke];
 
 
 //// Rectangle 8 Drawing
 UIBezierPath* rectangle8Path = [UIBezierPath bezierPathWithRect: CGRectMake(115.5, 119.5, 39, 10)];
 [fillColor setFill];
 [rectangle8Path fill];
 [color setStroke];
 rectangle8Path.lineWidth = 1;
 [rectangle8Path stroke];
 
 
 //// Rectangle 9 Drawing
 UIBezierPath* rectangle9Path = [UIBezierPath bezierPathWithRect: CGRectMake(128.5, 131.5, 31, 10)];
 [fillColor setFill];
 [rectangle9Path fill];
 [color setStroke];
 rectangle9Path.lineWidth = 1;
 [rectangle9Path stroke];
 
 
 //// Rectangle 10 Drawing
 UIBezierPath* rectangle10Path = [UIBezierPath bezierPathWithRect: CGRectMake(138.5, 144.5, 26, 10)];
 [fillColor setFill];
 [rectangle10Path fill];
 [color setStroke];
 rectangle10Path.lineWidth = 1;
 [rectangle10Path stroke];
 
 
 //// Rectangle 11 Drawing
 UIBezierPath* rectangle11Path = [UIBezierPath bezierPathWithRect: CGRectMake(153.5, 155.5, 21, 10)];
 [fillColor setFill];
 [rectangle11Path fill];
 [color setStroke];
 rectangle11Path.lineWidth = 1;
 [rectangle11Path stroke];
 
 
 //// Rectangle 12 Drawing
 UIBezierPath* rectangle12Path = [UIBezierPath bezierPathWithRect: CGRectMake(162.5, 167.5, 21, 10)];
 [fillColor setFill];
 [rectangle12Path fill];
 [color setStroke];
 rectangle12Path.lineWidth = 1;
 [rectangle12Path stroke];
 
 
 //// Rectangle 13 Drawing
 UIBezierPath* rectangle13Path = [UIBezierPath bezierPathWithRect: CGRectMake(173.5, 178.5, 21, 10)];
 [fillColor setFill];
 [rectangle13Path fill];
 [color setStroke];
 rectangle13Path.lineWidth = 1;
 [rectangle13Path stroke];
 
 
 //// Rectangle 14 Drawing
 UIBezierPath* rectangle14Path = [UIBezierPath bezierPathWithRect: CGRectMake(182.5, 190.5, 22, 10)];
 [fillColor setFill];
 [rectangle14Path fill];
 [color setStroke];
 rectangle14Path.lineWidth = 1;
 [rectangle14Path stroke];
 
 
 //// Rectangle 15 Drawing
 UIBezierPath* rectangle15Path = [UIBezierPath bezierPathWithRect: CGRectMake(188.5, 202.5, 24, 10)];
 [fillColor setFill];
 [rectangle15Path fill];
 [color setStroke];
 rectangle15Path.lineWidth = 1;
 [rectangle15Path stroke];
 
 
 //// Rectangle 16 Drawing
 UIBezierPath* rectangle16Path = [UIBezierPath bezierPathWithRect: CGRectMake(183.5, 214.5, 34, 10)];
 [fillColor setFill];
 [rectangle16Path fill];
 [color setStroke];
 rectangle16Path.lineWidth = 1;
 [rectangle16Path stroke];
 
 
 //// Rectangle 17 Drawing
 UIBezierPath* rectangle17Path = [UIBezierPath bezierPathWithRect: CGRectMake(181.5, 226.5, 42, 10)];
 [fillColor setFill];
 [rectangle17Path fill];
 [color setStroke];
 rectangle17Path.lineWidth = 1;
 [rectangle17Path stroke];
 
 
 //// Rectangle 18 Drawing
 UIBezierPath* rectangle18Path = [UIBezierPath bezierPathWithRect: CGRectMake(184.5, 238.5, 36, 10)];
 [fillColor setFill];
 [rectangle18Path fill];
 [color setStroke];
 rectangle18Path.lineWidth = 1;
 [rectangle18Path stroke];
 
 
 //// Rectangle 19 Drawing
 UIBezierPath* rectangle19Path = [UIBezierPath bezierPathWithRect: CGRectMake(186.5, 250.5, 37, 10)];
 [fillColor setFill];
 [rectangle19Path fill];
 [color setStroke];
 rectangle19Path.lineWidth = 1;
 [rectangle19Path stroke];
 
 
 //// Rectangle 20 Drawing
 UIBezierPath* rectangle20Path = [UIBezierPath bezierPathWithRect: CGRectMake(174.5, 262.5, 47, 10)];
 [fillColor setFill];
 [rectangle20Path fill];
 [color setStroke];
 rectangle20Path.lineWidth = 1;
 [rectangle20Path stroke];
 
 
 //// Rectangle 21 Drawing
 UIBezierPath* rectangle21Path = [UIBezierPath bezierPathWithRect: CGRectMake(153.5, 274.5, 64, 10)];
 [fillColor setFill];
 [rectangle21Path fill];
 [color setStroke];
 rectangle21Path.lineWidth = 1;
 [rectangle21Path stroke];
 
 
 //// Rectangle 22 Drawing
 UIBezierPath* rectangle22Path = [UIBezierPath bezierPathWithRect: CGRectMake(141.5, 286.5, 69, 10)];
 [fillColor setFill];
 [rectangle22Path fill];
 [color setStroke];
 rectangle22Path.lineWidth = 1;
 [rectangle22Path stroke];
 
 
 //// Rectangle 23 Drawing
 UIBezierPath* rectangle23Path = [UIBezierPath bezierPathWithRect: CGRectMake(123.5, 298.5, 71, 10)];
 [fillColor setFill];
 [rectangle23Path fill];
 [color setStroke];
 rectangle23Path.lineWidth = 1;
 [rectangle23Path stroke];
 
 
 //// Rectangle 24 Drawing
 UIBezierPath* rectangle24Path = [UIBezierPath bezierPathWithRect: CGRectMake(127.5, 311.5, 47, 10)];
 [fillColor setFill];
 [rectangle24Path fill];
 [color setStroke];
 rectangle24Path.lineWidth = 1;
 [rectangle24Path stroke];
 
 
 //// Rectangle 25 Drawing
 UIBezierPath* rectangle25Path = [UIBezierPath bezierPathWithRect: CGRectMake(120.5, 324.5, 38, 10)];
 [fillColor setFill];
 [rectangle25Path fill];
 [color setStroke];
 rectangle25Path.lineWidth = 1;
 [rectangle25Path stroke];
 
 
 //// Rectangle 26 Drawing
 UIBezierPath* rectangle26Path = [UIBezierPath bezierPathWithRect: CGRectMake(127.5, 336.5, 20, 10)];
 [fillColor setFill];
 [rectangle26Path fill];
 [color setStroke];
 rectangle26Path.lineWidth = 1;
 [rectangle26Path stroke];
 
 
 //// Rectangle 27 Drawing
 UIBezierPath* rectangle27Path = [UIBezierPath bezierPathWithRect: CGRectMake(266.5, 239.5, 11, 10)];
 [color2 setFill];
 [rectangle27Path fill];
 [color setStroke];
 rectangle27Path.lineWidth = 1;
 [rectangle27Path stroke];
 
 
 //// Rectangle 28 Drawing
 UIBezierPath* rectangle28Path = [UIBezierPath bezierPathWithRect: CGRectMake(266.5, 251.5, 25, 10)];
 [color2 setFill];
 [rectangle28Path fill];
 [color setStroke];
 rectangle28Path.lineWidth = 1;
 [rectangle28Path stroke];
 
 
 //// Rectangle 29 Drawing
 UIBezierPath* rectangle29Path = [UIBezierPath bezierPathWithRect: CGRectMake(259.5, 262.5, 25, 10)];
 [color2 setFill];
 [rectangle29Path fill];
 [color setStroke];
 rectangle29Path.lineWidth = 1;
 [rectangle29Path stroke];
 
 
 //// Rectangle 30 Drawing
 UIBezierPath* rectangle30Path = [UIBezierPath bezierPathWithRect: CGRectMake(236.5, 310.5, 23, 10)];
 [color2 setFill];
 [rectangle30Path fill];
 [color setStroke];
 rectangle30Path.lineWidth = 1;
 [rectangle30Path stroke];
 
 
 //// Rectangle 31 Drawing
 UIBezierPath* rectangle31Path = [UIBezierPath bezierPathWithRect: CGRectMake(230.5, 323.5, 22, 10)];
 [color2 setFill];
 [rectangle31Path fill];
 [color setStroke];
 rectangle31Path.lineWidth = 1;
 [rectangle31Path stroke];
 
 
 
 */