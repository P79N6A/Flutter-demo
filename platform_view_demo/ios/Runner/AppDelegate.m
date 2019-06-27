#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import "PlatformViewPlugin.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  [PlatformViewPlugin registerWithRegistrar:[self registrarForPlugin:@"PlatformviewPlugin"]];
    
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
