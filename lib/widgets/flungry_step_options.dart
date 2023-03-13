import 'package:flungry/helpers/colors.dart';
import 'package:flungry/helpers/utils.dart';
import 'package:flungry/models/flungrystep.dart';
import 'package:flungry/models/flungrystep.option.dart';
import 'package:flungry/providers/flungrysteps.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class FlungryStepOptions extends ConsumerWidget {

  final List<FlungryStepOption> options;
  const FlungryStepOptions({
    super.key,
    required this.options
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(options.length, (index) {

        FlungryStepOption singleOption = options.firstWhere((o) => o.index == index);
        
        return GestureDetector(
          onTap: () {
            ref.read(flungryStepsProvider.notifier).completeCurrentStep(singleOption);
          },
          child: Container(
            constraints: const BoxConstraints(minHeight: 450),
            decoration: BoxDecoration(
              color: FlungryColors.mainColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(30)
            ),
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  height: 150,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(singleOption.img),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                Container(
                  width: 200,
                  child: Text(singleOption.item, style: const TextStyle(color: Colors.white, fontSize: 30))),
                const SizedBox(height: 10),
                Text(singleOption.description, style: const TextStyle(color: FlungryColors.secondaryColor)),
                const SizedBox(height: 10),
                Text(NumberFormat.currency(symbol: '\$').format(singleOption.price),
                  style: const TextStyle(fontSize: 25, color: Colors.white)
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}