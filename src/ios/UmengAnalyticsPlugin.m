#import "UmengAnalyticsPlugin.h"
#import "MobClick.h"
#import <Cordova/CDVPluginResult.h>

@implementation UmengAnalyticsPlugin

- (void)init:(CDVInvokedUrlCommand*)command
{
    NSString* appKey = [[[NSBundle mainBundle] objectForInfoDictionaryKey:@"UMENGSETTINGS"] objectForKey:@"APPKEY"];
    NSString* channel = [[[NSBundle mainBundle] objectForInfoDictionaryKey:@"UMENGSETTINGS"] objectForKey:@"CHANNEL"];

    NSString* callbackId = command.callbackId;
    [MobClick startWithAppkey:appKey reportPolicy:BATCH   channelId:channel];

    CDVPluginResult* pluginResult = nil;
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
}

@end
