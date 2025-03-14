package com.example.platform_specific_code_lesson

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.content.Context
import android.media.AudioManager
import android.os.Build
import android.os.VibrationEffect
import android.os.Vibrator
import android.os.VibratorManager
import androidx.annotation.NonNull

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.platform_specific_code_lesson/device"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "getVolumeLevel" -> result.success(getVolumeLevel())
                "vibrateDevice" -> {
                    vibrateDevice()
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun getVolumeLevel(): Int {
        val audioManager = getSystemService(Context.AUDIO_SERVICE) as AudioManager
        return (audioManager.getStreamVolume(AudioManager.STREAM_MUSIC) * 100) /
               audioManager.getStreamMaxVolume(AudioManager.STREAM_MUSIC)
    }

    private fun vibrateDevice() {
      if (checkSelfPermission(android.Manifest.permission.VIBRATE) != android.content.pm.PackageManager.PERMISSION_GRANTED) {
          return
      }
  
      val vibrator: Vibrator = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
          val vibratorManager = getSystemService(Context.VIBRATOR_MANAGER_SERVICE) as VibratorManager
          vibratorManager.defaultVibrator
      } else {
          @Suppress("DEPRECATION")
          getSystemService(Context.VIBRATOR_SERVICE) as Vibrator
      }
  
      if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
          vibrator.vibrate(VibrationEffect.createOneShot(500, VibrationEffect.DEFAULT_AMPLITUDE))
      } else {
          @Suppress("DEPRECATION")
          vibrator.vibrate(500)
      }
  }
  
}
