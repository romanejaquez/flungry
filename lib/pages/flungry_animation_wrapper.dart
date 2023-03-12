
import 'package:flungry/pages/flungry_position_screens.dart';
import 'package:flutter/material.dart';

class FlungryAnimationWrapper extends StatelessWidget {

  final String from;
  final Function onComplete;
  const FlungryAnimationWrapper({
    super.key,
    required this.from,
    required this.onComplete
  });

  @override
  Widget build(BuildContext context) {

    Widget widget;

    switch(from) {
      case 'left':
        widget = FlungryFromLeftScreen(onComplete: onComplete);
        break;
      case 'top':
        widget = FlungryFromTopScreen(onComplete: onComplete);
        break;
      case 'bottom':
        widget = FlungryFromBottomScreen(onComplete: onComplete);
        break;
      default:
        widget = const SizedBox.shrink();
        break;
    }
    
    return widget;
  }
}
