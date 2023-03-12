import 'dart:async';

import 'package:flungry/helpers/colors.dart';
import 'package:flungry/helpers/enums.dart';
import 'package:flungry/helpers/utils.dart';
import 'package:rive/rive.dart' as rive;
import 'package:flutter/material.dart';

class FlungryBurgerBuilder extends StatefulWidget {
  const FlungryBurgerBuilder({super.key});

  @override
  State<FlungryBurgerBuilder> createState() => _FlungryBurgerBuilderState();
}

class _FlungryBurgerBuilderState extends State<FlungryBurgerBuilder> {

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

    var valuesLength = 0;

    setState(() {
      mappings[0].value = true;
    });

    // orderTimer = Timer(const Duration(seconds: 2), (){
    //   setState(() {
    //     mappings[8].value = false;
    //   });
    // });

    orderTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (valuesLength == BurgerAnimation.values.length - 1) {
        timer.cancel();
      }

      setState(() {
        mappings[valuesLength].value = true;
      });

      valuesLength++;
    });
  }

  @override
  Widget build(BuildContext context) {
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
      child: animation,
    );
  }
}