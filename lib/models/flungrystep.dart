import 'package:flungry/models/flungrystep.option.dart';

class FlungryStep {
  final String label;
  final int index;
  final bool isComplete;
  final List<FlungryStepOption> options;

  const FlungryStep({
    required this.label,
    required this.index,
    required this.isComplete,
    required this.options
  });

  FlungryStep copyWith({ 
    String? label, 
    int? index, 
    bool? isComplete, 
    List<FlungryStepOption>? options
  }) {
    return FlungryStep(
      label: label ?? this.label,
      index: index ?? this.index,
      isComplete: isComplete ?? this.isComplete,
      options: options ?? this.options
    );
  }
}