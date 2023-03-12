import 'dart:async';
import 'package:flungry/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart' as rive;

class FlungryLoading extends StatefulWidget {
  const FlungryLoading({super.key});

  @override
  State<FlungryLoading> createState() => _FlungryLoadingState();
}

class _FlungryLoadingState extends State<FlungryLoading> {
  late rive.StateMachineController smController;
  late rive.RiveAnimation animation;
  late rive.SMIBool loading;
  Timer orderTimer = Timer(Duration.zero, () {});

  @override
  void initState() {
    super.initState();

    animation = rive.RiveAnimation.asset(
      './assets/anims/flungry_intro.riv',
      artboard: 'flungry_intro',
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
      'flungry_intro'
    )!;
    artboard.addController(smController);

    loading = smController.findInput<bool>('loading') as rive.SMIBool;

    setState(() {
      loading.value = true;
    });

    orderTimer = Timer(const Duration(milliseconds: 1250), () {
      setState(() {
        loading.value = false;
      });

      Timer(const Duration(seconds: 2), () {
        GoRouter.of(context).go('/landing');
      });
    });

  }
  
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    FlungryColors.mainColor,
                    FlungryColors.secondaryColor,
                  ],
                )
              ),
            ),
          ),
          Center(
            child: SizedBox(
                width: 300,
                height: 300,
                child: animation
              ),
          )
        ],
    );

  }
}