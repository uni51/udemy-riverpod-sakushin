import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:riverpod_counter/main.dart';
import 'package:riverpod_counter/view_model.dart';

void main() {
  testGoldens('normal', (tester) async {
    const iPhone55 = Device(name: 'iPhone 5.5', size: Size(414, 736), devicePixelRatio: 3.0);

    List<Device> devices = [iPhone55];

    ViewModel viewModel = ViewModel();

    await tester.pumpWidgetBuilder(
      ProviderScope(
        child: MyHomePage(),
      ),
    );
  });
}