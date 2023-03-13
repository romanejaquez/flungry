import 'package:flungry/providers/flungrysteps.provider.dart';
import 'package:flungry/widgets/flungry_step_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FlungryStepsCurrent extends ConsumerWidget {
  const FlungryStepsCurrent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var currentStep = ref.watch(flungryStepsProvider);

    return Container(
      child: FlungryStepOptions(
        options: currentStep.options
      )
    );
  }
}