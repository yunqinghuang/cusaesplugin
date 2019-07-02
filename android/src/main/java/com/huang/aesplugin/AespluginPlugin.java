package com.huang.aesplugin;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** AespluginPlugin */
public class AespluginPlugin implements MethodCallHandler {
  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "aesplugin");
    channel.setMethodCallHandler(new AespluginPlugin());
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    }
    else if(call.method.equals("aesEncode")){
      String msg = call.argument("msg");
      String password = call.argument("password");
      String test = AES.encrypt(msg,password);
      result.success(test);
    }
    else if(call.method.equals("aesDecode")){
      String msg = call.argument("msg");
      String password = call.argument("password");
      String test = AES.decrypt(msg,password);
      result.success(test);
    }
    else {
      result.notImplemented();
    }
  }
}
