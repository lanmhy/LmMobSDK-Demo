//
//  ViewController.m
//  LmMobSDK-Demo
//
//  Created by media on 2018/4/23.
//  Copyright © 2018年 Blueberry. All rights reserved.
//

#import "ViewController.h"
#import "LMMainView.h"
#import "LmMobSDK.h"

#import "LmMobTipsView.h"

@interface ViewController ()<LmMobSDKPreloadDelegate,LmMobSDKADDelegate,LmMobSDKADRewardDelegate>

@property (nonatomic,strong) LMMainView * mainView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [LmMobSDK setPreloadADDelegate:self];
    
    [LmMobSDK setADRewardDelegate:self];
    
    [self.view addSubview:self.mainView];
}


-(LMMainView *)mainView
{
    if (_mainView == nil) {
        _mainView = [LMMainView lmMainView];
        
        _mainView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        
        
        [_mainView btnClick:^(NSInteger tag) {
            
            NSLog(@"点击了 按钮 %ld",tag);
            switch (tag) {
                case 1:
                {
                    //测试环境
                   [LmMobSDK showTestView:@"" WithViewController:self delegate:self];
                    
                    
                    
                }
                    break;
                case 2:
                {
                    // 生产环境
                    if ([LmMobSDK isReady]) {
                        [LmMobSDK showAD:@"" WithViewController:self delegate:self];
                        
                    }else{
                        //视频还没准备好
                        [LmMobTipsView getSingleTipsViewWithTipsString:@"视频还没准备好" andRemindTime:1.5 andshowInView:self.mainView];
                    }
                   
                }
                    break;
                case 3:
                {
                    //测试
                    //开发者向SDK方申请获取的key
                    NSString * appkey = @"eac6500c-33a6-4d8d-afa4-def79935f9c1";//请填写实际获取的key
                    
                    //重新初始化
                    [LmMobSDK initialize:appkey callback:nil];
                    
                }
                    break;
                case 4:
                {
                   //预留按钮
                    
                }
                    break;
                    
                default:
                    break;
            }
        }];
        
    }
    
    return _mainView;
}


#pragma mark - LmMobSDKPreloadDelegate

/**
 *  1、当SDK有广告主的广告视频预加载成功时，会调用此代理。
 *  @param adver   adver  isEqualToString:  @"LmMobSDK"
 */
- (void) lmMobSDK:(NSString * _Nullable)adver PreloadSuccess:(NSString * _Nullable)result
{
    if ([adver isEqualToString:@"LmMobSDK"]) {
        NSLog(@"\nSDK预加载成功 %s:\nresult=%@",__func__,result);
    }else{
        NSLog(@"\n %s:\nresult=%@",__func__,result);
    }
    
}

/**
 *  2、当SDK有广告主的广告视频预加载发生错误时，会调用此代理。
 *  @param adver   adver  isEqualToString:  @"LmMobSDK"
 */
- (void) lmMobSDK:(NSString * _Nullable)adver PreloadFailed:(NSString* _Nullable)result WithError:(NSError* _Nullable) error
{
    if([adver isEqualToString:@"LmMobSDK"]) {
        
        NSLog(@"\nSDK预加载发生错误 %s:\nresult=%@,error:%@",__func__,result,error);
        
    }else{
        NSLog(@"\n %s:\nresult=%@,error:%@",__func__,result,error);
    }
    
}


// 视频广告就绪回调
- (void) lmMobSDKVideoLoaded:(NSString * _Nullable) result
{
    NSLog(@"\n视频广告就绪 %s:\nresult=%@",__func__,result);
    [LmMobTipsView getSingleTipsViewWithTipsString:@"视频准备好了" andRemindTime:1.5 andshowInView:self.mainView];
}


#pragma mark - LmMobSDKADDelegate

// 播放成功回调
- (void) lmMobSDKShowSuccess:(NSString* _Nonnull)result
{
    NSLog(@"\n播放成功 %s:\nresult=%@",__func__,result);
}

// 播放失败回调
- (void) lmMobSDKShowFailed:(NSString* _Nonnull)result WithError:(NSError* _Nullable)error
{
    NSLog(@"\n播放失败 %s:\nresult=%@,error:%@",__func__,result,error);
}

// 完成播放回调
- (void) lmMobSDKADComplete:(NSString* _Nonnull)result
{
    NSLog(@"\n完成播放 %s:\nresult=%@",__func__,result);
}

// 点击跳转回调
- (void) lmMobSDKADClick:(NSString* _Nonnull)result
{
    NSLog(@"\n 点击跳转 %s:\nresult=%@",__func__,result);
}

// 关闭广告回调
- (void) lmMobSDKADClose:(NSString* _Nonnull)result
{
    NSLog(@"\n关闭广告 %s:\nresult=%@",__func__,result);
}

#pragma mark - LmMobSDKADRewardDelegate

// 奖励广告条件达成回调
- (void) lmMobSDKADAwardSuccess:(NSString* _Nonnull)result
{
    NSLog(@"\n奖励广告条件达成 %s:\nresult=%@",__func__,result);
}

// 奖励广告条件未达成回调
- (void) lmMobSDKADAwardFailed:(NSString* _Nonnull)result WithError:(NSError* _Nullable)error
{
    NSLog(@"\n奖励广告条件未达成 %s:\nresult=%@,error:%@",__func__,result,error);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
