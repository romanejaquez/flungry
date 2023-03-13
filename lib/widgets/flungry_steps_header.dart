import 'package:flungry/helpers/colors.dart';
import 'package:flungry/models/flungrystep.dart';
import 'package:flungry/providers/flungrysteps.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FlungryStepsHeader extends ConsumerWidget {
  const FlungryStepsHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var currentStep = ref.watch(flungryStepsProvider);
    var steps = ref.watch(flungryStepsProvider.notifier).steps;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(steps.length, (index) {
    
          FlungryStep step = steps.firstWhere((s) => s.index == index);

          var stepRow = Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              step.index != 0 ? Expanded(
                child: Container(
                  height: 5,
                  decoration: BoxDecoration(
                    color: step.isComplete ? FlungryColors.secondaryColor : Colors.white,
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ) : const SizedBox.shrink(),
              Container(
                width: 20, 
                height: 20,
                margin: EdgeInsets.only(right: step.index == steps.length - 1 ? 0 : 10, left: step.index == 0 ? 0 : 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: step.isComplete ? FlungryColors.secondaryColor : Colors.white
                ),
              ),
            ],
          );

          return step.index == 0 ?
            stepRow : Expanded(
              child: stepRow,
            );
          })
      ),
    );
  }
}