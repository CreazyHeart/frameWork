//
//  BIDPopViewAnimation.m
//  BIDPopView
//
//  Created by shengchu on 16/3/30.
//  Copyright (c) 2015年 zhanghongwei. All rights reserved.
//

#import "SSPopAnimationView.h"


@interface SSPopAnimationView()


//弹出的 view
@property (nonatomic, strong) UIView *alertBg;
//弹出的 view 原始坐标
@property (nonatomic) CGRect alertBg_orginFrame;
//弹出的 样式
@property (nonatomic, strong) SSPopStyle *popStyle;


@end



@implementation SSPopAnimationView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (id)popAnimationView:(UIView*)view popStyle:(SSPopStyle*)popStyle
{
    SSPopAnimationView *popView = [[SSPopAnimationView alloc] initAnimationView:view popStyle:popStyle];
    [popView present];
    return popView;
}

- (id)initAnimationView:(UIView*)view popStyle:(SSPopStyle*)popStyle
{
    self = [super init];
    if (self)
    {
        
        CGRect fram_old = view.frame;
        NSLog(@"alertBg Rect:%@",NSStringFromCGRect(fram_old));
        self.alertBg_orginFrame = fram_old;
        
        self.alertBg = view;
        if (popStyle) {
            self.popStyle = popStyle;
        }
        else {
            self.popStyle = [[SSPopStyle alloc] init];
        }
        
    }
    return self;
}


-(void)createBackgroundView
{
    // adding some styles to background view (behind table alert)
    self.frame = [[UIScreen mainScreen] bounds];
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    self.opaque = NO;
    
    // adding it as subview of app's UIWindow
    UIWindow *appWindow = [[UIApplication sharedApplication] keyWindow];
    [appWindow addSubview:self];
    
    
    UIButton *canelBtn = [[UIButton alloc] initWithFrame:self.frame];
    canelBtn.backgroundColor = [UIColor clearColor];
    [canelBtn addTarget:self action:@selector(clickCancel) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:canelBtn];
}
- (void)removeSelf
{
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
    [self removeFromSuperview];
    
    //恢复原始位置
    self.alertBg.frame = self.alertBg_orginFrame;
}

#pragma mark - 没有动画
- (void)popNoneIn
{
    [self createBackgroundView];
    [self addSubview:self.alertBg];
    
    //计算 没有动画 弹出后的位置
    CGRect frame = [self popNoneLaterFrame];

    self.alertBg.frame = frame;
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    
}
- (void)popNoneOut
{
    [self removeSelf];
}
#pragma mark - 没有动画  显示之后的位置
- (CGRect)popNoneLaterFrame
{
    //弹出后的位置
    CGRect frame = self.alertBg.frame;
    switch (self.popStyle.alignmentType) {
        case PopAlignmentType_Center:
        {
            frame.origin.x = (self.frame.size.width-frame.size.width)/2;
            frame.origin.y = (self.frame.size.height-frame.size.height)/2;
        }
            break;
        case PopAlignmentType_HorizontallyCenter:
        {
            frame.origin.x = (self.frame.size.width-frame.size.width)/2;
            frame.origin.y = frame.origin.y;
        }
            break;
        case PopAlignmentType_VerticalCenter:
        {
            frame.origin.x = frame.origin.x;
            frame.origin.y = (self.frame.size.height-frame.size.height)/2;
        }
            break;
        case PopAlignmentType_AutoFram:
        {
            //指定显示的位置
            frame.origin = frame.origin;
        }
            break;
        default:
            break;
    }
    return frame;
}


#pragma mark - 缩放弹出，带有震动效果
- (void)transformIn
{
    [self createBackgroundView];
    [self addSubview:self.alertBg];
    
#if 1
    CGRect frame = [self transformLaterFrame];
#else
    CGRect frame = self.alertBg.frame;
    frame.origin.x = (self.frame.size.width-frame.size.width)/2;
    frame.origin.y = (self.frame.size.height-frame.size.height)/2;
#endif
    
    self.alertBg.frame = frame;
    
#if 1
    
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    self.alertBg.transform = CGAffineTransformMakeScale(0.5, 0.5);
    [UIView animateWithDuration:0.6 delay:0.0 usingSpringWithDamping:0.4 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        self.alertBg.transform = CGAffineTransformIdentity;
    } completion:nil];
    
