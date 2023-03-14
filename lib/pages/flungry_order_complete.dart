import 'dart:async';

import 'package:flungry/helpers/colors.dart';
import 'package:flungry/helpers/enums.dart';
import 'package:flungry/widgets/flungry_orderflow_start.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart' as rive;

class FlungryOrderComplete extends ConsumerStatefulWidget {
  const FlungryOrderComplete({super.key});

  @override
  ConsumerState<FlungryOrderComplete> createState() => _FlungryOrderCompleteState();
}

class _FlungryOrderCompleteState extends ConsumerState<FlungryOrderComplete> {
  
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

    setState(() {
      
    });
  }
  
  @override
  Widget build(BuildContext context) {
    if (mappings.isNotEmpty) {
      setState(() {
          mappings[BurgerAnimation.complete.index].value = true;
       });

      orderTimer = Timer(const Duration(seconds: 1), () {
        setState(() {
          mappings[BurgerAnimation.completeidle.index].value = true;
        });
      });
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    FlungryColors.mainColor,
                    FlungryColors.secondaryColor
                  ],
                )
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: FlungryOrderFlowStart(),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(30),
              width: 500,
              child: Transform.scale(
                scale: 1.25,
                origin: Offset.zero,
                child: animation),
            ),
          ),
        ],
      )
    );
  }
}