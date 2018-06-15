//
//  LmMobSDK.h
//  LmMobSDK-Demo
//
//  Created by media on 2018/4/23.
//  Copyright © 2018年 Blueberry. All rights reserved.
//
/**
 *  Vungle         6.2.0
 *  unityAds       2.2.0
 *  Chartboost     7.1.2
 *  Centrixlink    2.5.4
 *  Mobvista       3.4.1
 *  Adcolony       3.3.0.0
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  服务器返回结果
 *  @param success    是否成功
 *  @param result     返回字典
 */
typedef void (^LmMobSDKServiceResultCallBack)(BOOL success, NSDictionary* _Nullable result);

//预加载的代理
@protocol LmMobSDKPreloadDelegate <NSObject>
@optional

/**
 *  1、当SDK有广告主的广告视频预加载成功时，会调用此代理。
 *  @param adver   adver  isEqualToString:  @"LmMobSDK" 才是本SDK预加载成功，且并不代表有视频可以播放了
 */
- (void) lmMobSDK:(NSString * _Nullable)adver PreloadSuccess:(NSString * _Nullable)result;

/**
 *  2、当SDK有广告主的广告视频预加载发生错误时，会调用此代理。
 *  @param adver   adver  isEqualToString:  @"LmMobSDK" 才是本SDK预加载失败
 *  @param result 回调SDK初始化失败的原因
 */
- (void) lmMobSDK:(NSString * _Nullable)adver PreloadFailed:(NSString* _Nullable)result WithError:(NSError* _Nullable) error;



/**
 *  3、SDK视频广告准备就绪回调
 */
- (void) lmMobSDKVideoLoaded:(NSString * _Nullable) result;

@end

//播放代理
@protocol LmMobSDKADDelegate <NSObject>
@optional

/**
 *  5、播放成功回调
 */
- (void) lmMobSDKShowSuccess:(NSString* _Nonnull)result;

/**
 *  6、播放失败回调
 */
- (void) lmMobSDKShowFailed:(NSString* _Nonnull)result WithError:(NSError* _Nullable)error;

/**
 *  7、完成播放回调
 */
- (void) lmMobSDKADComplete:(NSString* _Nonnull)result;

/**
 *  8、点击跳转回调
 */
- (void) lmMobSDKADClick:(NSString* _Nonnull)result;

/**
 *  9、关闭广告回调
 */
- (void) lmMobSDKADClose:(NSString* _Nonnull)result;

@end

//激励视频奖励代理
@protocol LmMobSDKADRewardDelegate <LmMobSDKADDelegate>
@optional

/**
 *  10、奖励广告条件达成回调
 */
- (void) lmMobSDKADAwardSuccess:(NSString* _Nonnull)result;

/**
 *  11、奖励广告条件未达成回调
 */
- (void) lmMobSDKADAwardFailed:(NSString* _Nonnull)result WithError:(NSError* _Nullable)error;

@end


@interface LmMobSDK : NSObject

/**
 *  初始化函数
 *  @param appkey  (联系我们获取，一个APP对应一个号)
 */
+ (void) initialize:(NSString* _Nonnull)appkey
           callback:(LmMobSDKServiceResultCallBack _Nullable)initBlock;

/**
 *  设置预加载代理
 */
+ (void) setPreloadADDelegate:(id<LmMobSDKPreloadDelegate> _Nullable) delegate;

/**
 *  设置激励视频的激励代理
 */
+ (void) setADRewardDelegate:(id<LmMobSDKADRewardDelegate> _Nullable)delegate;

/**
 *  设置调试模式
 *  @param  enableDebugMode YES为要打印SDK里面日志，NO为不需要打印SDK里面日志
 */
+ (void)setDebugMode:(BOOL)enableDebugMode;

/**
 *  获取当前的调试模式
 *  @return  YES为要打印SDK里面日志，NO为不需要打印SDK里面日志
 */
+ (BOOL)getDebugMode;

/**
 *  获取当前是否有可播放的视频广告
 *  @return  `YES`为准备好了，有视频可播。`NO`为还没有准备好
 */
+ (BOOL)isReady;

/**
 *  播放激励视频广告
 *  @param scene  场景-->预留参数,现在传空字符串@""
 *  @param  view
 *  @param delegate  播放代理
 */
+ (void)showAD: (NSString* _Nonnull)scene WithViewController:(UIViewController* _Nullable)viewController delegate:(id<LmMobSDKADDelegate> _Nullable)delegate;



/**
 *  检查SDK的版本
 *  @return 当前SDK版本号
 */
+ (NSInteger)getVersion;


/**************************   测试专用  ******************************/
+ (void)showTestView:(NSString * _Nonnull)scene WithViewController:(UIViewController* _Nullable)viewController delegate:(id<LmMobSDKADDelegate> _Nullable)delegate;

@end
