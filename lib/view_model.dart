import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_counter/data/count_data.dart';
import 'package:riverpod_counter/logic/logic.dart';
import 'package:riverpod_counter/logic/sound_logic.dart';
import 'package:riverpod_counter/provider.dart';
import 'logic/button_animation_logic.dart';

class ViewModel {
  Logic _logic = Logic();

  SoundLogic _soundLogic = SoundLogic();
  late ButtonAnimationLogic _buttonAnimationLogicPlus;


  late WidgetRef _ref;

  void setRef(WidgetRef ref, TickerProvider tickerProvider) {
    this._ref = ref;

    _buttonAnimationLogicPlus = ButtonAnimationLogic(tickerProvider);
    _soundLogic.load();
  }

  get count => _ref.watch(countDataProvider).count.toString();

  get countUp =>
      _ref.watch(countDataProvider.select((value) => value.countUp)).toString();

  get countDown => _ref
      .watch(countDataProvider.select((value) => value.countDown))
      .toString();

  get animationPlus => _buttonAnimationLogicPlus.animationScale;

  void onIncrease() {
    _logic.increase();
    update();
  }

  void onDecrease() {
    _logic.decrease();
    update();
  }

  void onReset() {
    _logic.reset();
    update();
  }

  void update() {
    CountData oldValue = _ref.watch(countDataProvider.state).state;
    _ref.watch(countDataProvider.state).state = _logic.countData;
    CountData newValue = _ref.watch(countDataProvider.state).state;

    _soundLogic.valueChanged(oldValue, newValue);
    _buttonAnimationLogicPlus.valueChanged(oldValue, newValue);
  }
}
