#import "Flutter3dAmapPlugin.h"
#import "AMapFoundationKit/AMapFoundationKit.h"
#import "FlutterAMap3D.h"

@implementation Flutter3dAmapPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"plugins.weilu/flutter_3d_amap_"
            binaryMessenger:[registrar messenger]];
  Flutter3dAmapPlugin* instance = [[Flutter3dAmapPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];

  FlutterAMap3DFactory* aMap3DFactory =
  [[FlutterAMap3DFactory alloc] initWithMessenger:registrar.messenger];
  [registrar registerViewFactory:aMap3DFactory withId:@"plugins.weilu/flutter_3d_amap"];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"setKey" isEqualToString:call.method]) {
    NSString *key = call.arguments;
    [AMapServices sharedServices].enableHTTPS = YES;
    // 配置高德地图的key
    [AMapServices sharedServices].apiKey = key;
    result(@YES);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
