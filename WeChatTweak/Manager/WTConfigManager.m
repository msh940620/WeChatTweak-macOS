//
//  WTConfigManager.m
//  WeChatTweak
//
//  Created by Sunny Young on 21/03/2018.
//  Copyright © 2018 Sunnyyoung. All rights reserved.
//

#import "WTConfigManager.h"

static NSString * const WeChatTweakCompressedJSONEnabledKey = @"WeChatTweakCompressedJSONEnabledKey";
static NSString * const WeChatTweakVoipEnabledKey = @"WeChatTweakVoipEnabledKey";

@interface WTConfigManager()

@end

@implementation WTConfigManager

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static WTConfigManager *shared;
    dispatch_once(&onceToken, ^{
        shared = [[WTConfigManager alloc] init];
    });
    return shared;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        NSUserDefaults *userDefaults = NSUserDefaults.standardUserDefaults;
        if ([userDefaults objectForKey:WeChatTweakCompressedJSONEnabledKey]) {
            _compressedJSONEnabled = [userDefaults boolForKey:WeChatTweakCompressedJSONEnabledKey];
        } else {
            _compressedJSONEnabled = YES;
        }
        if ([userDefaults objectForKey:WeChatTweakVoipEnabledKey]) {
            _voipEnable = [userDefaults boolForKey:WeChatTweakVoipEnabledKey];
        } else {
            _voipEnable = YES;
        }
    }
    return self;
}

#pragma mark - Property method

- (void)setCompressedJSONEnabled:(BOOL)compressedJSONEnabled {
    _compressedJSONEnabled = compressedJSONEnabled;
    [NSUserDefaults.standardUserDefaults setBool:compressedJSONEnabled forKey:WeChatTweakCompressedJSONEnabledKey];
    [NSUserDefaults.standardUserDefaults synchronize];
}

- (void)setVoipEnable:(BOOL)voipEnable {
    _voipEnable = voipEnable;
    [NSUserDefaults.standardUserDefaults setBool:voipEnable forKey:WeChatTweakVoipEnabledKey];
    [NSUserDefaults.standardUserDefaults synchronize];
}

@end
