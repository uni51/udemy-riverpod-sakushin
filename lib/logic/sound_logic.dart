import 'package:audioplayers/audioplayers.dart';
import 'package:riverpod_counter/data/count_data.dart';


class SoundLogic {

  static const SOUND_DATA_UP = 'sounds/Onmtp-Flash07-1.mp3';
  static const SOUND_DATA_DOWN = 'sounds/Onmtp-Flash08-1.mp3';
  static const SOUND_DATA_RESET = 'sounds/Onmtp-Flash09-1.mp3';

  final AudioCache _cache = AudioCache(
    fixedPlayer: AudioPlayer(),
  );

  void load() {
    _cache.loadAll([SOUND_DATA_UP, SOUND_DATA_DOWN, SOUND_DATA_RESET]);
  }

  void valueChanged(CountData oldData, CountData newData) {
    if (newData.countUp == 0 && newData.countDown == 0 && newData.count == 0) {
      playResetSound();
    } else if (oldData.countUp +1 == newData.countUp) {
      playUpSound();
    } else if (oldData.countDown +1 == newData.countDown) {
      playDownSound();
    }
  }

  void playUpSound() {
    _cache.play(SOUND_DATA_UP);
  }

  void playDownSound() {
    _cache.play(SOUND_DATA_DOWN);
  }

  void playResetSound() {
    _cache.play(SOUND_DATA_RESET);
  }

}