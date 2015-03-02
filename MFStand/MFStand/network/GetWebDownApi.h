//
//  GetWebDownApi.h
//  MFStand
//
//  Created by wmgshu on 15/3/2.
//  Copyright (c) 2015年 michael. All rights reserved.
//
/**
 停机维护接口  /newTui/web_fc/
 需传入参数 soure 123456789
 返回一个字典
 */
#import "YTKRequest.h"

@interface GetWebDownApi : YTKRequest
-(id)init;
-(NSDictionary *)responseDic;
@end
