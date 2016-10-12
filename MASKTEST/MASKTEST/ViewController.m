//
//  ViewController.m
//  MASKTEST
//
//  Created by 亓鑫 on 16/8/9.
//  Copyright © 2016年 亓鑫. All rights reserved.
//

#import "ViewController.h"
#import "ChatCell.h"

static NSString * const cellIdentifier = @"testCell";

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic, nonnull) UITableView *tableView;
@property (strong, nonatomic, nonnull) CAGradientLayer *maskLayer;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect rect = CGRectMake(0,
                             300,
                             self.view.frame.size.width,
                             self.view.frame.size.height-300);
    self.tableView = [[UITableView alloc] initWithFrame:rect
                                                  style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.alpha = 0.75;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[ChatCell class]
           forCellReuseIdentifier:cellIdentifier];
    [self.view addSubview:self.tableView];
    
    
    
    
    self.maskLayer = [CAGradientLayer layer];
    self.maskLayer.bounds = CGRectMake(0,
                                       0,
                                       self.tableView.frame.size.width,
                                       self.tableView.frame.size.height);
    self.maskLayer.anchorPoint = CGPointZero;
    self.tableView.layer.mask = self.maskLayer;

    //MARK: 渐变的范围主要设置这里
    /*
     //Top gradient only
    CGColorRef outerColor = [UIColor colorWithWhite:1.0 alpha:0.0].CGColor;
    CGColorRef innerColor = [UIColor colorWithWhite:1.0 alpha:1.0].CGColor;
    self.maskLayer.colors = @[(__bridge id)outerColor,
                              (__bridge id)innerColor];
    self.maskLayer.locations = @[@(0.0),@(0.15)];
     */
    
    //Top and bottom gradient
    CGColorRef outerColor = [UIColor colorWithWhite:1.0 alpha:0.0].CGColor;
    CGColorRef innerColor = [UIColor colorWithWhite:1.0 alpha:1.0].CGColor;
    self.maskLayer.colors = @[(__bridge id)outerColor,
                              (__bridge id)innerColor,
                              (__bridge id)innerColor,
                              (__bridge id)outerColor];
    self.maskLayer.locations = @[@(0.0),@(0.15),@(0.85),@(1.0)];

    
}


#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //MARK: 等高偏移蒙版,保持蒙版的视觉效果一直固定.
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    self.maskLayer.position = CGPointMake(0, scrollView.contentOffset.y);
    [CATransaction commit];
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChatCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier
                                                     forIndexPath:indexPath];
    return cell;
}



@end
