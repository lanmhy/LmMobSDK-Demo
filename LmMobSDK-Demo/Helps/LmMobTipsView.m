//
//  LmMobTipsView.m
//  LmMobSDK-Demo
//
//  Created by media on 2018/5/24.
//  Copyright © 2018年 Blueberry. All rights reserved.
//

#import "LmMobTipsView.h"
static LmMobTipsView * _tipsView = nil;
#define YBlack        [UIColor colorWithRed:45.0/255.0 green:45.0/255.0 blue:45.0/255.0 alpha:0.8f]
#define KMainScreenSizeWidth [[UIScreen mainScreen] bounds].size.width
#define KMainScreenSizeHeight [[UIScreen mainScreen] bounds].size.height

@implementation LmMobTipsView

+(id)getSingleTipsViewWithTipsString:(NSString *)tipsString andRemindTime:(NSTimeInterval)time andshowInView:(UIView *)view1{
    
    if (tipsString == nil || [tipsString isEqualToString:@""]) {
        return nil;
    }
    CGRect rect = [tipsString boundingRectWithSize:CGSizeMake(200, 9999) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Arial" size:18]} context:nil];
    CGSize subSize =  rect.size; //[tipsString sizeWithFont:[UIFont fontWithName:@"Arial" size:18] constrainedToSize:CGSizeMake(150, 1000) lineBreakMode:NSLineBreakByWordWrapping];
    
    //    if ([LMVideoSDK getDebugMode]) {
    //        MDLog(@"rect = %@",NSStringFromCGRect(rect));
    //    }
    
    if (_tipsView == nil) {
        _tipsView = [[LmMobTipsView alloc] init];
        _tipsView.tipsLabel = [[UILabel alloc]init];
        
        _tipsView.tipsLabel.backgroundColor = YBlack;
        _tipsView.tipsLabel.textAlignment = NSTextAlignmentCenter;
        _tipsView.tipsLabel.textColor = [UIColor whiteColor];
        _tipsView.tipsLabel.font = [UIFont fontWithName:@"Arial" size:18];
        _tipsView.tipsLabel.numberOfLines = 0;
        _tipsView.tipsLabel.lineBreakMode = NSLineBreakByWordWrapping;
    }
    _tipsView.tipsLabel.font = [UIFont fontWithName:@"Arial" size:18];
    CGPoint pointA = CGPointMake( (KMainScreenSizeWidth - subSize.width - 20) / 2, (KMainScreenSizeHeight - rect.size.height - 64)/2);
    _tipsView.tipsLabel.frame = CGRectMake(pointA.x+subSize.width+40, pointA.y+subSize.height+20, 20,10);
    _tipsView.tipsLabel.layer.masksToBounds = YES;
    _tipsView.tipsLabel.layer.cornerRadius = 5;
    
    _tipsView.tipsLabel.text = tipsString;
    
    
    
    [view1 addSubview:_tipsView.tipsLabel];
    //    [target.view addSubview:tipsView.tipsLabel];
    if ( time <= 0.001) {
        time = 3;
    }
    [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        _tipsView.tipsLabel.frame = CGRectMake(pointA.x, pointA.y, subSize.width+20, subSize.height+10);
        
    } completion:nil];
    
    
    [ _tipsView.timer invalidate];
    _tipsView.timer = [NSTimer scheduledTimerWithTimeInterval:time target:_tipsView selector:@selector(doCancleTipsView:) userInfo:nil repeats:NO];
    
    
    return _tipsView;
}

-(void)doCancleTipsView:(NSTimer *)sender{
    [sender invalidate];
    [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _tipsView.tipsLabel.transform =CGAffineTransformMakeScale(0.5,0.5);
        _tipsView.tipsLabel.alpha = 0;
    } completion:^(BOOL finished) {
        [_tipsView.tipsLabel removeFromSuperview];
        _tipsView.tipsLabel.transform =CGAffineTransformMakeScale(1,1);
        _tipsView.tipsLabel.alpha = 1;
    }];
    
}


@end
