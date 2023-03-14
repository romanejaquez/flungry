import 'package:flungry/helpers/colors.dart';
import 'package:flungry/helpers/flungry_icons.dart';
import 'package:flungry/providers/flungrysteps.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FlungryStepsFooter extends ConsumerWidget {
  const FlungryStepsFooter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var currentStep = ref.watch(flungryStepsProvider);
    var flungrySteps = ref.read(flungryStepsProvider.notifier);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: FlungryColors.mainColor
          ),
          onPressed: flungrySteps.canMoveToPreviousStep() ? () {
            flungrySteps.moveToPreviousStep();
          } : null, 
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Flungry.prev, color: Colors.white, size: 30),
                SizedBox(width: 10),
                Text('Previous', style: TextStyle(fontSize: 30))
              ],
            ),
          )
        ),
        
        flungrySteps.isLastStep() ?

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: FlungryColors.mainColor
          ),
          onPressed: () {
            GoRouter.of(context).go('/order-complete');
          }, 
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Flungry.flungry_burger, color: Colors.white, size: 30),
                SizedBox(width: 10),
                Text('Place Order', style: TextStyle(fontSize: 30))
              ].reversed.toList(),
            ),
          )
        )

        :

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: FlungryColors.mainColor
          ),
          onPressed: currentStep.isComplete && flungrySteps.canMoveToNextStep() ? () {
            flungrySteps.moveToNextStep();
          } : null, 
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Flungry.next, color: Colors.white, size: 30),
                SizedBox(width: 10),
                Text('Next', style: TextStyle(fontSize: 30))
              ].reversed.toList(),
            ),
          )
        ),
      ],
    );
  }
}