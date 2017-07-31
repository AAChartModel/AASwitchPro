//
//  AASwitchPro.m
//  AASwitchPro
//
//  Created by An An on 2017/6/28.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "AASwitchPro.h"

@interface AASwitchPro(){
    UIView *_thumbView;
    CGFloat _thumbViewWidth;
    CGFloat _thumbViewCornerRadius;
}
@property (nonatomic,strong) NSLayoutConstraint *leftConstraint;
@property (nonatomic,strong) NSLayoutConstraint *rightConstraint;
@property (nonatomic,strong) NSLayoutConstraint *widthConstraint;
@end

@implementation AASwitchPro


-(instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self) {
        [self setUpOriginalViewAndAppearanceStyle];
    }
    return self;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setUpOriginalViewAndAppearanceStyle];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpOriginalViewAndAppearanceStyle];
    }
    return self;
}

- (void)setOnTintColor:(UIColor *)onTintColor{
    if (_onTintColor != onTintColor) {
        _onTintColor = onTintColor;
        self.backgroundColor = _onTintColor;
    }
}

- (void)setTintColor:(UIColor *)tintColor{
    if (_tintColor != tintColor) {
        _tintColor = tintColor;
        self.layer.borderColor = [_tintColor CGColor];
    }
}

- (void)setThumbTintColor:(UIColor *)thumbTintColor{
    if (_thumbTintColor != thumbTintColor) {
        _thumbTintColor = thumbTintColor;
        _thumbView.backgroundColor = _thumbTintColor;
    }
}

- (void)setAppearanceType:(AASwitchProAppearanceType)appearanceType{
    if (_appearanceType != appearanceType) {
        _appearanceType = appearanceType;
        
        CGFloat _viewCornerRadius;
        if (self.appearanceType == AASwitchProAppearanceTypeRect ) {
            _viewCornerRadius = 3;
            _thumbViewCornerRadius = 3;
        }else{
            _viewCornerRadius = self.frame.size.height/2;
            _thumbViewCornerRadius = _thumbViewWidth/2;
        }
        
        self.layer.cornerRadius = _viewCornerRadius;
        _thumbView.layer.cornerRadius = _thumbViewCornerRadius;
    }
}

- (void)setThumbPadding:(CGFloat)thumbPadding {
    if (_thumbPadding != thumbPadding) {
        _thumbPadding = thumbPadding;
        
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
    if (on == YES) {
        [self removeConstraint:self.leftConstraint];
        [self addConstraint:self.rightConstraint];
        if (animated == YES) {
            // 弹簧动画，参数分别为：时长，延时，弹性（越小弹性越大），初始速度
            [UIView animateWithDuration:0.7
                                  delay:0
                 usingSpringWithDamping:0.6
                  initialSpringVelocity:0.3
                                options:0
                             animations:^{
                                 self.backgroundColor = _onTintColor;
                                 [self layoutIfNeeded];
                                 
                             } completion:nil];
        } else {
            self.backgroundColor = _onTintColor;
            [self layoutIfNeeded];
        }
        self.layer.borderWidth = 0;
    }else{
        
        [self removeConstraint:self.rightConstraint];
        [self addConstraint:self.leftConstraint];
        if (animated == YES) {
            [UIView animateWithDuration:0.7
                                  delay:0
                 usingSpringWithDamping:0.6
                  initialSpringVelocity:0.3
                                options:0
                             animations:^{
                                 self.backgroundColor = [UIColor whiteColor];
                                 [self layoutIfNeeded];
                                 
                             } completion:nil];
        }else{
            self.backgroundColor = [UIColor whiteColor];
            [self layoutIfNeeded];
        }
        self.layer.borderWidth = 1;
    }
    
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    
}

- (void)setUpOriginalViewAndAppearanceStyle{
    
    _thumbViewWidth = self.frame.size.height-4;
    _thumbPadding = 1;
    
    self.backgroundColor = [UIColor whiteColor];
    _onTintColor = [UIColor colorWithRed:0.30f green:0.85f blue:0.39f alpha:1.00f];
    _tintColor = [UIColor colorWithRed:0.89f green:0.89f blue:0.91f alpha:1.00f];
    _thumbTintColor = [UIColor whiteColor];
    
    _thumbView = [[UIView alloc]init];
    _thumbView.backgroundColor = [ UIColor redColor];
    // 禁止将 AutoresizingMask 转换为 Constraints
    _thumbView.translatesAutoresizingMaskIntoConstraints = NO;
    _thumbView.frame = CGRectMake(1, 1, _thumbViewWidth, _thumbViewWidth);
    _thumbView.layer.cornerRadius =_thumbViewWidth/2;
    //    _thumbView.layer.masksToBounds = YES;
    _thumbView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    _thumbView.layer.shadowOffset = CGSizeMake(1, 2);
    _thumbView.layer.shadowOpacity = 1;
    _thumbView.layer.shadowRadius = 2;
    _thumbView.layer.cornerRadius =_thumbViewWidth/2;
    _thumbView.clipsToBounds = NO;
    [self addSubview:_thumbView];
    // 添加 width 约束
 
    [_thumbView addConstraint:self.widthConstraint];
    // 添加 height 约束
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_thumbView
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:0.0
                                                                         constant:_thumbViewWidth];
    [_thumbView addConstraint:heightConstraint];
    
    // 添加 left 约束
    [self addConstraint:self.leftConstraint];
    
    // 添加 centerY 约束
    NSLayoutConstraint *centerConstraint = [NSLayoutConstraint constraintWithItem:_thumbView
                                                                        attribute:NSLayoutAttributeCenterY
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self
                                                                        attribute:NSLayoutAttributeCenterY
                                                                       multiplier:1.0
                                                                         constant:0];
    [self addConstraint:centerConstraint];
    
    [self addTarget:self action:@selector(handleTapTapGestureRecognizerEvent:) forControlEvents:UIControlEventTouchUpInside];
    
    
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapTapGestureRecognizerEvent:)];
//    [self addGestureRecognizer:tapGesture];
}

