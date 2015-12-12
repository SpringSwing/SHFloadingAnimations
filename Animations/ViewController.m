//
//  ViewController.m
//  Animations
//
//  Created by SHF on 15/12/7.
//  Copyright © 2015年 SHF. All rights reserved.
//

#import "ViewController.h"
#import "Ani.h"
#import "Ani_2.h"
#import "Ani_3.h"
#import "Ani_4.h"
#import "Ani_5.h"
#import "Ani_6.h"
#import "Ani_7.h"
#import "Ani_8.h"
#import "Ani_9.h"
#import "Ani_10.h"
#import "Ani_11.h"
@interface ViewController ()
{
    CGFloat width;
    CGFloat height;
    int     nowIndex;
    id      nowAniView;
}
@property (strong,nonatomic) NSArray* animationArray;
@property (strong,nonatomic) NSArray* color;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIColor *c1 = [UIColor colorWithRed:230/255.0 green:60/255.0 blue:80/255.0 alpha:1];
    UIColor *c2 = [UIColor colorWithRed:209/255.0 green:84/255.0 blue:25/255.0 alpha:1];
    UIColor *c3 = [UIColor colorWithRed:45/255.0 green:62/255.0 blue:79/255.0 alpha:1];
    UIColor *c4 = [UIColor colorWithRed:47/255.0 green:129/255.0 blue:183/255.0 alpha:1];
    UIColor *c6 = [UIColor colorWithRed:48/255.0 green:173/255.0 blue:99/255.0 alpha:1];
    UIColor *c7 = [UIColor colorWithRed:41/255.0 green:187/255.0 blue:156/255.0 alpha:1];
    _color = [NSArray arrayWithObjects:c1,c2,c3,c4,c6,c7, nil];
    
    self.view.backgroundColor = [UIColor colorWithRed:230/255.0 green:60/255.0 blue:80/255.0 alpha:1];
    width  = self.view.bounds.size.width;
    height = self.view.bounds.size.height;
    
    
    Ani* firstAnimation = [[Ani alloc]initWithView:self.view];
    
    _animationArray     = [NSArray arrayWithObjects:[Ani class],
                           [Ani_2 class],
                           [Ani_3 class],
                           [Ani_4 class],
                           [Ani_5 class],
                           [Ani_6 class],
                           [Ani_7 class],
                           [Ani_8 class],
                           [Ani_9 class],
                           [Ani_10 class],
                           [Ani_11 class],
                           nil];
    
    [self.view addSubview:firstAnimation];
    [self.view bringSubviewToFront:firstAnimation];
    nowAniView = firstAnimation;
    nowIndex=0;
}
- (IBAction)leftButton:(id)sender {
    if (nowIndex ==0 ) {
        return;
    }
    id nowView = [[_animationArray[--nowIndex]alloc]initWithView:self.view];
    
    UIView *past = nowAniView;
    UIView *real = nowView;
    CGPoint targ = real.center ;
    real.center  = CGPointMake(real.center.x - 70, real.center.y);
    real.alpha = 0.3f;
    [UIView animateWithDuration:0.5 animations:^{
        self.view.backgroundColor = _color[nowIndex % 6];

    }];
    
    [UIView animateWithDuration:0.3 animations:^{
        real.center = targ;
        real.alpha = 1.0f;
        past.center = CGPointMake(past.center.x + 70, past.center.y);
        [nowAniView setValue:[NSNumber numberWithFloat:0] forKey:@"alpha"];
    } completion:^(BOOL finished) {
        [nowAniView removeFromSuperview];
        nowAniView = nowView;
    }];
    
    
    [self.view addSubview:nowView];
    [self.view bringSubviewToFront:nowView];
    
    
    
}
-(void) viewDidLayoutSubviews
{
    [super viewDidAppear:YES];
    if (nowIndex == 10) {
        [[NSNotificationCenter defaultCenter]postNotificationName:@"animation_1" object:nil];
    }
}

- (IBAction)rightButton:(id)sender {
    if (nowIndex == _animationArray.count-1) {
        return;
    }
    
    id nowView = [[_animationArray[++nowIndex]alloc]initWithView:self.view];
    UIView *past = nowAniView;
    UIView *real = nowView;
    CGPoint targ = real.center ;
    real.center  = CGPointMake(real.center.x + 70, real.center.y);
    real.alpha = 0.3f;
    [UIView animateWithDuration:0.5 animations:^{
        self.view.backgroundColor = _color[nowIndex % 6];
        
    }];
    [UIView animateWithDuration:0.3 animations:^{
        real.center = targ;
        real.alpha = 1.0f;
        past.center = CGPointMake(past.center.x - 70, past.center.y);
        [nowAniView setValue:[NSNumber numberWithFloat:0] forKey:@"alpha"];
    } completion:^(BOOL finished) {
        [nowAniView removeFromSuperview];
        nowAniView = nowView;
    }];
    
    [self.view addSubview:nowView];
    [self.view bringSubviewToFront:nowView];
}
-(void)didReceiveMemoryWarning
{
    
}



@end
