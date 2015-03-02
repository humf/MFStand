//
//  GetWebDownApi.m
//  MFStand
//
//  Created by wmgshu on 15/3/2.
//  Copyright (c) 2015年 michael. All rights reserved.
//

#import "GetWebDownApi.h"

@implementation GetWebDownApi
-(id)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(NSString *)requestUrl {
    return @"/newTui/web_fc/";
}

-(id)requestArgument{
    return @{@"soure":@"123456789"};
}

//- (id)jsonValidator {
//    return @{
//             @"info": @{
//                 @"url": [NSString class],
//                 @"url1": [NSString class],
//                 @"url2": [NSString class],
//                 @"url3": [NSString class]
//             },
//             @"result": [NSString class],
//             @"code": [NSString class]
//             };
//}

-(NSDictionary *)responseDic{
//    return [self responseJSONObject];
    NSString *responseString = [self responseString];
    NSData *data = [responseString dataUsingEncoding:NSUTF16StringEncoding];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    return dic;
}
@end
