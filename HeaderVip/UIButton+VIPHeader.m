//
//  UIButton+VIPHeader.m
//  HeaderVip
//
//  Created by 张林鹏 on 17/3/3.
//  Copyright © 2017年 mami. All rights reserved.
//

#import "UIButton+VIPHeader.h"
#import <objc/runtime.h> // 

//  这里是为了 取静态地址 ,为了下面的关联作铺垫
static void *Button_Vip = @"Button_Vip";
NSString const *Button_VipImgView = @"Button_VipImgView";

@implementation UIButton (VIPHeader)

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
    }
    return self;
}

-(void)setupViews{
    
    self.vipImagView= [UIImageView new];
    self.vipImagView.image = [UIImage imageNamed:@"icon_V"];    
    [self addSubview:self.vipImagView];
}

//把vipimageView与buton关联到一起
-(UIImageView *)vipImagView{
    return objc_getAssociatedObject(self, &Button_VipImgView);
    
}
-(void)setVipImagView:(UIImageView *)vipImagView{
    
    objc_setAssociatedObject(self, &Button_VipImgView, vipImagView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

// 把 开关 与button关联到一起
-(NSString *)shouldShowVip{
    return objc_getAssociatedObject(self, &Button_Vip);
}

-(void)setShouldShowVip:(NSString *)shouldShowVip{
    
    objc_setAssociatedObject(self, &Button_Vip, shouldShowVip, OBJC_ASSOCIATION_COPY_NONATOMIC);
    CGRect tabFrame = self.frame;
    //确定vip位置
    NSLog(@"tabFrame=== %@",NSStringFromCGRect(tabFrame));
    CGFloat x = tabFrame.size.width;
    CGFloat y = tabFrame.size.height;
    
    CGFloat cornerRadius = MIN(x, y) /2;
    self.imageView.layer.cornerRadius = cornerRadius;
    self.imageView.clipsToBounds = YES;
    //这里的位置可以根据需求自己定义
    if ([shouldShowVip isEqualToString:@"YES"]) {
        self.vipImagView.frame = CGRectMake(x - 16 - 15, y -16, 16, 16);
    }else{
        self.vipImagView.frame = CGRectZero;
    }

}


@end
