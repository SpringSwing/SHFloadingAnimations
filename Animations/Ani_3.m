#import "Ani_3.h"
#import <QuartzCore/QuartzCore.h>


@interface Ani_3 ()
{
    CGFloat width;
    CGFloat height;
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

@implementation Ani_3

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
    
    _no1 = [CAShapeLayer layer];
    _no1.frame = CGRectMake(width/2, 40, 70, 70);
    
    _no1.path = path.CGPath;
    _no1.fillColor = [UIColor whiteColor].CGColor;
    _no1.anchorPoint = CGPointMake(0.5f, 0.5f);
    _no1.position = CGPointMake(width/2, 40);
    _no1.opacity = 0.7f;
    [_ground addSublayer:_no1];
    _no1.backgroundColor = [UIColor clearColor].CGColor;
    
    
    _no2 = [CAShapeLayer layer];
    _no2.frame = CGRectMake(width/2, 40, 70, 70);
    
    _no2.path = path.CGPath;
    _no2.fillColor = [UIColor whiteColor].CGColor;
    _no2.anchorPoint = CGPointMake(0.5f, 0.5f);
    _no2.position = CGPointMake(width/2, 40);
    _no2.opacity = 0.7f;
    [_ground addSublayer:_no2];
    _no2.backgroundColor = [UIColor clearColor].CGColor;
    
    
    
    
    CABasicAnimation* basicAni = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    basicAni.duration = 1.0f;
    basicAni.repeatCount = 1000;
    basicAni.fromValue = [NSNumber numberWithFloat:1];
    basicAni.toValue   = [NSNumber numberWithFloat:0];
    
    basicAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CABasicAnimation* basicAni2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    basicAni2.duration = 1.0f;
    basicAni2.repeatCount =1000;
    basicAni2.fromValue = [NSNumber numberWithFloat:0];
    basicAni2.toValue   = [NSNumber numberWithFloat:1];
    
    basicAni2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    
    _no1Animation = basicAni;
    _no2Animation = basicAni2;
    
 
    
    [_no1 addAnimation:_no1Animation forKey:@"ani1"];
    [_no2 addAnimation:_no2Animation forKey:@"ani2"];
    
}


@end