#else
    
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    self.alertBg.transform = CGAffineTransformMakeScale(0.6, 0.6);
    [UIView animateWithDuration:0.2 animations:^{
        self.alertBg.transform = CGAffineTransformMakeScale(1.1, 1.1);
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    } completion:^(BOOL finished){
        [UIView animateWithDuration:1.0/15.0 animations:^{
            self.alertBg.transform = CGAffineTransformMakeScale(0.9, 0.9);
        } completion:^(BOOL finished){
            [UIView animateWithDuration:1.0/7.5 animations:^{
                self.alertBg.transform = CGAffineTransformMakeScale(1.0, 1.0);;
            }];
        }];
    }];
    
    
#endif
    
}
- (void)transformOut
{
    [UIView animateWithDuration:1.0/7.5 animations:^{
        self.alertBg.transform = CGAffineTransformMakeScale(0.9, 0.9);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0/15.0 animations:^{
            self.alertBg.transform = CGAffineTransformMakeScale(1.1, 1.1);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3 animations:^{
                self.alertBg.transform = CGAffineTransformMakeScale(0.01, 0.01);
                self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
            } completion:^(BOOL finished){
                self.alertBg.transform = CGAffineTransformIdentity;
                [self removeSelf];
            }];
        }];
    }];

}
#pragma mark - 缩放弹出，带有震动效果  显示之后的位置
- (CGRect)transformLaterFrame
{
    //弹出后的位置
    CGRect frame = [self popNoneLaterFrame];
    return frame;
}



#pragma mark - 视图从下面往上弹出
- (void)popFromBottomIn
{
    [self createBackgroundView];
    [self addSubview:self.alertBg];
    
    //计算 垂直方向 弹出前的位置
    CGRect frame = [self verticalPopBeforeFrame];
    //计算 垂直方向 弹出后的位置
    CGRect frame1 = [self verticalPopLaterFrame];

    self.alertBg.frame = frame;
    [UIView animateWithDuration:self.popStyle.duration animations:^{
        self.alertBg.frame = frame1;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    }];
    
}
- (void)popFromBottomOut
{
    //弹出之前的位置
    CGRect frame = self.alertBg.frame;
    frame.origin.y = self.frame.size.height;
    
    [UIView animateWithDuration:self.popStyle.duration animations:^{
        self.alertBg.frame = frame;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    } completion:^(BOOL finished) {
        [self removeSelf];
    }];
    
}

#pragma mark - 视图从上面往下弹出
- (void)popFromTopIn
{
    [self createBackgroundView];
    [self addSubview:self.alertBg];
    
    //计算 垂直方向 弹出前的位置
    CGRect frame = [self verticalPopBeforeFrame];
    //计算 垂直方向 弹出后的位置
    CGRect frame1 = [self verticalPopLaterFrame];
    self.alertBg.frame = frame;
    
    [UIView animateWithDuration:self.popStyle.duration animations:^{
        self.alertBg.frame = frame1;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    }];
    
}
- (void)popFromTopOut
{
    //弹出之前的位置
    CGRect frame = self.alertBg.frame;
    frame.origin.y = -frame.size.height;
    
    [UIView animateWithDuration:self.popStyle.duration animations:^{
        self.alertBg.frame = frame;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    } completion:^(BOOL finished) {
        [self removeSelf];
    }];
    
}

#pragma mark - 计算 垂直方向 弹出前的位置
- (CGRect)verticalPopBeforeFrame
{
    //弹出之前的位置
    CGRect frame = self.alertBg.frame;
    switch (self.popStyle.alignmentType) {
        case PopAlignmentType_Center:
        {
            frame.origin.x = (self.frame.size.width-frame.size.width)/2;
        }
            break;
        case PopAlignmentType_HorizontallyCenter:
        {
            frame.origin.x = (self.frame.size.width-frame.size.width)/2;
        }
            break;
        case PopAlignmentType_VerticalCenter:
        {
            frame.origin.x = frame.origin.x;
        }
            break;
        case PopAlignmentType_AutoFram:
        {
            //指定显示的位置
            frame.origin.x = frame.origin.x;
        }
            break;
        default:
            break;
    }
    if (self.popStyle.presentAnimation == PopAnimation_FromBottom)
    {
        frame.origin.y = self.frame.size.height;
    }
    else if (self.popStyle.presentAnimation == PopAnimation_FromTop)
    {
        frame.origin.y = -self.frame.size.height;
    }
    return frame;
}

