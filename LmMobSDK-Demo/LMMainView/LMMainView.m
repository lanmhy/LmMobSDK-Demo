//
//  LMMainView.m
//  YomobTest
//
//  Created by media on 2018/4/11.
//  Copyright © 2018年 Blueberry. All rights reserved.
//

#import "LMMainView.h"

@interface LMMainView ()

@property (nonatomic,copy) void (^btnBlock)(NSInteger  tag);

@end

@implementation LMMainView

+ (instancetype)lmMainView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"LMMainView" owner:nil options:nil] firstObject];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    
}


- (void)btnClick:(void (^)(NSInteger))block
{
    self.btnBlock = block;
    
    
}

- (IBAction)btnClickTag:(UIButton *)sender {
    
    [self endEditing:YES];
    
    sender.enabled = NO;
    
    NSInteger count = sender.tag - 1000;
    
    if (self.btnBlock) {
        self.btnBlock(count);
    }
    
    [self performSelector:@selector(changeButtonStatus:) withObject:sender afterDelay:1.0f];//防止重复点击
    
}

-(void)changeButtonStatus:(UIButton *)sender{
    sender.enabled = YES;
}


@end
