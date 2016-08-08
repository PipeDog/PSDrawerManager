//
//  PSDrawerManager.h
//  PSDrawerController
//
//  Created by 雷亮 on 16/8/8.
//  Copyright © 2016年 Leiliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, PSDrawerManagerShowType) {
    PSDrawerManagerShowLeft = 0, // 动画显示
    PSDrawerManagerShowCenter = 1,
    PSDrawerManagerShowLeftWithoutAnimation = 2, // 不带有动画显示
    PSDrawerManagerShowCenterWithoutAnimation = 3,
};

// 侧边栏显示整个屏幕的宽度比
static CGFloat const kLeftWidthScale = 0.75;

@interface PSDrawerManager : NSObject

/// 单例
+ (instancetype)instance;

/** 设置中心控制器及左侧视图
 * @param centerViewController: 中心控制器
 * @param leftView: 左侧视图
 */
- (void)installCenterViewController:(UIViewController *)centerViewController leftView:(UIView *)leftView;

// 隐藏侧边阴影
- (void)hiddenShadow;

// 显示侧边阴影
- (void)showShadow;

// 开启拖拽响应
- (void)beginDragResponse;

// 取消拖拽响应
- (void)cancelDragResponse;

/** 设置显示状态
 * @param showType: 枚举类型 PSDrawerManagerShowType
 */
- (void)resetShowType:(PSDrawerManagerShowType)showType;

@property (nonatomic, weak, readonly) UIViewController *centerViewController;

@property (nonatomic, weak, readonly) UIView *leftView;


@end
