//
//  Ani_6.m
//  Animations
//
//  Created by SHF on 15/12/8.
//  Copyright © 2015年 SHF. All rights reserved.
//
#import "Ani_6.h"
#import <QuartzCore/QuartzCore.h>


@interface Ani_6 ()
{
    CGFloat width;
    CGFloat height;
}
@property (weak, nonatomic) UIView *containerView;


@property (strong,nonatomic) CALayer *ground;
@property (strong,nonatomic) CAShapeLayer *no1;
@property (strong,nonatomic) CAShapeLayer *no2;
@property (strong,nonatomic) CAShapeLayer *back;
@property (strong,nonatomic) CABasicAnimation *no1Animation;
@property (strong,nonatomic) CABasicAnimation *no2Animation;




-(void) initCommon;
-(void) initContainer;
-(void)initNoWithSize:(CGSize ) size ;
@end

@implementation Ani_6

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
    [path addArcWithCenter:CGPointMake(0, 0) radius:35 startAngle:0 endAngle:2*M_PI clockwise:YES];
    [path closePath];
    
    _back = [CAShapeLayer layer ];
    
    _back.position = CGPointMake(width/2 , 40);
    _back.path = path.CGPath;
    _back.fillColor = [UIColor clearColor].CGColor;
    _back.anchorPoint = CGPointMake(0.5f, 0.5f);
    [_ground addSublayer:_back];
    
    UIBezierPath* p1 = [UIBezierPath bezierPath];
    [p1 addArcWithCenter:CGPointMake(0, 0) radius:30 startAngle:0 endAngle:2*M_PI clockwise:YES];
    [p1 closePath];
    
    _no1 = [CAShapeLayer layer  ];
    _no1.position = CGPointMake(0, 35);
    _no1.path = p1.CGPath;
    _no1.fillColor = [UIColor whiteColor].CGColor;

    [_back addSublayer:_no1];
    
    UIBezierPath* p2 = [UIBezierPath bezierPath];
    [p2 addArcWithCenter:CGPointMake(0, 0) radius:30 startAngle:0 endAngle:2*M_PI clockwise:YES];
    [p2 closePath];

    _no2 = [CAShapeLayer layer  ];
    _no2.position = CGPointMake(30, 5);
    _no2.path = p2.CGPath;
    _no2.fillColor = [UIColor whiteColor].CGColor;
    
    [_back addSublayer:_no2];
    
    
    CAKeyframeAnimation* keyAni = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    keyAni.duration = 2;
    keyAni.repeatCount = 1000;
    keyAni.keyTimes = @[@0,@0.5,@1];
    keyAni.values   = @[@1,@0,@1];
    keyAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [_no1 addAnimation:keyAni forKey:@"key_1"];
    
    
    CAKeyframeAnimation* keyAni_2 = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    keyAni_2.duration = 2;
    keyAni_2.repeatCount = 1000;
    keyAni_2.keyTimes = @[@0,@0.5,@1];
    keyAni_2.values   = @[@0,@1,@0];
    keyAni_2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [_no2 addAnimation:keyAni_2 forKey:@"key_2"];
    
    CABasicAnimation* backAni = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    backAni.duration = 2;
    backAni.repeatCount = 1000;
    backAni.fromValue = [NSNumber numberWithFloat:0];
    backAni.toValue   = [NSNumber numberWithFloat:2*M_PI];
    [_back addAnimation:backAni forKey:@"back"];
    
}


@end
