//
//  Ani_5.m
//  Animations
//
//  Created by SHF on 15/12/8.
//  Copyright © 2015年 SHF. All rights reserved.
//
#import "Ani_5.h"
#import <QuartzCore/QuartzCore.h>


@interface Ani_5 ()
{
    CGFloat width;
    CGFloat height;
}
@property (weak, nonatomic) UIView *containerView;


@property (strong,nonatomic) CALayer *ground;
@property (strong,nonatomic) CAShapeLayer *no1;
@property (strong,nonatomic) CAShapeLayer * no2;
@property (strong,nonatomic) CAAnimationGroup *group;




-(void) initCommon;
-(void) initContainer;
-(void)initNoWithSize:(CGSize ) size ;
@end

@implementation Ani_5

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
    [path addArcWithCenter:CGPointMake(35, 35) radius:35 startAngle:0 endAngle:2*M_PI clockwise:YES];
    [path closePath];
    
    _no2 = [CAShapeLayer layer];
    _no2.frame = CGRectMake(width/2, 40, 70, 70);
    
    _no2.path = path.CGPath;
    _no2.fillColor = [UIColor whiteColor].CGColor;
    _no2.anchorPoint = CGPointMake(0.5f, 0.5f);
    _no2.position = CGPointMake(width/2, 40);
    _no2.opacity = 0.7f;
    [_ground addSublayer:_no2];
    _no2.backgroundColor = [UIColor clearColor].CGColor;
    
    
    
    CABasicAnimation* basicAni1 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    basicAni1.duration = 1.0f;
    basicAni1.fromValue = [NSNumber numberWithFloat:1];
    basicAni1.toValue   = [NSNumber numberWithFloat:0.01];
    basicAni1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

    CABasicAnimation* basicAni2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    basicAni2.duration = 1.0f;
    basicAni2.fromValue = [NSNumber numberWithFloat:0];
    basicAni2.toValue   = [NSNumber numberWithFloat:1];
    basicAni2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CAAnimationGroup * group = [CAAnimationGroup animation];
    group.duration = 1.0f;
    [group setAnimations:[NSArray arrayWithObjects:basicAni1,basicAni2, nil]];
    
    group.delegate = self;
    _group = group;
    
    _no2.opacity = 0;
    [_no2 addAnimation:_group forKey:@"ani_group"];
    
    
}

-(void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [_no2 addAnimation:_group forKey:@"ani_group"];
}


@end
