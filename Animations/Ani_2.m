//
//  Ani_2.m
//  Animations
//
//  Created by SHF on 15/12/8.
//  Copyright © 2015年 SHF. All rights reserved.
//
#import "Ani_2.h"
#import <QuartzCore/QuartzCore.h>


@interface Ani_2 ()
{
    CGFloat width;
    CGFloat height;
    int index;
}
@property (weak, nonatomic) UIView *containerView;


@property (strong,nonatomic) CALayer *ground;
@property (strong,nonatomic) CAShapeLayer *no1;
@property (strong,nonatomic) CAShapeLayer * no2;
@property (strong,nonatomic) CABasicAnimation *no1Animation;
@property (strong,nonatomic) CABasicAnimation *no2Animation;




-(void) initCommon;
-(void) initContainer;
-(void)initNoWithSize:(CGSize ) size ;
@end

@implementation Ani_2

-(instancetype) initWithView:(UIView *)view
{
    
    
    self = [super init];
    if (self)
    {
        _containerView = view;
        
        width = _containerView.bounds.size.width;
        height =_containerView.bounds.size.height;
        
        [self initCommon];
        
        [self initContainer];
        
        
        CGSize size1 = CGSizeMake( width * (4.0 / 10.0),height /3.0 );
      
        [self initNoWithSize:size1 ];
   
    }
    return self;
}
-(void) initCommon
{
    
    self.frame = CGRectMake(0, 0, _containerView.bounds.size.width, _containerView.bounds.size.height-100);
    //self.backgroundColor = [UIColor colorWithRed:230/255.0 green:60/255.0 blue:80/255.0 alpha:1];
    self.backgroundColor = [UIColor clearColor];
}
-(void) initContainer
{
    _ground = [CALayer layer];
    _ground.backgroundColor = [UIColor clearColor].CGColor  ;
    _ground.frame = CGRectMake(0 , height / 3, width, height / 3);
    
    [self.layer addSublayer:_ground];
}



-(void)initNoWithSize:(CGSize ) size
{
    UIBezierPath* path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(0, 70)];
    [path addLineToPoint:CGPointMake(70, 70)];
    [path addLineToPoint:CGPointMake(70, 0)];
    [path closePath];
    
    _no1 = [CAShapeLayer layer];
    _no1.frame = CGRectMake(width/2, 20, 70, 70);
    
    _no1.path = path.CGPath;
    _no1.fillColor = [UIColor whiteColor].CGColor;
    _no1.anchorPoint = CGPointMake(0.5f, 0.5f);
    _no1.position = CGPointMake(width/2, 40);
    [_ground addSublayer:_no1];
    
    
    
    
   
    CABasicAnimation* basicAni = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    basicAni.duration = 1.0f;
    basicAni.fromValue = [NSNumber numberWithFloat:3.1415];
    basicAni.toValue   = [NSNumber numberWithFloat:0];
    
    basicAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CABasicAnimation* basicAni2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    basicAni2.duration = 1.0f;
    basicAni2.fromValue = [NSNumber numberWithFloat:3.1415];
    basicAni2.toValue   = [NSNumber numberWithFloat:0];
    
    basicAni2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = 0.005;
    [_no1 setTransform:transform];
    
    _no1Animation = basicAni;
    _no2Animation = basicAni2;
    
    basicAni.delegate=self;
    basicAni2.delegate=self;
    
    [_no1 addAnimation:_no1Animation forKey:@"ani1"];
    
    index=1;

}
- (void)animationDidStart:(CAAnimation *)anim
{
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (index == 1 ) {
        [_no1 addAnimation:_no2Animation forKey:@"ani2"];
        index=2;
    }
    else
    {
        [_no1 addAnimation:_no1Animation forKey:@"ani1"];

        index=1;
    }
    
}


@end
