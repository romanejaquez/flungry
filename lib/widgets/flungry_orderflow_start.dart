import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart' as rive;

class FlungryOrderFlowStart extends ConsumerStatefulWidget {
  const FlungryOrderFlowStart({super.key});

  @override
  ConsumerState<FlungryOrderFlowStart> createState() => _FlungryOrderFlowStartState();
}

class _FlungryOrderFlowStartState extends ConsumerState<FlungryOrderFlowStart> {
  
  late rive.StateMachineController smController;
  late rive.RiveAnimation animation;
  late rive.SMIBool loading;
  late rive.SMIBool run;

  @override
  void initState() {
    super.initState();

    animation = rive.RiveAnimation.asset(
      './assets/anims/order_flow.riv',
      artboard: 'pipe_start',
      fit: BoxFit.contain,
      onInit: onRiveInit,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onRiveInit(rive.Artboard artboard) {
    
    smController = rive.StateMachineController.fromArtboard(
      artboard,
      'pipe_start'
    )!;
    artboard.addController(smController);

    run = smController.findInput<bool>('run') as rive.SMIBool;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          run.value = true;
        });
      },
      child: SizedBox(
        width: 400,
        child: animation,
      ),
    );
  }
}