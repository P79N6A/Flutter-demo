//
//  PlatformViewPlugin.m
//  Runner
//
//  Created by qxy on 2019/3/17.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "PlatformViewPlugin.h"

@interface PlatformViewController : NSObject<FlutterPlatformView>

@property (strong) UIView *platformView;

- (instancetype)initWithFrame:(CGRect)frame
               viewIdentifier:(int64_t)viewId
                    arguments:(id _Nullable)args;

@end

@implementation PlatformViewController

- (instancetype)initWithFrame:(CGRect)frame
               viewIdentifier:(int64_t)viewId
                    arguments:(id _Nullable)args
{
    if (self = [super init]) {
        self.platformView = [[UIView alloc] init];
        self.platformView.backgroundColor = [UIColor yellowColor];
    }
    
    return self;
}

- (UIView *)view
{
    return self.platformView;
}

@end

@interface PlatformViewFactory : NSObject<FlutterPlatformViewFactory>

- (instancetype)initWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar;

@end

@implementation PlatformViewFactory

- (instancetype)initWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar
{
    if (self = [super init]) {
    }
    
    return self;
}

- (NSObject<FlutterMessageCodec>*)createArgsCodec
{
    return [FlutterStandardMessageCodec sharedInstance];
}

- (NSObject<FlutterPlatformView>*)createWithFrame:(CGRect)frame
                                   viewIdentifier:(int64_t)viewId
                                        arguments:(id _Nullable)args
{
    return [[PlatformViewController alloc] initWithFrame:frame
                                          viewIdentifier:viewId
                                               arguments:args];
}

@end


@implementation PlatformViewPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar
{
    [registrar registerViewFactory:[[PlatformViewFactory alloc] initWithRegistrar:registrar] withId:@"platform_view"];
}

@end

