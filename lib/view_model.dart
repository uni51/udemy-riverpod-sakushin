import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_counter/logic/logic.dart';
import 'package:riverpod_counter/logic/sound_logic.dart';
import 'package:riverpod_counter/provider.dart';

class ViewModel {
  Logic _logic = Logic();

  SoundLogic _soundLogic = SoundLogic();

  late WidgetRef _ref;

  void setRef(WidgetRef ref) {
    this._ref = ref;
    _soundLogic.load();
  }

  get count => _ref.watch(countDataProvider).count.toString();

  get countUp =>
      _ref.watch(countDataProvider.select((value) => value.countUp)).toString();

  get countDown => _ref
      .watch(countDataProvider.select((value) => value.countDown))
      .toString();

  void onIncrease() {
    _logic.increase();

    _ref.read(countDataProvider.state).state = _logic.countData;
    _soundLogic.playUpSound();
  }

  void onDecrease() {
    _logic.decrease();

    _ref.read(countDataProvider.state).state = _logic.countData;
    _soundLogic.playDownSound();
  }

  void onReset() {
    _logic.reset();

    _ref.read(countDataProvider.state).state = _logic.countData;
    _soundLogic.playResetSound();
  }
}
