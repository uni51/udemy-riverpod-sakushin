import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';

class ButtonAnimationLogic {
  late AnimationController _animationController;
  late Animation<double> _animationScale;

  get animationScale => _animationScale;

  ButtonAnimationLogic(TickerProvider tickerProvider) {
    _animationController = AnimationController(
      vsync: tickerProvider,
      duration: Duration(milliseconds: 500), // 0.5秒
    );

    _animationScale = _animationController
        .drive(CurveTween(curve: Interval(0.1, 0.7))) // どの区間でアニメーションさせるか
        .drive(Tween(begin: 1.0, end: 1.8)); // どんな感じ（スケール）で変化するか
  }

  // インスタンスが消える時に実行されるもの
  @override
  void dispose() {
    _animationController.dispose();
  }

  void start() {
    _animationController.forward().whenComplete(
          () => _animationController.reset(),
        );
  }
}
