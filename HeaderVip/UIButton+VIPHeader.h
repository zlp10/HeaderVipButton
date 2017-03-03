//
//  UIButton+VIPHeader.h
//  HeaderVip
//
//  Created by 张林鹏 on 17/3/3.
//  Copyright © 2017年 mami. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (VIPHeader)

//因为是分类,所以这里的@property并不会生成成员变量,也不会自动生成setter与getter方法
@property(nonatomic,strong)UIImageView* vipImagView;
@property(nonatomic,copy)NSString* shouldShowVip; //控制显示 vipImageView的开关

@end
