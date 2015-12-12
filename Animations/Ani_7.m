#import "Ani_7.h"
#import <QuartzCore/QuartzCore.h>


@interface Ani_7 ()
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

@implementation Ani_7

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
    [path addArcWithCenter:CGPointMake(0, 0) radius:10 startAngle:0 endAngle:2*M_PI clockwise:YES];
    [path closePath];
    
    _no1 = [CAShapeLayer layer];
    _no1.position = CGPointMake(width/2 - 30, 40);
    _no1.path = path.CGPath;
    _no1.fillColor = [UIColor whiteColor].CGColor;
    
    [_ground addSublayer:_no1];

    _no2 = [CAShapeLayer layer];
    _no2.position = CGPointMake(width/2,40);
    _no2.path = path.CGPath;
    _no2.fillColor = [UIColor whiteColor].CGColor;
    
    [_ground addSublayer:_no2];

    _no3 = [CAShapeLayer layer];
    _no3.position = CGPointMake(width/2 + 30,40);
    _no3.path = path.CGPath;
    _no3.fillColor = [UIColor whiteColor].CGColor;
    
    [_ground addSublayer:_no3];
    
    _no1Animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    _no1Animation.repeatCount = 1000;
    _no1Animation.duration = 1.2;
    _no1Animation.keyTimes = @[@0,@0.1,@0.25,@0.5,@0.75,@0.9,@1];
    _no1Animation.values   = @[@0,@0,@0.7,@1,@0.7,@0,@0];
    //_no1Animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    _no1.transform = CATransform3DMakeScale(0, 0, 0);
    _no2.transform = CATransform3DMakeScale(0, 0, 0);
    _no3.transform = CATransform3DMakeScale(0, 0, 0);

    [_no1 addAnimation:_no1Animation forKey:@"no1"];
    
    dispatch_time_t t1 = dispatch_time(DISPATCH_TIME_NOW, 0.2 * NSEC_PER_SEC);
    dispatch_time_t t2 = dispatch_time(DISPATCH_TIME_NOW, 0.40 * NSEC_PER_SEC);

    dispatch_after(t1, dispatch_get_main_queue(), ^{
        [_no2 addAnimation:_no1Animation forKey:@"no2"];
    });
    
    dispatch_after(t2, dispatch_get_main_queue(), ^{
        [_no3 addAnimation:_no1Animation forKey:@"no3"];

    });
    
    
    
    
}


@end
