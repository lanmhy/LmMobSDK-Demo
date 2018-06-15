//
//  LMMainView.h
//  YomobTest
//
//  Created by media on 2018/4/11.
//  Copyright © 2018年 Blueberry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMMainView : UIView

+ (instancetype)lmMainView;

- (void)btnClick:(void(^)(NSInteger tag))block;//tag 1、2、3、4

@end
