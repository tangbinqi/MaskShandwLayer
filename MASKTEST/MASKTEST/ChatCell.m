//
//  ChatCell.m
//  MASKTEST
//
//  Created by 亓鑫 on 16/8/10.
//  Copyright © 2016年 亓鑫. All rights reserved.
//

#import "ChatCell.h"

@implementation ChatCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        
        
        UIImageView *headView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"HEAD"]];
        headView.frame = CGRectMake(17, 7, 30, 30);
        [self.contentView addSubview:headView];
        
        
        UIView *chatView = [[UIView alloc] initWithFrame:CGRectMake(54, 7, 200, 30)];
        chatView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        [self.contentView addSubview:chatView];
        
        
        UILabel *chatLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 180, 30)];
        chatLabel.text = @"美女,撸一发!美女,撸一发!!!!!!";
        chatLabel.font = [UIFont systemFontOfSize:14];
        chatLabel.textColor = [UIColor whiteColor];
        [chatView addSubview:chatLabel];
    }
    return self;
}

@end
