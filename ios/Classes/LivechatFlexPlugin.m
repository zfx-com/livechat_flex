#import "LivechatFlexPlugin.h"
#if __has_include(<livechat_flex/livechat_flex-Swift.h>)
#import <livechat_flex/livechat_flex-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "livechat_flex-Swift.h"
#endif

@implementation LivechatFlexPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftLivechatFlexPlugin registerWithRegistrar:registrar];
}
@end
