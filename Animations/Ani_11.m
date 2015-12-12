#import "Ani_11.h"
#import <QuartzCore/QuartzCore.h>

#define kSHFDuration 0.3f
@interface Ani_11 ()
{
    CGFloat width;
    CGFloat height;
    int index;
    CAShapeLayer *lay[4];
}
@property (weak, nonatomic) UIView *containerView;


@property (strong,nonatomic) CALayer *ground;
@property (strong,nonatomic) CAShapeLayer* back;

@property (strong,nonatomic) CAAnimationGroup *no1Animation;
@property (strong,nonatomic) CAAnimationGroup *no2Animation;
@property (strong,nonatomic) CAAnimationGroup *no3Animation;
@property (strong,nonatomic) CAAnimationGroup *no4Animation;




-(void) initCommon;
-(void) initContainer;
-(void)initNoWithSize:(CGSize ) size ;
@end

@implementation Ani_11

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
    CATransform3D transform1 = CATransform3DIdentity;
    transform1.m34 = -0.01;
    CATransform3D transform2 = CATransform3DIdentity;
    transform2.m34 = 0.01;
    
    _back = [CAShapeLayer layer];
    _back.bounds = CGRectMake(0, 0, 80, 80);
    _back.position = CGPointMake(width/2, 40);
    _back.anchorPoint = CGPointMake(0.5f, 0.5f);
    _back.backgroundColor = [UIColor clearColor].CGColor;
    
    [_ground addSublayer:_back];
    
    lay[0] = [self layerWithPoint:CGPointMake(40, 20) andAnchor:CGPointMake(1, 0.5)];
    lay[1] = [self layerWithPoint:CGPointMake(60, 40) andAnchor:CGPointMake(0.5, 1)];
    lay[2] = [self layerWithPoint:CGPointMake(40, 60) andAnchor:CGPointMake(0, 0.5)];
    lay[3] = [self layerWithPoint:CGPointMake(20, 40) andAnchor:CGPointMake(0.5, 0)];

    
    [_back addSublayer:lay[0]];
    [_back addSublayer:lay[1]];
    [_back addSublayer:lay[2]];
    [_back addSublayer:lay[3]];
    
    _back.transform = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);

    dispatch_time_t t = dispatch_time(DISPATCH_TIME_NOW, 0.2*NSEC_PER_SEC);
    
    dispatch_after(t, dispatch_get_main_queue(), ^{
        [self animation_1];
    });
                   
}

