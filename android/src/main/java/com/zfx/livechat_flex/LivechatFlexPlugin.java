package com.zfx.livechat_flex;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.widget.Toast;

import androidx.annotation.NonNull;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

import com.livechatinc.inappchat.ChatWindowConfiguration;
import com.livechatinc.inappchat.ChatWindowView;
import com.livechatinc.inappchat.models.NewMessageModel;
import com.livechatinc.inappchat.ChatWindowErrorType;

/** LivechatFlexPlugin */
public class LivechatFlexPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {

  Activity activity;
  private Context mContext;
  private MethodChannel methodChannel;
  ChatWindowConfiguration config = null;
  ChatWindowView chatWindowView = null;

  public static void registerWith(Registrar registrar) {
    final LivechatFlexPlugin instance = new LivechatFlexPlugin();
    instance.onAttachedToEngine(registrar.context(), registrar.messenger());
  }

  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    onAttachedToEngine(flutterPluginBinding.getApplicationContext(), flutterPluginBinding.getBinaryMessenger());
  }

  private void onAttachedToEngine(Context applicationContext, BinaryMessenger messenger) {
    this.mContext = applicationContext;
    methodChannel = new MethodChannel(messenger, "zfx-com/livechat_flex");
    methodChannel.setMethodCallHandler(this);
  }



  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    }else if (call.method.equals("start_chat")) {
      final String license_no = call.argument("license_no");
      final String group_id = call.argument("group_id");
      final String visitor_name = call.argument("visitor_name");
      final String visitor_email = call.argument("visitor_email");

      if (license_no.trim().equalsIgnoreCase("")) {
        result.error("LICENSE_NUMBER_EMPTY", null, null);
      }else if (group_id.trim().equalsIgnoreCase("")) {
        result.error("GROUP_ID_EMPTY", null, null);
      // }else if (visitor_email.trim().equalsIgnoreCase("")) {
      //   result.error("VISITOR_EMAIL_EMPTY", null, null);
      }else{

        Intent intent = new Intent(activity, com.livechatinc.inappchat.ChatWindowActivity.class);
        Bundle config = new ChatWindowConfiguration.Builder()
                .setLicenceNumber(license_no)
                .setGroupId(group_id)
                .build()
                .asBundle();
        intent.putExtra(com.livechatinc.inappchat.ChatWindowConfiguration.KEY_VISITOR_NAME, visitor_name);
        intent.putExtra(com.livechatinc.inappchat.ChatWindowConfiguration.KEY_VISITOR_EMAIL, visitor_email);
        intent.putExtras(config);
        activity.startActivity(intent);

        result.success(null);
      }
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(FlutterPluginBinding flutterPluginBinding) {

  }

  @Override
  public void onAttachedToActivity(ActivityPluginBinding activityPluginBinding) {
    activity = activityPluginBinding.getActivity();
  }

  @Override
  public void onDetachedFromActivity() {

  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {

  }

  @Override
  public void onReattachedToActivityForConfigChanges(ActivityPluginBinding activityPluginBinding) {

  }
}
