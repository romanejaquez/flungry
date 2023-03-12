import 'package:flungry/models/flungrystep.option.dart';

class FlungryStep {

  final String label;
  final int index;
  final bool isComplete;
  final List<FlungryStepOption> options;

  FlungryStep({
    required this.label,
    required this.index,
    required this.isComplete,
    required this.options
  });
}