#pragma mark - 计算 垂直方向 弹出后的位置
- (CGRect)verticalPopLaterFrame
{
    //弹出后的位置
    CGRect frame1 = self.alertBg.frame;
    switch (self.popStyle.alignmentType) {
        case PopAlignmentType_Center:
        {
            frame1.origin.x = (self.frame.size.width-frame1.size.width)/2;
            frame1.origin.y = (self.frame.size.height-frame1.size.height)/2;
        }
            break;
        case PopAlignmentType_HorizontallyCenter:
        {
            frame1.origin.x = (self.frame.size.width-frame1.size.width)/2;
            frame1.origin.y = frame1.origin.y;
        }
            break;
        case PopAlignmentType_VerticalCenter:
        {
            frame1.origin.x = frame1.origin.x;
            frame1.origin.y = (self.frame.size.height-frame1.size.height)/2;
        }
            break;
        case PopAlignmentType_AutoFram:
        {
            //指定显示的位置
            frame1.origin = frame1.origin;
        }
            break;
        default:
            break;
    }
    return frame1;
}


#pragma mark - 视图 从左 往右 弹出
- (void)popFromLeftIn
{
    [self createBackgroundView];
    [self addSubview:self.alertBg];
    
    //计算 水平方向 弹出前的位置
    CGRect frame = [self horizontallyPopBeforeFrame];
    //计算 水平方向 弹出后的位置
    CGRect frame1 = [self horizontallyPopLaterFrame];
    self.alertBg.frame = frame;
    
    [UIView animateWithDuration:self.popStyle.duration animations:^{
        self.alertBg.frame = frame1;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    }];

}
- (void)popFromLeftOut
{
    //弹出之前的位置
    CGRect frame = self.alertBg.frame;
    frame.origin.x = -frame.size.width;
    
    [UIView animateWithDuration:self.popStyle.duration animations:^{
        self.alertBg.frame = frame;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    } completion:^(BOOL finished) {
        [self removeSelf];
    }];
}
#pragma mark - 视图 从右 往左 弹出
- (void)popFromRightIn
{
    [self createBackgroundView];
    [self addSubview:self.alertBg];
    
    //计算 水平方向 弹出前的位置
    CGRect frame = [self horizontallyPopBeforeFrame];
    //计算 水平方向 弹出后的位置
    CGRect frame1 = [self horizontallyPopLaterFrame];
    self.alertBg.frame = frame;
    
    [UIView animateWithDuration:self.popStyle.duration animations:^{
        self.alertBg.frame = frame1;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    }];
    
}
- (void)popFromRightOut
{
    //弹出之前的位置
    CGRect frame = self.alertBg.frame;
    frame.origin.x = self.frame.size.width;
    
    [UIView animateWithDuration:self.popStyle.duration animations:^{
        self.alertBg.frame = frame;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    } completion:^(BOOL finished) {
        [self removeSelf];
    }];
}


#pragma mark - 计算 水平方向 弹出前 的位置
- (CGRect)horizontallyPopBeforeFrame
{
    //弹出之前的位置
    CGRect frame = self.alertBg.frame;
    switch (self.popStyle.alignmentType) {
        case PopAlignmentType_Center:
        {
            frame.origin.y = (self.frame.size.height-frame.size.height)/2;
        }
            break;
        case PopAlignmentType_HorizontallyCenter:
        {
            frame.origin.y = frame.origin.y;
        }
            break;
        case PopAlignmentType_VerticalCenter:
        {
            frame.origin.y = (self.frame.size.height-frame.size.height)/2;
        }
            break;
        case PopAlignmentType_AutoFram:
        {
            //指定显示的位置
            frame.origin.y = frame.origin.y;
        }
            break;
        default:
            break;
    }

    if (self.popStyle.presentAnimation == PopAnimation_FromLeft)
    {
        frame.origin.x = -self.frame.size.width;
    }
    else if (self.popStyle.presentAnimation == PopAnimation_FromRight)
    {
        frame.origin.x = self.frame.size.width;
    }

    return frame;
}
#pragma mark - 计算 水平方向 弹出后 的位置
- (CGRect)horizontallyPopLaterFrame
{
    //弹出后的位置
    CGRect frame = self.alertBg.frame;
    switch (self.popStyle.alignmentType) {
        case PopAlignmentType_Center:
        {
            frame.origin.x = (self.frame.size.width-frame.size.width)/2;
            frame.origin.y = (self.frame.size.height-frame.size.height)/2;
        }
            break;
        case PopAlignmentType_HorizontallyCenter:
        {
            frame.origin.x = (self.frame.size.width-frame.size.width)/2;
            frame.origin.y = frame.origin.y;
        }
            break;
        case PopAlignmentType_VerticalCenter:
        {
            frame.origin.x = frame.origin.x;
            frame.origin.y = (self.frame.size.height-frame.size.height)/2;
        }
            break;
        case PopAlignmentType_AutoFram:
        {
            //指定显示的位置
            frame.origin = frame.origin;
        }
            break;
        default:
            break;
    }

    return frame;
}

