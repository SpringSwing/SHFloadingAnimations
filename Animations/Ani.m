//
//  Ani.m
//  Animations
//
//  Created by SHF on 15/12/8.
//  Copyright © 2015年 SHF. All rights reserved.
//

#import "Ani.h"
#import <QuartzCore/QuartzCore.h>


@interface Ani ()
{
    CGFloat width;
    CGFloat height;
}
@property (weak, nonatomic) UIView *containerView;


@property (strong,nonatomic) CALayer *ground;
@property (strong,nonatomic) CAShapeLayer *no1;
@property (strong,nonatomic) CAShapeLayer * no2;
@property (strong,nonatomic) CAKeyframeAnimation *no1Animation;


-(void) initCommon;
-(void) initContainer;



-(void)initNoWithSize:(CGSize ) size andNum:(int)Num;
@end

@implementation Ani

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
        CGSize size2 = CGSizeMake( width * (4.50 / 10.0),height /3.0 );
        CGSize size3 = CGSizeMake( width * (5.0 / 10.0),height /3.0 );
        CGSize size4 = CGSizeMake( width * (5.5 / 10.0),height /3.0 );
        CGSize size5 = CGSizeMake( width * (6.0 / 10.0),height /3.0 );
        
        [self initNoWithSize:size1 andNum:1];
        [self initNoWithSize:size2 andNum:2];
        [self initNoWithSize:size3 andNum:3];
        [self initNoWithSize:size4 andNum:4];
        [self initNoWithSize:size5 andNum:5];
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
    _ground.backgroundColor = [UIColor clearColor   ].CGColor  ;
    _ground.frame = CGRectMake(0 , height / 3, width, height / 3);
    
    [self.layer addSublayer:_ground];
}



-(void)initNoWithSize:(CGSize ) size andNum:(int)Num
{
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 50 /2)];
    [path addLineToPoint:CGPointMake(0, 50)];
    
    CAShapeLayer *no1 = [[CAShapeLayer alloc]init];
    CAShapeLayer *no2 = [[CAShapeLayer alloc]init];

    no1 = [CAShapeLayer layer];
    
    no1.frame = CGRectMake(size.width, 25, 5, height/3);
    
    no1.strokeColor = [UIColor whiteColor].CGColor;
    
    no1.lineWidth = 4;
    no1.lineCap = kCALineCapRound;
    no1.path = path.CGPath;
    
    UIBezierPath * path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(0, 50/2)];
    [path2 addLineToPoint:CGPointMake(0, 0)];
    no2 = [CAShapeLayer layer];
    
    no2.frame = CGRectMake(size.width, 25, 5, height/3);
    
    no2.strokeColor = [UIColor whiteColor].CGColor;
    
    no2.lineWidth = 4;
    no2.lineCap = kCALineCapRound;
    no2.path = path2.CGPath;
    
    [_ground addSublayer:no1];
    [_ground addSublayer:no2];
    
    CGFloat past;
    if (Num == 1 || Num == 5) {
        past = 0.4f;
    }
    else if(Num == 2 || Num == 4) {
        past = 0.2f;
    }
    else
    {
        past = 0.0f;
    }
    CAKeyframeAnimation* ani = [self animationWithPast:past];
    if (Num==1) {
        ani.delegate = self;
    }
    [no1 addAnimation:ani  forKey:@"no1Animation"];
    [no2 addAnimation:ani  forKey:@"no2Animation"];
    
}

-(CAKeyframeAnimation *) animationWithPast:(CGFloat) past
{
    
    CAKeyframeAnimation* ani = [CAKeyframeAnimation animationWithKeyPath:@"strokeEnd"];
    
        ani = [CAKeyframeAnimation animationWithKeyPath:@"strokeEnd"];
        ani.duration = 1.0f;
        ani.repeatCount = 10000;
    
    
        ani.keyTimes = @[[NSNumber numberWithFloat:past + 0.0f],
                                   [NSNumber numberWithFloat:past + 0.2f],
                                   [NSNumber numberWithFloat:past + 0.6f],
                         
                                   ];
        ani.values   = @[          @0.2f,
                                   @1.0f,
                                   @0.2f,
                                   ];
    return  [ani copy];
    
}


@end
