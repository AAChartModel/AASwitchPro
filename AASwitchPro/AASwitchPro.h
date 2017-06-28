//
//  AASwitchPro.h
//  AASwitchPro
//
//  Created by An An on 2017/6/28.
//  Copyright © 2017年 An An. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AASwitchPro : UIControl<UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIColor *onTintColor;
@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic, strong) UIColor *thumbTintColor;

@property (nonatomic, strong) NSString *onText;
@property (nonatomic, strong) NSString *offText;

@property(nonatomic,getter=isOn) BOOL on;

-(instancetype)initWithFrame:(CGRect)frame;
- (void)setOn:(BOOL)on animated:(BOOL)animated;
@end
