//
//  PasswordTextFieldView.m
//  wxSecurityTextField
//
//  Created by lh on 15/6/1.
//  Copyright (c) 2015年 lh. All rights reserved.
//

#import "PasswordTextFieldView.h"

#define  Radius 5

@interface PasswordTextFieldView()

@end

@implementation PasswordTextFieldView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

    CGFloat width = self.bounds.size.width/6;
    CGFloat heigth = self.bounds.size.height;

    CGPoint startPos = self.bounds.origin;

    for (int i = 0; i < 6; i++) {
        [self addRectWithX:startPos.x + width * i y:startPos.y width:width height:heigth];
    }
    
    if (self.circleNumber > 0) {
        for (int i = 0; i < self.circleNumber; i++) {
            [self drawCirclesWithX:(startPos.x + width *(i + 0.5)) y:(startPos.y + heigth * 0.5)];
        }
    }
}


-(void)addRectWithX:(CGFloat)x y:(CGFloat)y  width:(CGFloat)width height:(CGFloat)height{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(ctx, [[UIColor redColor] CGColor]);
    CGContextSetLineWidth(ctx, 1.0);
    CGPoint poins[] = {CGPointMake(x, y),CGPointMake(x + width, y),CGPointMake(x + width, y + height),CGPointMake(x, y + height)};
    CGContextAddLines(ctx,poins,4);
    CGContextClosePath(ctx);
    CGContextStrokePath(ctx);

}


-(void)drawCirclesWithX:(CGFloat)x y:(CGFloat )y{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, [[UIColor colorWithRed:30/255.0 green:32/255.0 blue:40/255.0 alpha:1.0] CGColor]);
    CGContextSetLineWidth(ctx, 1.0);
    CGContextAddEllipseInRect(ctx, CGRectMake(x - Radius, y - Radius, 2 * Radius, 2 * Radius));
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);
}


@end
