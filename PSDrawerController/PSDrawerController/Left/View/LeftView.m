//
//  LeftView.m
//  PSDrawerController
//
//  Created by 雷亮 on 16/8/8.
//  Copyright © 2016年 Leiliang. All rights reserved.
//

#import "LeftView.h"
#import "PSDrawerManager.h"
#import "UIView+leoAdd.h"

static NSString *const reUse = @"reUse";

#define kBackgroundColor [UIColor colorWithRed:13.f / 255.f green:184.f / 255.f blue:246.f / 255.f alpha:1]

@interface LeftView () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray <NSArray *>*dataArray;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation LeftView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kBackgroundColor;
        
        self.dataArray = @[@[[UIImage imageNamed:@"sidebar_business"], @"我的商城"],
                           @[[UIImage imageNamed:@"sidebar_purse"], @"QQ钱包"],
                           @[[UIImage imageNamed:@"sidebar_decoration"], @"个性装扮"],
                           @[[UIImage imageNamed:@"sidebar_favorit"], @"我的收藏"],
                           @[[UIImage imageNamed:@"sidebar_album"], @"我的相册"],
                           @[[UIImage imageNamed:@"sidebar_file"], @"我的文件"]];
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [self addSubview:_tableView];
        
        _tableView.tableHeaderView = self.imageView;
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return self;
}

#pragma mark -
#pragma mark - tableView procotol methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reUse];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reUse];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.textColor = [UIColor whiteColor];
        
        UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.width, 44)];
        selectedBackgroundView.backgroundColor = [UIColor whiteColor];
        cell.selectedBackgroundView = selectedBackgroundView;
    }
    cell.imageView.image = self.dataArray[indexPath.row][0];
    cell.textLabel.text = self.dataArray[indexPath.row][1];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 显示中间控制器
    [[PSDrawerManager instance] resetShowType:PSDrawerManagerShowCenter];
}

#pragma mark -
#pragma mark - headerView
- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width, 280)];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.image = [UIImage imageNamed:@"sidebar_bg"];
        _imageView.clipsToBounds = YES;
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header"]];
        imageView.size = CGSizeMake(60, 60);
        imageView.left = 25;
        imageView.top = 64;
        imageView.clipsToBounds = YES;
        imageView.layer.cornerRadius = imageView.width / 2;
        imageView.layer.borderColor = [UIColor whiteColor].CGColor;
        imageView.layer.borderWidth = 2.f;
        [_imageView addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(imageView.right + 30, imageView.top + 10, 100, 20)];
        label.textColor = [UIColor darkGrayColor];
        label.font = [UIFont boldSystemFontOfSize:20];
        label.text = @"leiliang";
        [_imageView addSubview:label];
    }
    return _imageView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
