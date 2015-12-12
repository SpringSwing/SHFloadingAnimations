#import "Ani_4.h"
#import <QuartzCore/QuartzCore.h>


@interface Ani_4 ()
{
    CGFloat width;
    CGFloat height;
    int index;
}
@property (weak, nonatomic) UIView *containerView;

@property (strong,nonatomic) CALayer *ground;
@property (strong,nonatomic) CALayer *back;
@property (strong,nonatomic) CAShapeLayer *no1;
@property (strong,nonatomic) CAShapeLayer * no2;
@property (strong,nonatomic) CAAnimationGroup *g1;
@property (strong,nonatomic) CAAnimationGroup *g2;
@property (strong,nonatomic) CAAnimationGroup *g3;
@property (strong,nonatomic) CAAnimationGroup *g4;


-(void) initCommon;
-(void) initContainer;
-(void)initNoWithSize:(CGSize ) size ;
@end

@implementation Ani_4

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
     _back  = [CAShapeLayer layer];
    _back.frame = CGRectMake(width/2, 40, 70, 70 );
    _back.position = CGPointMake(width/2, 40);
    _back.anchorPoint = CGPointMake(0.5f, 0.5f);
    _back.backgroundColor = [UIColor clearColor].CGColor;
    [_ground addSublayer:_back];
    
    _no1 = [CAShapeLayer layer];
    _no1.frame = CGRectMake(45, 0, 25, 25);
    _no1.anchorPoint = CGPointMake(0.5f, 0.5f);
    _no1.backgroundColor = [UIColor whiteColor].CGColor;
    
    
    [_back addSublayer:_no1];
    
    _no2 = [CAShapeLayer layer];
    _no2.frame = CGRectMake(0, 45, 25, 25);
    _no2.anchorPoint = CGPointMake(0.5f, 0.5f);
    _no2.backgroundColor = [UIColor whiteColor].CGColor;
    
    [_back addSublayer:_no2];
    
    CABasicAnimation* rotate = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotate.duration = 0.7f;
    rotate.fromValue = [NSNumber numberWithFloat:0];
    rotate.toValue = [NSNumber numberWithFloat:M_PI/2];
    rotate.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CABasicAnimation* scale_1 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale_1.duration = 0.7f;
    scale_1.fromValue = [NSNumber numberWithFloat:1.0f];
    scale_1.toValue = [NSNumber numberWithFloat:0.6f];
    scale_1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CABasicAnimation* scale_2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale_2.duration = 0.7f;
    scale_2.fromValue = [NSNumber numberWithFloat:0.6f];
    scale_2.toValue = [NSNumber numberWithFloat:1.0f];
    scale_2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    
    CABasicAnimation* translate_1 = [CABasicAnimation animationWithKeyPath:@"position"];
    translate_1.duration = 0.7f;
    translate_1.fromValue = [NSValue valueWithCGPoint:CGPointMake(57.5, 12.5)];
    translate_1.toValue = [NSValue valueWithCGPoint:CGPointMake(62.5, 62.5)];
    translate_1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CABasicAnimation* translate_2 = [CABasicAnimation animationWithKeyPath:@"position"];
    translate_2.duration = 0.7f;
    translate_2.fromValue = [NSValue valueWithCGPoint:CGPointMake(62.5, 62.5)];
    translate_2.toValue = [NSValue valueWithCGPoint:CGPointMake(12.5, 57.5)];
    translate_2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CABasicAnimation* translate_3 = [CABasicAnimation animationWithKeyPath:@"position"];
    translate_3.duration = 0.7f;
    translate_3.fromValue = [NSValue valueWithCGPoint:CGPointMake(12.5, 57.5)];
    translate_3.toValue = [NSValue valueWithCGPoint:CGPointMake(7.5, 7.5)];
    translate_3.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CABasicAnimation* translate_4 = [CABasicAnimation animationWithKeyPath:@"position"];
    translate_4.duration = 0.7f;
    translate_4.fromValue = [NSValue valueWithCGPoint:CGPointMake(7.5, 7.5)];
    translate_4.toValue = [NSValue valueWithCGPoint:CGPointMake(57.5, 12.5)];
    translate_4.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    
    CAAnimationGroup* group_1 = [CAAnimationGroup animation];
    group_1.duration = 0.7f;
    group_1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [group_1 setAnimations:[NSArray arrayWithObjects:scale_1,translate_1,rotate, nil]];
    
    CAAnimationGroup* group_2 = [CAAnimationGroup animation];
    group_2.duration = 0.7f;
    group_2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [group_2 setAnimations:[NSArray arrayWithObjects:scale_2,translate_2,rotate, nil]];
    
    CAAnimationGroup* group_3 = [CAAnimationGroup animation];
    group_3.duration = 0.7f;
    group_3.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [group_3 setAnimations:[NSArray arrayWithObjects:scale_1,translate_3,rotate, nil]];
    
    CAAnimationGroup* group_4 = [CAAnimationGroup animation];
    group_4.duration = 0.7f;
    group_4.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [group_4 setAnimations:[NSArray arrayWithObjects:scale_2,translate_4,rotate, nil]];
    
    group_1.delegate = self;
    group_2.delegate = self;
    _g1 = group_1;
    _g2 = group_2;
    _g3 = group_3;
    _g4 = group_4;
    
    _no1.position = CGPointMake(62.5, 62.5);
    _no2.position = CGPointMake(7.5, 7.5);
    
    _no1.transform = CATransform3DMakeScale(0.6, 0.6, 0.6);
    _no2.transform = CATransform3DMakeScale(0.6, 0.6, 0.6);
    
    [_no1 addAnimation:_g1 forKey:@"ani1"];
    [_no2 addAnimation:_g3 forKey:@"ani2"];
    
    [_g1 setValue:[NSNumber numberWithBool:YES] forKey:@"cumulative"];
    index = 2;
}
-(void)animationDidStart:(CAAnimation *)anim
{
//    (57.5, 12.5)
//
//    (62.5, 62.5)
//
//    (12.5, 57.5)
//    (7.5, 7.5)


}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (index == 1 ) {
        _no1.position = CGPointMake(62.5, 62.5);
        _no2.position = CGPointMake(7.5, 7.5);
        
        _no1.transform = CATransform3DMakeScale(0.6, 0.6, 0.6);
        _no2.transform = CATransform3DMakeScale(0.6, 0.6, 0.6);
        
        [_no1 addAnimation:_g1 forKey:@"ani1"];
        [_no2 addAnimation:_g3 forKey:@"ani2"];
        index=2;
    }
    else if(index == 2)
    {
        _no1.position = CGPointMake(12.5, 57.5);
        _no2.position = CGPointMake(57.5, 12.5);
        
        _no1.transform = CATransform3DMakeScale(1.0,1.0,1.0);
        _no2.transform = CATransform3DMakeScale(1.0,1.0,1.0);
        
        [_no1 addAnimation:_g2 forKey:@"ani1"];
        [_no2 addAnimation:_g4 forKey:@"ani2"];
        
        index=3;
    }
    else if(index == 3)
    {
        _no1.position = CGPointMake(7.5, 7.5);
        _no2.position = CGPointMake(62.5, 62.5);
        
        _no1.transform = CATransform3DMakeScale(0.6, 0.6, 0.6);
        _no2.transform = CATransform3DMakeScale(0.6, 0.6, 0.6);
        
        [_no1 addAnimation:_g3 forKey:@"ani1"];
        [_no2 addAnimation:_g1 forKey:@"ani2"];
        
        index=4;
    }
    else if(index == 4)
    {
        _no1.position = CGPointMake(57.5, 12.5);
        _no2.position = CGPointMake(12.5, 57.5);
        
        _no1.transform = CATransform3DMakeScale(1.0,1.0,1.0);
        _no2.transform = CATransform3DMakeScale(1.0,1.0,1.0);
        
        [_no1 addAnimation:_g4 forKey:@"ani1"];
        [_no2 addAnimation:_g2 forKey:@"ani2"];
        
        index=1;
    }
    
}


@end