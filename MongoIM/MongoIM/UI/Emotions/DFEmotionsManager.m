//
//  DFPluginsManager.m
//  DFWeChatView
//
//  Created by Allen Zhong on 15/4/19.
//  Copyright (c) 2015年 Datafans, Inc. All rights reserved.
//

#import "DFEmotionsManager.h"

@interface DFEmotionsManager()


@property (strong, nonatomic) NSMutableArray *emotions;

@property (strong, nonatomic) MLExpression *expression;

@end


@implementation DFEmotionsManager

static  DFEmotionsManager *_manager=nil;


#pragma mark - Lifecycle

+(instancetype) sharedInstance
{
    @synchronized(self){
        if (_manager == nil) {
            _manager = [[DFEmotionsManager alloc] init];
        }
    }
    return _manager;
}




- (instancetype)init
{
    self = [super init];
    if (self) {
        _emotions = [NSMutableArray array];
    }
    return self;
}





#pragma mark - Method


-(MLExpression *)sharedMLExpression
{
    if (_expression == nil) {
        _expression = [MLExpression expressionWithRegex:@"\\[[a-zA-Z0-9\\u4e00-\\u9fa5]+\\]" plistName:@"Expression" bundleName:@"ClippedExpression"];
    }
    
    return _expression;
}



-(void) addEmotion:(DFBaseEmotion *) emotion
{
    [_emotions addObject:emotion];
}

-(NSMutableArray *) getEmotions
{
    return _emotions;
}


@end