#pragma mark - 视图 淡入淡出
- (void)popCurveEaseIn
{
    [self createBackgroundView];
    [self addSubview:self.alertBg];
    
    //淡入淡出  弹出前 和 弹出后 的位置 一样
    //计算 弹出后的位置
    CGRect frame1 = [self curveEaseInOutPopLaterFrame];
    //计算 弹出前的位置
    CGRect frame = frame1;
    self.alertBg.frame = frame;
    
    
    self.alertBg.alpha = 0.2f;
    [UIView animateWithDuration:0.6f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        self.alertBg.alpha = 1.0f;
    } completion:^(BOOL finished) {
    }];
    
}
- (void)popCurveEaseOut
{
    [UIView animateWithDuration:0.6f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
        self.alertBg.alpha = 0.2f;
    } completion:^(BOOL finished) {
        [self removeSelf];
    }];
}
#pragma mark - 计算 淡入淡出 弹出后 的位置
- (CGRect)curveEaseInOutPopLaterFrame
{
    //弹出后的位置
    CGRect frame = self.alertBg.frame;
    switch (self.popStyle.alignmentType) {
        case PopAlignmentType_Center:
        {
            frame.origin.x = (self.frame.size.width-frame.size.width)/2;
            frame.origin.y = (self.frame.size.height-frame.size.height)/2;
        }
            break;
        case PopAlignmentType_HorizontallyCenter:
        {
            frame.origin.x = (self.frame.size.width-frame.size.width)/2;
            frame.origin.y = frame.origin.y;
        }
            break;
        case PopAlignmentType_VerticalCenter:
        {
            frame.origin.x = frame.origin.x;
            frame.origin.y = (self.frame.size.height-frame.size.height)/2;
        }
            break;
        case PopAlignmentType_AutoFram:
        {
            frame.origin = frame.origin;
        }
            break;
        default:
            break;
    }
    
    return frame;
}

#pragma mark - 从左向右 展开
- (void)popExpandFromLeftIn
{
    [self createBackgroundView];
    [self addSubview:self.alertBg];
    
    //计算 展开 后的位置
    CGRect frame1 = [self horizontallyPopLaterFrame];
    //计算 展开 前的位置
    CGRect frame = frame1;
    frame.size.width = 0.0f;
    
    self.alertBg.frame = frame;
    
    [self.alertBg layoutIfNeeded];
    [UIView animateWithDuration:self.popStyle.duration animations:^{
        self.alertBg.frame = frame1;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        
        [self.alertBg layoutIfNeeded];
    }];

}
- (void)popExpandFromLeftOut
{
    //展开前 的位置
    CGRect frame = self.alertBg.frame;
    frame.size.width = 0.0f;
    
    [self.alertBg layoutIfNeeded];
    [UIView animateWithDuration:self.popStyle.duration animations:^{
        self.alertBg.frame = frame;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
        
        [self.alertBg layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self removeSelf];
    }];
}

#pragma mark - 从右向左 展开
- (void)popExpandFromRightIn
{
    [self createBackgroundView];
    [self addSubview:self.alertBg];
    
    //计算 展开 后的位置
    CGRect frame1 = [self horizontallyPopLaterFrame];
    //计算 展开 前的位置
    CGRect frame = frame1;
    frame.origin.x += frame.size.width;
    frame.size.width = 0.0f;
    
    self.alertBg.frame = frame;
    
    [self.alertBg layoutIfNeeded];
    [UIView animateWithDuration:self.popStyle.duration animations:^{
        self.alertBg.frame = frame1;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        
        [self.alertBg layoutIfNeeded];
    }];
    
}
- (void)popExpandFromRightOut
{
    //展开前 的位置
    CGRect frame = self.alertBg.frame;
    frame.origin.x += frame.size.width;
    frame.size.width = 0.0f;
    
    [self.alertBg layoutIfNeeded];
    [UIView animateWithDuration:self.popStyle.duration animations:^{
        self.alertBg.frame = frame;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
        [self.alertBg layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self removeSelf];
    }];
}

#pragma mark - 从下向上 展开
- (void)popExpandFromBottomIn
{
    [self createBackgroundView];
    [self addSubview:self.alertBg];
    
    //计算 展开 后的位置
    CGRect frame1 = [self verticalPopLaterFrame];
    //计算 展开 前的位置
    CGRect frame = frame1;
    frame.origin.y += frame.size.height;
    frame.size.height = 0.0f;
    
    self.alertBg.frame = frame;
    
    [self.alertBg layoutIfNeeded];
    [UIView animateWithDuration:self.popStyle.duration animations:^{
        self.alertBg.frame = frame1;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        
        [self.alertBg layoutIfNeeded];
    }];
    
}
- (void)popExpandFromBottomOut
{
    //展开前 的位置
    CGRect frame = self.alertBg.frame;
    frame.origin.y += frame.size.height;
    frame.size.height = 0.0f;
    
    [self.alertBg layoutIfNeeded];
    [UIView animateWithDuration:self.popStyle.duration animations:^{
        self.alertBg.frame = frame;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
        
        [self.alertBg layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self removeSelf];
    }];
}

