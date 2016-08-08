//
//  PSTabBarController.m
//  PSDrawerController
//
//  Created by 雷亮 on 16/8/8.
//  Copyright © 2016年 Leiliang. All rights reserved.
//

#import "PSTabBarController.h"
#import "MessageViewController.h"
#import "ContactsViewController.h"
#import "NewsViewController.h"
#import "PSDrawerManager.h"

#define Class(className) NSClassFromString(@#className)

@interface PSTabBarController () <UITabBarControllerDelegate>

@end

@implementation PSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.delegate = self;
    
    [self addChildVCWithClass:Class(MessageViewController) title:@"消息" imageName:@"tab_recent_nor"];
    [self addChildVCWithClass:Class(ContactsViewController) title:@"联系人" imageName:@"tab_buddy_nor"];
    [self addChildVCWithClass:Class(NewsViewController) title:@"动态" imageName:@"tab_qworld_nor"];
}

/** 添加自控制器
 * @param class: 控制器类
 * @param title: tabBarItem.title
 * @param imageName: tabBarItem.image
 */
- (void)addChildVCWithClass:(Class)class title:(NSString *)title imageName:(NSString *)imageName {
    UIViewController *viewController = [[class alloc] init];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    navigationController.tabBarItem.title = title;
    navigationController.tabBarItem.image = [UIImage imageNamed:imageName];
    [self addChildViewController:navigationController];
}

#pragma mark -
#pragma mark - UITabBarController protocol methods
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        
        UINavigationController *navigationController = (UINavigationController *)viewController;
        UIViewController *_viewController = navigationController.viewControllers.firstObject;
        
        // 如果选中消息页，响应拖拽手势，可以显示侧边栏
        // 否则取消手势响应，不能显示侧边栏
        if ([_viewController isKindOfClass:[MessageViewController class]]) {
            [[PSDrawerManager instance] beginDragResponse];
        } else {
            [[PSDrawerManager instance] cancelDragResponse];
        }
    }
}


@end
