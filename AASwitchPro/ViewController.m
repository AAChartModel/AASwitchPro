//
//  ViewController.m
//  AASwitchPro
//
//  Created by An An on 2017/6/28.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "ViewController.h"
#import "AASwitchPro.h"

@interface ViewController ()<UIGestureRecognizerDelegate>
{
    AASwitchPro *aaSwitch;
    UIImageView *_imgView;
    UIView *_dotView;
    UIView *_thumbView;
    CGFloat _thumbViewWidth;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _thumbViewWidth = 50;
    
    
    _thumbView = [[UIView alloc] init];
    _thumbView.backgroundColor = [UIColor purpleColor];
    // 禁止将 AutoresizingMask 转换为 Constraints
    _thumbView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_thumbView];
    // 添加 width 约束
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:_thumbView
                                                                       attribute:NSLayoutAttributeWidth
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil
                                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                                      multiplier:0.0
                                                                        constant:150];
    [_thumbView addConstraint:widthConstraint];
    // 添加 height 约束
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_thumbView
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:0.0
                                                                         constant:150];
    [_thumbView addConstraint:heightConstraint];
    // 添加 left 约束
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:_thumbView
                                                                      attribute:NSLayoutAttributeLeft
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self.view
                                                                      attribute:NSLayoutAttributeLeft
                                                                     multiplier:1.0
                                                                       constant:100];
    [self.view addConstraint:leftConstraint];
//    // 添加 top 约束
//    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:_thumbView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:200];
//    [self.view addConstraint:topConstraint];
        // 添加 centerY 约束
        NSLayoutConstraint *centerConstraint = [NSLayoutConstraint constraintWithItem:_thumbView
                                                                            attribute:NSLayoutAttributeCenterY
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:self.view
                                                                            attribute:NSLayoutAttributeCenterY
                                                                           multiplier:1.0
                                                                             constant:0];
    [self.view addConstraint:centerConstraint];
    
    _thumbView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    _thumbView.layer.shadowOffset = CGSizeMake(1, 2);
    _thumbView.layer.shadowOpacity = 1;
    _thumbView.layer.shadowRadius = 10;
    _thumbView.layer.cornerRadius = 10;
    _thumbView.clipsToBounds = NO;
    
    
 
    
     [self setUpView];

 }
-(void)setUpView{
  aaSwitch =[[AASwitchPro alloc]initWithFrame:CGRectMake(100, 100, 100, 40)];
     [self.view addSubview:aaSwitch];
 [aaSwitch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor grayColor];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(200, 200, 60, 60);
    [self.view addSubview:button];
    
    button.layer.shadowOffset = CGSizeMake(5, 5);
    button.layer.shadowColor = [[UIColor grayColor] CGColor];
    
}
-(void)switchChanged:(AASwitchPro *)sender{
    if (sender.on) {
        NSLog(@"switchPressed ON");
    } else {
        NSLog(@"switchPressed OFF");
    }
}

-(void)buttonClicked:(UIButton *)sender{
    if (aaSwitch.on ==YES) {
        [aaSwitch setOn:NO animated:YES];
        aaSwitch.appearanceType = AASwitchProAppearanceTypeRect;
        aaSwitch.tintColor = [UIColor redColor];
        aaSwitch.thumbTintColor = [UIColor blueColor];
    }else{
        [aaSwitch setOn:YES animated:YES];
        aaSwitch.appearanceType = AASwitchProAppearanceTypeRound;
        aaSwitch.tintColor = [UIColor blackColor];
        aaSwitch.thumbTintColor = [UIColor brownColor];

        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