#pragma mark - 从上向下 展开
- (void)popExpandFromTopIn
{
    [self createBackgroundView];
    [self addSubview:self.alertBg];
    
    //计算 展开 后的位置
    CGRect frame1 = [self verticalPopLaterFrame];
    //计算 展开 前的位置
    CGRect frame = frame1;
    frame.size.height = 0.0f;
    
    self.alertBg.frame = frame;
    
    [self.alertBg layoutIfNeeded];
    [UIView animateWithDuration:self.popStyle.duration animations:^{
        self.alertBg.frame = frame1;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        
        [self.alertBg layoutIfNeeded];
    }];
    
}
- (void)popExpandFromTopOut
{
    //展开前 的位置
    CGRect frame = self.alertBg.frame;
    frame.size.height = 0.0f;
    
    [self layoutIfNeeded];
    [UIView animateWithDuration:self.popStyle.duration animations:^{
        self.alertBg.frame = frame;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
        
        [self.alertBg layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self removeSelf];
    }];
}


#pragma mark - 点击背景 取消
- (void)clickCancel
{
    if (!self.popStyle.isCancel) {
        return;
    }
    
    [self dismiss];
}
#pragma mark - 控制视图的弹出和隐藏
- (void)present
{
    PopAnimationType animation = self.popStyle.presentAnimation;
    if (animation == PopAnimation_Null) {
        animation = PopAnimation_None;
    }
    
    switch (animation)
    {
        case PopAnimation_Null:
        case PopAnimation_None:
        {
            [self popNoneIn];
        }
            break;
        case PopAnimation_Transform:
        {
            [self transformIn];
        }
            break;
        case PopAnimation_FromBottom:
        {
            [self popFromBottomIn];
        }
            break;
        case PopAnimation_FromTop:
        {
            [self popFromTopIn];
        }
            break;
        case PopAnimation_FromLeft:
        {
            [self popFromLeftIn];
        }
            break;
        case PopAnimation_FromRight:
        {
            [self popFromRightIn];
        }
            break;
        case PopAnimation_CurveEaseInOut:
        {
            [self popCurveEaseIn];
        }
            break;
        case PopAnimation_ExpandFromLeft:
        {
            [self popExpandFromLeftIn];
        }
            break;
        case PopAnimation_ExpandFromRight:
        {
            [self popExpandFromRightIn];
        }
            break;
        case PopAnimation_ExpandFromBottom:
        {
            [self popExpandFromBottomIn];
        }
            break;
        case PopAnimation_ExpandFromTop:
        {
            [self popExpandFromTopIn];
        }
            break;
        default:
            break;
    }
}
- (void)dismiss
{
    
    PopAnimationType animation = self.popStyle.dismissAnimation;
    if (animation == PopAnimation_Null) {
        if (self.popStyle.presentAnimation == PopAnimation_Null) {
            animation = PopAnimation_None;
        }
        else {
            animation = self.popStyle.presentAnimation;
        }
    }

    switch (animation)
    {
        case PopAnimation_Null:
        case PopAnimation_None:
        {
            [self popNoneOut];
        }
            break;
        case PopAnimation_Transform:
        {
            [self transformOut];
        }
            break;
        case PopAnimation_FromBottom:
        {
            [self popFromBottomOut];
        }
            break;
        case PopAnimation_FromTop:
        {
            [self popFromTopOut];
        }
            break;
        case PopAnimation_FromLeft:
        {
            [self popFromLeftOut];
        }
            break;
        case PopAnimation_FromRight:
        {
            [self popFromRightOut];
        }
            break;
        case PopAnimation_CurveEaseInOut:
        {
            [self popCurveEaseOut];
        }
            break;
        case PopAnimation_ExpandFromLeft:
        {
            [self popExpandFromLeftOut];
        }
            break;
        case PopAnimation_ExpandFromRight:
        {
            [self popExpandFromRightOut];
        }
            break;
        case PopAnimation_ExpandFromBottom:
        {
            [self popExpandFromBottomOut];
        }
            break;
        case PopAnimation_ExpandFromTop:
        {
            [self popExpandFromTopOut];
        }
            break;
        default:
            break;
    }
}


@end
