import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_counter/logic.dart';
import 'package:riverpod_counter/provider.dart';

class ViewModel {

  Logic _logic = Logic();
  late WidgetRef _ref;

  void setRef(WidgetRef ref) {
    this._ref = ref;
  }

  get count => _ref.watch(countDataProvider).count.toString();
  get countUp => _ref.watch(countDataProvider.select((value) => value.countUp)).toString();
  get countDown => _ref.watch(countDataProvider.select((value) => value.countDown)).toString();
}