//
//  AppDelegate.m
//  MFStand
//
//  Created by wmgshu on 15/2/28.
//  Copyright (c) 2015年 michael. All rights reserved.
//

#import "AppDelegate.h"
#import "MobClick.h"
#import "YTKNetworkConfig.h"
#import "GetWebDownApi.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


-(void)mobClick{
    //初始化友盟统计
    [MobClick startWithAppkey:@"54f1930dfd98c5e56b0008f6" reportPolicy:BATCH   channelId:@"distribution"];
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    [MobClick setAppVersion:version];
}
-(void)iswebDown{
    //停机维护接口
    GetWebDownApi *webDown = [[GetWebDownApi alloc] init];
    [webDown startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        GetWebDownApi *down = (GetWebDownApi *)request;
        NSDictionary *responseDic = [down responseDic];
        NSString *codeStr=[NSString stringWithFormat:@"%@",[responseDic objectForKey:@"code"]];
        if (codeStr.intValue < 0) {
            NSDictionary *info = responseDic[@"info"];
            NSString *url = info[@"url"];
            if (url) {
                UIWebView *web = [[UIWebView alloc] initWithFrame:self.window.bounds];
                [self.window addSubview:web];
                NSURLRequest *urlReq = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
                [web loadRequest:urlReq];
            }
        }
    } failure:^(YTKBaseRequest *request) {
    }];
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self mobClick];
    
    YTKNetworkConfig * config = [YTKNetworkConfig sharedInstance];
    config.baseUrl = BaseUrl;

    [self iswebDown];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
