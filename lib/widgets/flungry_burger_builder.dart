import 'dart:async';
import 'package:flungry/helpers/colors.dart';
import 'package:flungry/helpers/enums.dart';
import 'package:flungry/providers/flungrysteps.provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart' as rive;
import 'package:flutter/material.dart';

class FlungryBurgerBuilder extends ConsumerStatefulWidget {
  const FlungryBurgerBuilder({super.key});

  @override
  ConsumerState<FlungryBurgerBuilder> createState() => _FlungryBurgerBuilderState();
}

class _FlungryBurgerBuilderState extends ConsumerState<FlungryBurgerBuilder> {

  late rive.StateMachineController smController;
  late rive.RiveAnimation animation;
  late rive.SMIBool loading;
  List<rive.SMIBool> mappings = [];

  Timer orderTimer = Timer(Duration.zero, () {});

  @override
  void initState() {
    super.initState();

    animation = rive.RiveAnimation.asset(
      './assets/anims/burger_anim.riv',
      artboard: 'burger_anim',
      fit: BoxFit.contain,
      onInit: onRiveInit,
    );
  }

  @override
  void dispose() {
    orderTimer.cancel();
    super.dispose();
  }

  void onRiveInit(rive.Artboard artboard) {
    
    smController = rive.StateMachineController.fromArtboard(
      artboard,
      'burger_sm'
    )!;
    artboard.addController(smController);

    for(var anim in BurgerAnimation.values) {
      mappings.add(smController.findInput<bool>(anim.name) as rive.SMIBool);
      mappings[anim.index].value = false;
    }
  }

  @override
  Widget build(BuildContext context) {

    final flungryStep = ref.watch(flungryStepsProvider);
    final isLastStep = ref.read(flungryStepsProvider.notifier).isLastStep();

    if (mappings.isNotEmpty) {
      if (flungryStep.isComplete) {
        mappings[flungryStep.index].value = true;
      }

      if (flungryStep.isComplete && isLastStep) {
        orderTimer = Timer(const Duration(seconds: 1), () {
          mappings[BurgerAnimation.closebun.index].value = true;
        });

        orderTimer = Timer(const Duration(seconds: 2), () {
          mappings[BurgerAnimation.finalanim.index].value = true;
        });
      }
    }

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(30),
      width: 500,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            blurRadius: 20,
            color: FlungryColors.mainColor,
            spreadRadius: -20,
            offset: Offset.zero
          )
        ],
        borderRadius: BorderRadius.circular(25),
        color: FlungryColors.tertiaryColor
      ),
      child: Transform.scale(
        scale: 1.25,
        origin: Offset.zero,
        child: animation),
    );
  }
}