//
//  UIView+JDFrame.m
//  JDGomeMall
//
//  Created by 邓建东 on 2018/6/12.
//  Copyright © 2018年 邓建东. All rights reserved.
//

#import "UIView+JDFrame.h"

@implementation UIView (JDFrame)
- (CGFloat)jd_x
{
    return self.frame.origin.x;
}
- (void)setJd_x:(CGFloat)jd_x
{
    CGRect dcFrame = self.frame;
    dcFrame.origin.x = jd_x;
    self.frame = dcFrame;
}

-(CGFloat)jd_y
{
    return self.frame.origin.y;
}
-(void)setJd_y:(CGFloat)jd_y
{
    CGRect dcFrame = self.frame;
    dcFrame.origin.y = jd_y;
    self.frame = dcFrame;
}

-(CGPoint)jd_origin
{
    return self.frame.origin;
}
-(void)setJd_origin:(CGPoint)jd_origin
{
    CGRect dcFrame = self.frame;
    dcFrame.origin = jd_origin;
    self.frame = dcFrame;
}

-(CGFloat)jd_width
{
    return self.frame.size.width;
}
-(void)setJd_width:(CGFloat)jd_width
{
    CGRect dcFrame = self.frame;
    dcFrame.size.width = jd_width;
    self.frame = dcFrame;
}

-(CGFloat)jd_height
{
    return self.frame.size.height;
}
-(void)setJd_height:(CGFloat)jd_height
{
    CGRect dcFrame = self.frame;
    dcFrame.size.height = jd_height;
    self.frame = dcFrame;
}

-(CGSize)jd_size
{
    return self.frame.size;
}
- (void)setJd_size:(CGSize)jd_size
{
    CGRect dcFrame = self.frame;
    dcFrame.size = jd_size;
    self.frame = dcFrame;
}

-(CGFloat)jd_centerX{
    
    return self.center.x;
}

-(void)setJd_centerX:(CGFloat)jd_centerX{
    
    CGPoint dcFrmae = self.center;
    dcFrmae.x = jd_centerX;
    self.center = dcFrmae;
}

-(CGFloat)jd_centerY{
    
    return self.center.y;
}

-(void)setJd_centerY:(CGFloat)jd_centerY{
    
    CGPoint dcFrame = self.center;
    dcFrame.y = jd_centerY;
    self.center = dcFrame;
}

- (CGFloat)jd_right{
    
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)jd_bottom{
    
    return CGRectGetMaxY(self.frame);
}

- (void)setJd_right:(CGFloat)jd_right{
    
    self.jd_x = jd_right - self.jd_width;
}

- (void)setJd_bottom:(CGFloat)jd_bottom{
    
    self.jd_y = jd_bottom - self.jd_height;
}
@end
