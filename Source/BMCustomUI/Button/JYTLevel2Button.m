//
//  JYTLevel2Button.m
//  JingYitong
//
//  Created by XHY on 15/9/21.
//  Copyright © 2015年 XHY. All rights reserved.
//

#import "JYTLevel2Button.h"
#import "BMDefine.h"

@implementation JYTLevel2Button

+ (id)buttonWithType:(UIButtonType)buttonType
{
    JYTLevel2Button *btn = [super buttonWithType:buttonType];
    [btn setTitleFontSize];
    [[NSNotificationCenter defaultCenter] addObserver:btn selector:@selector(setTitleFontSize) name:K_CHANGE_FONT_SIZE_NOTIFICATION object:nil];
    return btn;
}

- (id)init
{
    if (self = [super init]) {
        [self setTitleFontSize];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setTitleFontSize) name:K_CHANGE_FONT_SIZE_NOTIFICATION object:nil];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setTitleFontSize];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setTitleFontSize) name:K_CHANGE_FONT_SIZE_NOTIFICATION object:nil];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setTitleFontSize];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setTitleFontSize) name:K_CHANGE_FONT_SIZE_NOTIFICATION object:nil];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setTitleFontSize];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setTitleFontSize) name:K_CHANGE_FONT_SIZE_NOTIFICATION object:nil];
}

- (void)setTitleFontSize
{
    //圆角
    
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:4.0];
    
    NSString *fontSize = [[NSUserDefaults standardUserDefaults] objectForKey:K_FONT_SIZE_KEY];
    // 标准字体
    if (!fontSize || [fontSize isEqualToString:K_FONT_SIZE_NORM])
    {
        self.titleLabel.font = K_FONT_15;
    }
    else if ([fontSize isEqualToString:K_FONT_SIZE_BIG])
    {
        self.titleLabel.font = K_FONT_18;
    }
    else if ([fontSize isEqualToString:k_FONT_SIZE_EXTRALARGE])
    {
        self.titleLabel.font = K_FONT_21;
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:K_CHANGE_FONT_SIZE_NOTIFICATION object:nil];
}

@end
