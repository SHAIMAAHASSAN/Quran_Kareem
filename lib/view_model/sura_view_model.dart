import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';

import '../model/suramodel.dart';

class SuraViewModel extends ChangeNotifier {
List<SuraModel>suar = [

  SuraModel(audio: "assets/audios/elfatiha.mp3", title: "El-Fatiha", subtitle: "Makia"),
  SuraModel(audio: "assets/audios/el7alas.mp3", title: "El-7alas", subtitle: "Makia"),
  SuraModel(audio: "assets/audios/elfalak.mp3", title: "El-Falak", subtitle: "Makia"),
  SuraModel(audio: "assets/audios/elnas.mp3", title: "El-Nas", subtitle: "Makia"),
  SuraModel(audio: "assets/audios/elkaferon.mp3", title: "El-Kaferon", subtitle: "Makia"),
  SuraModel(audio:"assets/audios/elnasr.mp3", title: "El-Nasr", subtitle: "Madania"),
  SuraModel(audio:"assets/audios/elmasd.mp3", title: "El-Masd", subtitle: "Makia"),
  SuraModel(audio: "assets/audios/qareesh.mp3", title: "Qareesh", subtitle: "Makia"),
  SuraModel(audio: "assets/audios/elma3wn.mp3", title: "El-Ma3wn", subtitle: "Makia"),
  SuraModel(audio: "assets/audios/elkawthr.mp3", title: "El-Kawthr", subtitle: "Makia"),

];

int get numSuar => suar.length;

 final audioPlayer = AssetsAudioPlayer();

int currentPlayingIndex = -1;

//SuraModel? get currentPlaying =>
//currentPlayingIndex >= 0 ? suar[currentPlayingIndex] : null;

Future<void> play(int index) async {
  if (currentPlayingIndex == index) {
    // Toggle pause
    await togglePlaying();
  } else {
    if (currentPlayingIndex >= 0) {
      suar[currentPlayingIndex].isPlaying = false;
      await audioPlayer.stop();
    }
    currentPlayingIndex = index;
    suar[currentPlayingIndex].isPlaying = true;
    audioPlayer.open(Audio(suar[currentPlayingIndex].audio));
    audioPlayer.play();
    notifyListeners();
  }
}
Future<void> togglePlaying() async {
  if (currentPlayingIndex >= 0) {
    suar[currentPlayingIndex].isPlaying = !suar[currentPlayingIndex].isPlaying;
    audioPlayer.isPlaying.listen((isPlaying) {
      suar[currentPlayingIndex].isPlaying = isPlaying;
      notifyListeners();
    });
    if (suar[currentPlayingIndex].isPlaying) {
      audioPlayer.play();
    } else {
      audioPlayer.pause();
    }
    notifyListeners();
  }
}

@override
void dispose() {
  super.dispose();
  audioPlayer.dispose();
}
  void nextSong() {
    if (currentPlayingIndex < suar.length - 1) {
      currentPlayingIndex++;
      play(currentPlayingIndex);
      notifyListeners();
    }
  }

  void previousSong() {
    if (currentPlayingIndex > 0) {
      currentPlayingIndex--;
      play(currentPlayingIndex);
      notifyListeners();
    }
  }


}


