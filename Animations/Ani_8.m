//
//  Ani_8.m
//  Animations
//
//  Created by SHF on 15/12/8.
//  Copyright © 2015年 SHF. All rights reserved.
//
#import "Ani_8.h"
#import <QuartzCore/QuartzCore.h>


@interface Ani_8 ()
{
    CGFloat width;
    CGFloat height;
}
@property (weak, nonatomic) UIView *containerView;


@property (strong,nonatomic) CALayer *ground;
@property (strong,nonatomic) CAShapeLayer *no1;
@property (strong,nonatomic) CAShapeLayer *no2;
@property (strong,nonatomic) CAShapeLayer *no3;
@property (strong,nonatomic) CAKeyframeAnimation *no1Animation;




-(void) initCommon;
-(void) initContainer;
-(void)initNoWithSize:(CGSize ) size ;
@end

@implementation Ani_8

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
    [path addArcWithCenter:CGPointMake(0, 0) radius:40 startAngle:0 endAngle:2*M_PI clockwise:YES];
    [path closePath];
    
    UIBezierPath* path_1 = [UIBezierPath bezierPath];
    [path_1 addArcWithCenter:CGPointMake(0, 0) radius:8 startAngle:0 endAngle:2*M_PI clockwise:YES];
    [path_1 closePath];
 
    
    _no1 = [CAShapeLayer layer];
    _no1.position = CGPointMake(width/2, 40);
    _no1.path = path.CGPath;
    _no1.fillColor = [UIColor clearColor].CGColor;
    
   __block CAShapeLayer *lay[12];
    lay[0] = [self shapeLayerWithPoint:CGPointMake(-40, 0) andPath:path_1];
    
    lay[1] = [self shapeLayerWithPoint:CGPointMake(-34.4, 20) andPath:path_1];
    
    lay[2] = [self shapeLayerWithPoint:CGPointMake(-20, 34.4) andPath:path_1];

    lay[3]= [self shapeLayerWithPoint:CGPointMake(0, 40) andPath:path_1];

    lay[4] = [self shapeLayerWithPoint:CGPointMake(20, 34.4) andPath:path_1];
    
    lay[5] = [self shapeLayerWithPoint:CGPointMake(34.4, 20) andPath:path_1];

    lay[6] = [self shapeLayerWithPoint:CGPointMake(40, 0) andPath:path_1];

    lay[7] = [self shapeLayerWithPoint:CGPointMake(34.4, -20) andPath:path_1];

    lay[8] = [self shapeLayerWithPoint:CGPointMake(20, -34.4) andPath:path_1];

    lay[9] = [self shapeLayerWithPoint:CGPointMake(0, -40) andPath:path_1];

    lay[10] = [self shapeLayerWithPoint:CGPointMake(-20, -34.4) andPath:path_1];

    lay[11] = [self shapeLayerWithPoint:CGPointMake(-34.4, -20) andPath:path_1];

    for (int i=0; i<12; i++) {
        [_no1 addSublayer:lay[i]];
    }
    
    [_ground addSublayer:_no1];
    
    _no1Animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    _no1Animation.repeatCount = 1000;
    _no1Animation.duration = 1.3;
    _no1Animation.keyTimes = @[@0,@0.1,@0.25,@0.5,@0.75,@0.9,@1];
    _no1Animation.values   = @[@0,@0,@0.7,@1,@0.7,@0,@0];
    
    dispatch_time_t t[12] ;
    for (int i=0; i<12; i++) {
         t[i] = dispatch_time(DISPATCH_TIME_NOW, i * 0.1 * NSEC_PER_SEC);

    }
    
    for (  int i=0; i<12; i++) {
        CAShapeLayer* l = lay[i];
        lay[i].transform = CATransform3DMakeScale(0, 0, 0);
        dispatch_after(t[i], dispatch_get_main_queue(), ^{
            
            [ l addAnimation:_no1Animation forKey:[NSString stringWithFormat:@"no_%d",i]];
        });
    }
  
    
    
    
    
    
}
-(CAShapeLayer* )shapeLayerWithPoint:(CGPoint) point andPath:(UIBezierPath*)path
{
    CAShapeLayer* lay = [CAShapeLayer layer];
    lay.position = point;
    lay.path = path.CGPath;
    lay.fillColor = [UIColor whiteColor ].CGColor;
    return lay;
}

@end
