//
//  AASwitchPro.m
//  AASwitchPro
//
//  Created by An An on 2017/6/28.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "AASwitchPro.h"
@interface AASwitchPro()
- (void)handleTapTapGestureRecognizerEvent:(UITapGestureRecognizer *)recognizer;
@end
@implementation AASwitchPro
{
    UIButton *_view;
    UIView *_dotView;
    UIView *_shadowView;
    CGFloat _dotViewWidth;
    CGFloat _dotViewCornerRadius;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
         [self setUpOriginalStyle];
    }
    return self;
}


-(void)setOnTintColor:(UIColor *)onTintColor{
    if (_onTintColor ==nil) {
        _onTintColor = onTintColor;
     }
}

-(void)setTintColor:(UIColor *)tintColor{
    if  (_tintColor ==nil) {
        _tintColor =tintColor;
    }
}
- (void)setOn:(BOOL)on{
    [self setOn:on animated:NO];
}
- (void)setOn:(BOOL)on animated:(BOOL)animated{
    if (_on == on) {
        return;
    }
    
    _on = on;
     if (on ==YES) {
        if (animated==YES) {
            // 弹簧动画，参数分别为：时长，延时，弹性（越小弹性越大），初始速度
            [UIView animateWithDuration: 0.7 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0.3 options:0 animations:^{
                _view.backgroundColor = _onTintColor;
                _shadowView.frame = CGRectMake(self.frame.size.width-_dotViewWidth-2, 1, _dotViewWidth, _dotViewWidth);
            } completion:nil];
        }else{
            _view.backgroundColor = _onTintColor;
            _shadowView.frame = CGRectMake(self.frame.size.width-_dotViewWidth-2, 1, _dotViewWidth, _dotViewWidth);
        }
        _view.layer.borderWidth = 0;
    }else{
        if (animated ==YES) {
            [UIView animateWithDuration: 0.7 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0.3 options:0 animations:^{
                _view.backgroundColor = [UIColor whiteColor];
                _shadowView.frame = CGRectMake(1, 1, _dotViewWidth, _dotViewWidth);
            } completion:nil];
        }else{
            _view.backgroundColor = [UIColor whiteColor];
            _shadowView.frame = CGRectMake(1, 1, _dotViewWidth, _dotViewWidth);
        }
        _view.layer.borderWidth = 1;
    }
        [self sendActionsForControlEvents:UIControlEventValueChanged];
 }

- (void)setUpOriginalStyle{
    self.AASwitchProType = AASwitchProTypeRound;
    
    _dotViewWidth = self.frame.size.height-4;
    CGFloat _viewCornerRadius;
    if (self.AASwitchProType == AASwitchProTypeRect ) {
        _viewCornerRadius = 3;
        _dotViewCornerRadius = 3;
    }else{
        _viewCornerRadius = self.frame.size.height/2;
        _dotViewCornerRadius = _dotViewWidth/2;
    }
    self.backgroundColor = [UIColor whiteColor];
    _onTintColor = [UIColor colorWithRed:0.30f green:0.85f blue:0.39f alpha:1.00f];

    _view = [UIButton buttonWithType:UIButtonTypeCustom];
    _view.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    _view.layer.cornerRadius = _viewCornerRadius;
    _view.layer.masksToBounds = YES;
    _view.layer.borderWidth = 1;
    _view.layer.borderColor = [[UIColor colorWithRed:0.89f green:0.89f blue:0.91f alpha:1.00f] CGColor];
    _view.backgroundColor = [ UIColor whiteColor];
    [_view addTarget:self action:@selector(aaSwitchProClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_view];
    
    _dotView = [[UIView alloc]init];
    _dotView.frame = CGRectMake(1, 1, _dotViewWidth, _dotViewWidth);
    _dotView.layer.cornerRadius =_dotViewCornerRadius;
    _dotView.layer.masksToBounds = YES;
    _dotView.layer.shadowOffset = CGSizeMake(5, 5);
    _dotView.layer.shadowColor = [[UIColor grayColor] CGColor];
    _dotView.backgroundColor = [UIColor whiteColor];
    
    _shadowView = [[UIView alloc]initWithFrame:_dotView.frame];
    [self addSubview:_shadowView];
    _shadowView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    _shadowView.layer.shadowOffset = CGSizeMake(1, 2);
    _shadowView.layer.shadowOpacity = 1;
    _shadowView.layer.shadowRadius = 2;
    _shadowView.layer.cornerRadius = _dotViewCornerRadius;
    _shadowView.clipsToBounds = NO;
    [_shadowView addSubview:_dotView];
    [self addGestureRecognizerForWebView];
 
 }

- (void)aaSwitchProClicked:(UIButton *)sender{
//    NSLog(@"好像不是每次都触摸到了%d",_on);
//    if (_on==YES) {
//        [self setOn:NO animated:YES];
//     
//    }else{
//        [self setOn:YES animated:YES];
//    }

}

- (void)addGestureRecognizerForWebView {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapTapGestureRecognizerEvent:)];
    [_view addGestureRecognizer:tapGesture];
}

- (void)handleTapTapGestureRecognizerEvent:(UITapGestureRecognizer *)recognizer{
    NSLog(@"好像不是每次都触摸到了%d",_on);
         if (recognizer.state == UIGestureRecognizerStateEnded) {
            [self setOn:!self.isOn animated:YES];
        }
  }

@end
