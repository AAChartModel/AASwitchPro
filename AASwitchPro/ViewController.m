//
//  ViewController.m
//  AASwitchPro
//
//  Created by An An on 2017/6/28.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "ViewController.h"
#import "AASwitchPro.h"
static const CGFloat _dotViewWidth = 30-2;

@interface ViewController ()<UIGestureRecognizerDelegate>
{
    AASwitchPro *aaSwitch;
    UIImageView *_imgView;
    UIView *_dotView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    _imgView = [[UIImageView alloc]init];
//    _imgView.frame = CGRectMake(0, 0, 150, 150);
//    _imgView.layer.cornerRadius = 75; //设置imageView的圆角
////    _imgView.image = [UIImage imageNamed:@"院内人员入口"];
//    _imgView.backgroundColor = [UIColor whiteColor];
//    _imgView.layer.masksToBounds = YES;
//    
//    _imgView.layer.shadowColor = [UIColor blackColor].CGColor;//设置阴影的颜色
//    
//    _imgView.layer.shadowOpacity = 0.8;//设置阴影的透明度
//    
//    _imgView.layer.shadowOffset = CGSizeMake(1, 1);//设置阴影的偏移量
//    
//    _imgView.layer.shadowRadius = 3;//设置阴影的圆角
//    
//    
//    UIView *shadowView = [[UIView alloc]initWithFrame:_imgView.frame];
//    
//    [self.view addSubview:shadowView];
//    
//    shadowView.layer.shadowColor = [UIColor blackColor].CGColor;
//    
//    shadowView.layer.shadowOffset = CGSizeMake(5, 5);
//    
//    shadowView.layer.shadowOpacity = 1;
//    
//    shadowView.layer.shadowRadius = 9.0;
//    
//    shadowView.layer.cornerRadius = 9.0;
//    
//    shadowView.clipsToBounds = NO;
//    
//    [shadowView addSubview:_imgView];
    
    _dotView = [[UIView alloc]init];
    _dotView.frame = CGRectMake(1, 1, _dotViewWidth, _dotViewWidth);
    _dotView.layer.cornerRadius =_dotViewWidth/2;
    _dotView.layer.masksToBounds = YES;
    _dotView.layer.shadowOffset = CGSizeMake(5, 5);
    _dotView.layer.shadowColor = [[UIColor grayColor] CGColor];
    _dotView.backgroundColor = [UIColor redColor];
    
    
    UIView *shadowView = [[UIView alloc]initWithFrame:_dotView.frame];
    
    [self.view addSubview:shadowView];
    
    shadowView.layer.shadowColor = [UIColor blackColor].CGColor;
    
    shadowView.layer.shadowOffset = CGSizeMake(2, 2);
    
    shadowView.layer.shadowOpacity = 1;
    
    shadowView.layer.shadowRadius = 2;
    
    shadowView.layer.cornerRadius = _dotViewWidth/2;
    
    shadowView.clipsToBounds = NO;
    
    [shadowView addSubview:_dotView];
    
    
    [self setUpView];
 }
-(void)setUpView{
  aaSwitch =[[AASwitchPro alloc]initWithFrame:CGRectMake(100, 100, 80, 30)];
     [self.view addSubview:aaSwitch];
    aaSwitch.on = YES;
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor grayColor];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(200, 200, 60, 60);
    [self.view addSubview:button];
    
    button.layer.shadowOffset = CGSizeMake(5, 5);
    button.layer.shadowColor = [[UIColor grayColor] CGColor];
    
}

-(void)buttonClicked:(UIButton *)sender{
    if (aaSwitch.on ==YES) {
        aaSwitch.on = NO;
    }else{
        aaSwitch.on = YES;
    }
}
-(void)configureTheGestureRecognizer{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGestureRecognizerEvent:)];
    [aaSwitch addGestureRecognizer:tapGesture];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGestureRecognizerEvent:)];
    [aaSwitch addGestureRecognizer:panGesture];
}

- (void)handleTapGestureRecognizerEvent:(UITapGestureRecognizer *)recognizer{
 
}
- (void)handlePanGestureRecognizerEvent:(UIPanGestureRecognizer *)recognizer{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
