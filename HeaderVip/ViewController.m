//
//  ViewController.m
//  HeaderVip
//
//  Created by 张林鹏 on 17/3/3.
//  Copyright © 2017年 mami. All rights reserved.
//

#import "ViewController.h"

#import "UIButton+VIPHeader.h"

@interface ViewController ()
{
    UIButton* _button;
    BOOL _isShow;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _button = [UIButton new];
    _button.frame = CGRectMake(20, 20, 100,100);
    _button.center = self.view.center;
    _button.backgroundColor = [UIColor greenColor];
    [_button setImage:[UIImage imageNamed:@"1.jpg"] forState:UIControlStateNormal];
    
    [_button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    _button.shouldShowVip = @"YES";

    
}

-(void)buttonClicked:(UIButton* )btn{
    _isShow = !_isShow;
    if (_isShow) {
        _button.shouldShowVip = @"NO";
    }else{
        _button.shouldShowVip = @"YES";
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
