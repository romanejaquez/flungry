import 'package:flungry/helpers/utils.dart';
import 'package:flungry/models/flungrystep.dart';
import 'package:flungry/models/flungrystep.option.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FlungryStepsNotifierProvider extends StateNotifier<FlungryStep> {

  late StateNotifierProviderRef ref;
  late List<FlungryStep> steps;

  FlungryStepsNotifierProvider(super.state, StateNotifierProviderRef stateRef) {
    ref = stateRef;
    steps = ref.read(flungryStepsListProvider);
  }

  bool canMoveToNextStep() {
    return state.index + 1 < steps.length;
  }

  bool isLastStep() {
    return state.index == steps.length - 1;
  }

  bool canMoveToPreviousStep() {
    return state.index > 0;
  }

  void moveToPreviousStep() {
    state = steps.firstWhere((s) => s.index == state.index - 1);
  }

  void completeCurrentStep(FlungryStepOption selectedOption) {
    
    var updatedOptionsList = state.options.map((o) {
      return o.copyWith(isSelected: o.index == selectedOption.index);
    }).toList();

    var updatedSteps = steps.where((s) => s != state).toList();

    var currentStep = FlungryStep(
      label: state.label,
      index: state.index,
      isComplete: true,
      options: updatedOptionsList
    );

    steps = [...updatedSteps, currentStep];
    state = currentStep;
  }

  void moveToNextStep() {
    state = steps.firstWhere((s) => s.index == state.index + 1);
  }
}

final flungryStepsProvider = StateNotifierProvider<FlungryStepsNotifierProvider, FlungryStep>((ref) {
  var firstStep = ref.read(flungryStepsListProvider);
  return FlungryStepsNotifierProvider(firstStep[0], ref);
});

final flungryStepsListProvider = Provider((ref) {
  var steps = Utils.getDefaultSteps();
  return steps;
});