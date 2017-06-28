//
//  AASwitchPro.m
//  AASwitchPro
//
//  Created by An An on 2017/6/28.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "AASwitchPro.h"
static const CGFloat _dotViewWidth = 30-2;
@implementation AASwitchPro
{
    UIView *_view;
    UIView *_dotView;
    UIView *_shadowView;
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
    [self setOn:on animated:YES];
}
- (void)setOn:(BOOL)on animated:(BOOL)animated{
    if (_on==on) {
        return;
    }
    _on = on;

    if (self.on ==YES) {
          // 弹簧动画，参数分别为：时长，延时，弹性（越小弹性越大），初始速度
        [UIView animateWithDuration: 0.7 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.3 options:0 animations:^{
            _view.backgroundColor = _onTintColor;
            _shadowView.frame = CGRectMake(self.frame.size.width-_dotViewWidth-1, 1, _dotViewWidth, _dotViewWidth);
        } completion:nil];
//        [UIView animateWithDuration:0.2 animations:^{
//            _view.backgroundColor = _onTintColor;
//            _shadowView.frame = CGRectMake(self.frame.size.width-_dotViewWidth-1, 1, _dotViewWidth, _dotViewWidth);
//        }];
        
        _view.layer.borderWidth = 0;
    }else{
        
        [UIView animateWithDuration: 0.7 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.3 options:0 animations:^{
            _view.backgroundColor = [UIColor whiteColor];
            _shadowView.frame = CGRectMake(1, 1, _dotViewWidth, _dotViewWidth);
        } completion:nil];
//        [UIView animateWithDuration:0.2 animations:^{
//            _view.backgroundColor = [UIColor whiteColor];
//            _shadowView.frame = CGRectMake(1, 1, _dotViewWidth, _dotViewWidth);
//        }];
        _view.layer.borderWidth = 1;
    }
}

-(void)setUpOriginalStyle{
    self.backgroundColor = [UIColor whiteColor];
    _onTintColor = [UIColor greenColor];

    _view = [[UIView alloc]init];
    _view.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    _view.layer.cornerRadius = 15;
    _view.layer.masksToBounds = YES;
    _view.layer.borderWidth = 1;
    _view.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    _view.backgroundColor = [ UIColor whiteColor];
    [self addSubview:_view];
    
    CGFloat _dotViewWidth = 30-4;
    _dotView = [[UIView alloc]init];
    _dotView.frame = CGRectMake(1, 1, _dotViewWidth, _dotViewWidth);
    _dotView.layer.cornerRadius =_dotViewWidth/2;
    _dotView.layer.masksToBounds = YES;
    _dotView.layer.shadowOffset = CGSizeMake(5, 5);
    _dotView.layer.shadowColor = [[UIColor grayColor] CGColor];
    _dotView.backgroundColor = [UIColor whiteColor];
    
    _dotView = [[UIView alloc]init];
    _dotView.frame = CGRectMake(1, 1, _dotViewWidth, _dotViewWidth);
    _dotView.layer.cornerRadius =_dotViewWidth/2;
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
    
    _shadowView.layer.cornerRadius = _dotViewWidth/2;
    
    _shadowView.clipsToBounds = NO;
    
    [_shadowView addSubview:_dotView];
    
 
 }
-(void)configureTheGestureRecognizer{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGestureRecognizerEvent:)];
    [_view addGestureRecognizer:tapGesture];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGestureRecognizerEvent:)];
    [_view addGestureRecognizer:panGesture];
}

- (void)handleTapGestureRecognizerEvent:(UITapGestureRecognizer *)recognizer{
    BOOL isOnOrNot = !_on;
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        [self setOn:isOnOrNot animated:YES];
    }
}
- (void)handlePanGestureRecognizerEvent:(UIPanGestureRecognizer *)recognizer{
    
}
@end
