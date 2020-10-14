import Flutter
import UIKit
import LiveChat

public class SwiftLivechatFlexPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "zfx-com/livechat_flex", binaryMessenger: registrar.messenger())
    let instance = SwiftLivechatFlexPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {

    switch call.method {
        case "getPlatformVersion":
            result("iOS " + UIDevice.current.systemVersion)
        case "start_chat":
            let arguments = call.arguments as! [String:Any]

            let licenseId = (arguments["license_no"] as? String)
            let groupId = (arguments["group_id"] as? String)
            let name = (arguments["visitor_name"] as? String)
            let email = (arguments["visitor_email"] as? String)

            if (licenseId == ""){
                result(FlutterError(code: "", message: "LICENSE_NUMBER_EMPTY", details: nil))
            }else if (groupId == ""){
                result(FlutterError(code: "", message: "GROUP_ID_EMPTY", details: nil))
            // }else if (name == ""){
            //      result(FlutterError(code: "", message: "VISITOR_EMAIL_EMPTY", details: nil))
            }else{
                LiveChat.licenseId = licenseId // Set your licence number here
                LiveChat.groupId = groupId // Optionally, you can set specific group
                LiveChat.name = name // User name and email can be provided if known
                LiveChat.email = email

                LiveChat.presentChat()
                result(nil)
            }
        default:
            result(FlutterMethodNotImplemented)
    }

  }
}