-(void)animation_1
{
    CATransform3D transform1 = CATransform3DIdentity;
    transform1.m34 = -0.007;
    
    transform1 = CATransform3DRotate(transform1, M_PI  * 7/8, 0, 1, 0);
    dispatch_async(dispatch_get_main_queue(), ^{
        [CATransaction begin];
        [CATransaction setAnimationDuration:kSHFDuration];
        [CATransaction setCompletionBlock:^{
            [CATransaction setDisableActions:YES];
            lay[0].opacity = 0;
            lay[0].transform = CATransform3DMakeRotation(0, 0, 1, 0);
            [self animation_2];
        }];
       // lay[0].opacity = 0.7;
        lay[0].transform = transform1;
        [CATransaction commit];
    });
}
-(void)animation_2
{
    CATransform3D transform1 = CATransform3DIdentity;
    transform1.m34 = 0.007;
  
    transform1 = CATransform3DRotate(transform1, M_PI  * 7/8, 1, 0, 0);
    dispatch_async(dispatch_get_main_queue(), ^{
        [CATransaction begin];
        [CATransaction setAnimationDuration:kSHFDuration];
        [CATransaction setCompletionBlock:^{
            [CATransaction setDisableActions:YES];
            lay[1].opacity = 0;
            lay[1].transform = CATransform3DMakeRotation(0, 1, 0, 0);
            [self animation_3];
        }];
       // lay[1].opacity = 0.7;
        lay[1].transform = transform1   ;

        [CATransaction commit];
    });
    
}
-(void)animation_3
{
    CATransform3D transform1 = CATransform3DIdentity;
    transform1.m34 = 0.007;
    
    transform1 = CATransform3DRotate(transform1, M_PI * 7/8, 0, 1, 0);
    dispatch_async(dispatch_get_main_queue(), ^{
        [CATransaction begin];
        [CATransaction setAnimationDuration:kSHFDuration];
        [CATransaction setCompletionBlock:^{
            [CATransaction setDisableActions:YES];
            lay[2].opacity = 0;
            lay[2].transform = CATransform3DMakeRotation(0, 0, 1, 0);
            [self animation_4];
        }];
       // lay[2].opacity = 0.7;
        lay[2].transform = transform1;
        
        [CATransaction commit];
    });
  
}
-(void)animation_4
{
    CATransform3D transform1 = CATransform3DIdentity;
    transform1.m34 = 0.007;
    
    transform1 = CATransform3DRotate(transform1, M_PI, 1, 0, 0);
    dispatch_async(dispatch_get_main_queue(), ^{
        [CATransaction begin];
        [CATransaction setAnimationDuration:kSHFDuration];
        [CATransaction setCompletionBlock:^{
            [CATransaction setDisableActions:YES];
            lay[3].transform = CATransform3DMakeRotation(0, 1, 0, 0);
            lay[0].opacity = 1;
            lay[3].opacity = 0;
                
            [self animation_5];
        }];
        lay[3].transform = transform1;
        
        [CATransaction commit];
    });
}
-(void)animation_5
{
    
    CATransform3D transform1 = CATransform3DIdentity;
    transform1.m34 = -0.007;
    
    transform1 = CATransform3DRotate(transform1, M_PI  * 9/10, 0, 1, 0);
    
    CAShapeLayer* tmp = [self layerWithPoint:CGPointMake(40, 20) andAnchor:CGPointMake(1, 0.5)];
    [_back addSublayer:tmp];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [CATransaction begin];
        [CATransaction setAnimationDuration:kSHFDuration];
        [CATransaction setCompletionBlock:^{
                [CATransaction setDisableActions:YES];
                lay[1].opacity = 1;
                [tmp removeFromSuperlayer];
        
            [self animation_6];
        }];
        tmp.transform = transform1;
        
        [CATransaction commit];
    });
 //   科技创新城  科技一街 399号 3号楼 西座四层 125   13284011807
}
-(void)animation_6
{
    CATransform3D transform1 = CATransform3DIdentity;
    transform1.m34 = 0.007;
    
    transform1 = CATransform3DRotate(transform1, M_PI  * 9/10, 1, 0, 0);
    CAShapeLayer* tmp = [self layerWithPoint:CGPointMake(60, 40) andAnchor:CGPointMake(0.5, 1)];
    [_back addSublayer:tmp];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [CATransaction begin];
        [CATransaction setAnimationDuration:kSHFDuration];
        [CATransaction setCompletionBlock:^{
                [CATransaction setDisableActions:YES];
                lay[2].opacity = 1;
                [tmp removeFromSuperlayer];
            
            [self animation_7];
        }];
        tmp.transform = transform1;
        
        [CATransaction commit];
    });
}
-(void)animation_7
{
    CATransform3D transform1 = CATransform3DIdentity;
    transform1.m34 = -0.007;
    
    transform1 = CATransform3DRotate(transform1, M_PI  , 0, 1, 0);
    CAShapeLayer* tmp = [self layerWithPoint:CGPointMake(40, 60) andAnchor:CGPointMake(0, 0.5)];
    [_back addSublayer:tmp];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [CATransaction begin];
        [CATransaction setAnimationDuration:kSHFDuration];
        [CATransaction setCompletionBlock:^{
                [CATransaction setDisableActions:YES];
                lay[3].opacity = 1;
                [tmp removeFromSuperlayer];
            dispatch_time_t t = dispatch_time(DISPATCH_TIME_NOW, 0.3 * NSEC_PER_SEC);
            
            dispatch_after(t, dispatch_get_main_queue(), ^{
                [self animation_1];
            });
        }];
        tmp.transform = transform1;
        
        [CATransaction commit];
    });
}
-(CAShapeLayer *)layerWithPoint:(CGPoint )point andAnchor:(CGPoint)anchor
{
    CAShapeLayer* layer = [CAShapeLayer layer];
    layer.bounds = CGRectMake(0, 0, 40, 40);
    layer.position = point;
    layer.anchorPoint = anchor;
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    
    return layer;
}



@end
