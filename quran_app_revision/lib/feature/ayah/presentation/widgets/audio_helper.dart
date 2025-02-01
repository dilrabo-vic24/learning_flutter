import 'dart:developer';

import 'package:just_audio/just_audio.dart';

class AudioHelper {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  bool isAudioLoaded = false;

  Future<bool> togglePlayPause({String? audioUrl})async{
    try{
      if(isAudioLoaded){
        await loadAudio(audioUrl);
        isAudioLoaded = true;
      }
      if(audioPlayer.playing){
        await audioPlayer.pause();
        isPlaying = false;
      }else{
        await audioPlayer.play();
        isPlaying = true;
      }
      return isPlaying;
    }catch(e){
      log("Error while togging audio");
      return false;
    }

  }

  Future<void> loadAudio(String? audioUrl)async{
    try{
      await audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(audioUrl!)));
    }catch(e){
      log("Error while loading audio");
    }
  }

  void dispose(){
    audioPlayer.dispose();
  }
}