#pragma mark -- touch tracking
//- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
//    [super beginTrackingWithTouch:touch withEvent:event];
//    
//    self.widthConstraint.constant = _thumbViewWidth*1.2;
//    [UIView animateWithDuration:0.3 animations:^{
//         [_thumbView layoutIfNeeded];
//    }];
////    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseOut|UIViewAnimationOptionBeginFromCurrentState animations:^{
////       
////    } completion:^(BOOL finished) {
////    }];
//    return YES;
//}
//
//- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
//    [super continueTrackingWithTouch:touch withEvent:event];
//    
//    
//    
//    // Get touch location
//    CGPoint lastPoint = [touch locationInView:self];
//    if (lastPoint.x>self.bounds.size.width/2) {
//        [self setOn:YES animated:YES];
//    }else {
//        [self setOn:NO animated:YES];
//    }
//    
//    
//    
//    return YES;
//
//}
//
//- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
//    [super endTrackingWithTouch:touch withEvent:event];
//    BOOL previousValue = self.on;
//    
//    self.widthConstraint.constant = _thumbViewWidth;
//    [UIView animateWithDuration:0.2 animations:^{
//        [_thumbView layoutIfNeeded];
//    }];
//
//}
//
//- (void)cancelTrackingWithEvent:(UIEvent *)event {
//    [super cancelTrackingWithEvent:event];
//    
//    [self setOn:self.on animated:YES];
//}

- (void)handleTapTapGestureRecognizerEvent:(UITapGestureRecognizer *)recognizer{
    NSLog(@"好像不是每次都触摸到了%d",_on);
         [self setOn:!self.isOn animated:YES];
 }

#pragma mark -- lazy load
- (NSLayoutConstraint *)leftConstraint {
    if (!_leftConstraint) {
        _leftConstraint = [NSLayoutConstraint constraintWithItem:_thumbView
                                                       attribute:NSLayoutAttributeLeft
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:self
                                                       attribute:NSLayoutAttributeLeft
                                                      multiplier:1.0
                                                        constant:1];
    }
    return _leftConstraint;
}

- (NSLayoutConstraint *)rightConstraint {
    if (!_rightConstraint) {
        _rightConstraint = [NSLayoutConstraint constraintWithItem:_thumbView
                                                        attribute:NSLayoutAttributeRight
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeRight
                                                       multiplier:1.0
                                                         constant:-1];
    }
    return _rightConstraint;
}

- (NSLayoutConstraint *)widthConstraint {
    if (!_widthConstraint) {
        _widthConstraint = [NSLayoutConstraint constraintWithItem:_thumbView
                                                        attribute:NSLayoutAttributeWidth
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:nil
                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                       multiplier:0.0
                                                         constant:_thumbViewWidth];
    }
    return _widthConstraint;
}

@end
