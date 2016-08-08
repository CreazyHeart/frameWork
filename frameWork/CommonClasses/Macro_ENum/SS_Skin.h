//
//  SS_Skin.h
//  Voice
//
//  Created by 户善新 on 16/6/15.
//  Copyright © 2016年 户善新. All rights reserved.
//

#ifndef SS_Skin_h
#define SS_Skin_h

#import <UIKit/UIKit.h>

/***********************************************************************/

//定义随机色

#define COLOR_RANDOM [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];

//定义颜色
#define COLOR(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f]

//定义颜色, 带 alpha通道 (透明度)
#define COLOR_A(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a/1.0f]

//主题颜色
#define COLOR__Main_Theme ([UIColor colorWithRed:60/255.0  green:142/255.0 blue:229/255.0 alpha:1])
//([UIColor colorWithRed:70/255.0  green:125/255.0 blue:184/255.0 alpha:1])

//页面头部的颜色
#define COLOR_View_Header COLOR__Main_Theme //[UIColor whiteColor]

//页面布局的背景色
#define COLOR_View_Background COLOR(245,245,245)

//线框/所有边框(统一颜色)
#define COLOR_Line COLOR(229,229,229)

//正黑
#define COLOR_Black COLOR(50,50,50)

//中黑
#define COLOR_Dark COLOR(100,100,100);

//灰色
#define COLOR_Gray COLOR(150,150,150);

//浅灰色
#define COLOR_LightGray COLOR(246,246,246);
/***********************************************************************/



/***********************************************************************/
//用于加载图片时，未加载完时，临时显示的图片
#define IMAGE_BLANK [UIImage imageNamed:@"blank"]
/***********************************************************************/




#endif /* SS_Skin_h */






































