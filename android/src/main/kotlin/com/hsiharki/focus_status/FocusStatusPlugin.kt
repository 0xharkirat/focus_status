package com.hsiharki.focus_status

import android.content.Context
import android.app.NotificationManager
import android.content.Intent
import android.provider.Settings
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.StandardMethodCodec

/** FocusStatusPlugin */
class FocusStatusPlugin: FlutterPlugin, MethodCallHandler {
  private lateinit var channel: MethodChannel
  private lateinit var context: Context

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    context = binding.applicationContext
    val taskQueue = binding.binaryMessenger.makeBackgroundTaskQueue()

    channel = MethodChannel(binding.binaryMessenger, "focus_status", StandardMethodCodec.INSTANCE, taskQueue)
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else if (call.method == "getFocusStatus"){
      val focusStatus = getFocusStatus()
      result.success(focusStatus)
    } else if (call.method == "getDNDAccess"){
      val dndAccess = getDNDAccess()
      result.success(dndAccess);
    }

    else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  private fun getFocusStatus(): Int {
    val notificationManager = context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager

    // Check if the notification policy access has been granted for the app.
    // if (!notificationManager.isNotificationPolicyAccessGranted()) {
    //     val intent = Intent(android.provider.Settings.ACTION_NOTIFICATION_POLICY_ACCESS_SETTINGS)
    //     context.startActivity(intent)
    // }
    return notificationManager.importance
    return notificationManager.currentInterruptionFilter
  }

  private fun openDNDSettings() {
    val notificationManager = context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager


      val intent = Intent(Settings.ACTION_ZEN_MODE_PRIORITY_SETTINGS)
      intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
      context.startActivity(intent)


  }

  private fun getDNDAccess(): Int {
    val notificationManager = context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
    openDNDSettings()

    return notificationManager.importance
  }
}
