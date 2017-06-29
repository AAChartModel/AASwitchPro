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
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpView];

 }
-(void)setUpView{
  aaSwitch =[[AASwitchPro alloc]initWithFrame:CGRectMake(100, 100, 80, 30)];
     [self.view addSubview:aaSwitch];
// [aaSwitch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor grayColor];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(200, 200, 60, 60);
    [self.view addSubview:button];
    
    button.layer.shadowOffset = CGSizeMake(5, 5);
    button.layer.shadowColor = [[UIColor grayColor] CGColor];
    
}
-(void)switchChanged:(AASwitchPro *)sender{
    if (aaSwitch.on ==YES) {
        [aaSwitch setOn:NO animated:YES];
    }else{
        [aaSwitch setOn:YES animated:YES];
        
    }
}

-(void)buttonClicked:(UIButton *)sender{
    if (aaSwitch.on ==YES) {
         [aaSwitch setOn:NO animated:YES];
    }else{
        [aaSwitch setOn:YES animated:YES];

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
