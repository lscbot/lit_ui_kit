import 'package:flutter/widgets.dart';

class LitSettingsPanelController {
  late AnimationController animationController;

  void init(TickerProvider vsync) {
    animationController = AnimationController(
        vsync: vsync,
        duration: Duration(
          milliseconds: 350,
        ));
  }

  /// Dispose this [LitSettingsPanelController].
  ///
  /// The [AnimationController] of this [LitSettingsPanelController] will be
  /// dispose to ensure no [TickerProvider] leak will occur.  Call this method
  /// on the [StatefulWidget] by overriding its dispose method.
  void dispose() {
    animationController.dispose();
  }

  void dismissSettingsPanel() {
    animationController.reverse();
  }

  void showSettingsPanel() {
    animationController.forward();
  }

  bool get isShown {
    return animationController.value == 1.0;
  }

  bool get isAnimating {
    return animationController.isAnimating;
  }

  bool get isAnimatingOrShown {
    return animationController.isAnimating || isShown;
  }
}