import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _volumeLevel = "Unknown volume level";
  final MethodChannel _platformChannel = const MethodChannel(
    "com.example.platform_specific_code_lesson/device",
  );

  Future<void> getVolumeLevel() async {
    String volumeLevel;

    try {
      final level = await _platformChannel.invokeMethod<int>("getVolumeLevel");
      volumeLevel = "Volume level: $level";
    } on PlatformException catch (e) {
      volumeLevel = "Error while getting volume level $e";
    } catch (e) {
      log("error: $e");
      volumeLevel = "Unknown error: $e";
    }

    setState(() {
      _volumeLevel = volumeLevel;
    });
  }

  Future<void> vibrateDevice() async {
    try {
      await _platformChannel.invokeMethod("vibrateDevice");
      log("Vibrated");
    } on PlatformException catch (e) {
      log("Vibration error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Device Control")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_volumeLevel, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: getVolumeLevel,
              child: const Text("Get Volume Level"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: vibrateDevice,
              child: const Text("Vibrate Device"),
            ),
          ],
        ),
      ),
    );
  }
}
