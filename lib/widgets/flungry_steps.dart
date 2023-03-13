import 'package:flungry/providers/flungrysteps.provider.dart';
import 'package:flungry/widgets/flungry_steps_current.dart';
import 'package:flungry/widgets/flungry_steps_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FlungrySteps extends StatelessWidget {
  const FlungrySteps({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FlungryStepsHeader(),
        Expanded(
          child: FlungryStepsCurrent(),
        )
      ],
    );
  }
}