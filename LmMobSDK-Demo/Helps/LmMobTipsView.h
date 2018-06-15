//
//  LmMobTipsView.h
//  LmMobSDK-Demo
//
//  Created by media on 2018/5/24.
//  Copyright © 2018年 Blueberry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//提示框

@interface LmMobTipsView : NSObject

@property (strong,nonatomic)UILabel *tipsLabel;

@property (strong,nonatomic)NSTimer *timer;

+(id)getSingleTipsViewWithTipsString:(NSString *)tipsString andRemindTime:(NSTimeInterval)time andshowInView:(UIView *)view1;

@end
