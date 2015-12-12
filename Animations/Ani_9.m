#import "Ani_9.h"
#import <QuartzCore/QuartzCore.h>


@interface Ani_9 ()
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

@implementation Ani_9

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
 
    
    
    _no1 = [CAShapeLayer layer];
    _no1.position = CGPointMake(width/2, 40);
    _no1.bounds = CGRectMake(0, 0, 72, 72);// 24x24   12,12  12,36 12,60
                                           //         36,12  36,36 36,60
                                            //        60,12  60,36 60,60
    _no1.backgroundColor = [UIColor clearColor].CGColor;
    
    __block CAShapeLayer *lay[9];
    
    for (int i=1; i<=3; i++) {
        for (int j=1; j<=3; j++) {
            lay[(i-1)*3 + j -1] = [self shapeLayerWithPoint:CGPointMake( 12 + (i-1)*24, 12+(j-1)*24)];
        }
    }
 
    
    for (int i=0; i<9; i++) {
        [_no1 addSublayer:lay[i]];
    }
    
    [_ground addSublayer:_no1];
    
    _no1Animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    _no1Animation.repeatCount = 1000;
    _no1Animation.duration = 1.5;
    _no1Animation.keyTimes = @[@0,@0.1,@0.3,@0.5,@0.7,@0.9,@1];
    _no1Animation.values   = @[@0,@0  ,@01 ,@1  ,@1 ,@0  ,@0];
    
    dispatch_time_t t[9] ;
    for (int i=0; i<9; i++) {
        [_no1 addSublayer:lay[i]];
        
        if(i == 2)
        {
            t[i] = dispatch_time(DISPATCH_TIME_NOW, 0 * NSEC_PER_SEC);
        }
        else if (i ==1 || i==5)
        {
            t[i] = dispatch_time(DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC);
        }
        else if( i == 0 ||i==4||i==8)
        {
            t[i] = dispatch_time(DISPATCH_TIME_NOW, 0.2 * NSEC_PER_SEC);
        }
        else if (i==3 || i==7)
        {
            t[i] = dispatch_time(DISPATCH_TIME_NOW, 0.3 * NSEC_PER_SEC);
        }
        else
        {
            t[i] = dispatch_time(DISPATCH_TIME_NOW, 0.4 * NSEC_PER_SEC);
        }
        
    }
    
    for (  int i=8; i>=0; i--) {
        CAShapeLayer* l = lay[i];
        lay[i].transform = CATransform3DMakeScale(0, 0, 0);
        dispatch_after(t[i], dispatch_get_main_queue(), ^{
            [l addAnimation:_no1Animation forKey:[NSString stringWithFormat:@"no_%d",i]];
        });
    }
    
}
-(CAShapeLayer* )shapeLayerWithPoint:(CGPoint) point
{
    CAShapeLayer* lay = [CAShapeLayer layer];
    lay.position = point;
    lay.bounds = CGRectMake(0, 0, 24, 24);
    
    lay.backgroundColor = [UIColor whiteColor ].CGColor;
    return lay;
}

@end
