import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart' as rive;

class FlungryOrderFlowEnd extends ConsumerStatefulWidget {

  final Function onEnd;
  const FlungryOrderFlowEnd({
    super.key,
    required this.onEnd  
  });

  @override
  ConsumerState<FlungryOrderFlowEnd> createState() => _FlungryOrderFlowEndState();
}

class _FlungryOrderFlowEndState extends ConsumerState<FlungryOrderFlowEnd> {
  
  late rive.StateMachineController smController;
  late rive.RiveAnimation animation;
  late rive.SMIBool loading;
  late rive.SMIBool run;
  Timer orderTimerEnd = Timer(Duration.zero, () {});
  Timer orderTimerNext = Timer(Duration.zero, () {});
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();

    animation = rive.RiveAnimation.asset(
      './assets/anims/order_flow.riv',
      artboard: 'pipe_end',
      fit: BoxFit.contain,
      onInit: onRiveInit,
    );
  }

  @override
  void dispose() {
    orderTimerEnd.cancel();
    orderTimerNext.cancel();
    super.dispose();
  }

  void onRiveInit(rive.Artboard artboard) {
    
    smController = rive.StateMachineController.fromArtboard(
      artboard,
      'pipe_end'
    )!;
    artboard.addController(smController);

    run = smController.findInput<bool>('run') as rive.SMIBool;

    firestore.collection('order-screens').doc('screen10').snapshots().listen((snapshot) {
      var doc = snapshot.data() as Map<String, dynamic>;

      if (doc['animate']) {
        setState(() {
          run.value = true;
        });
      }

      orderTimerEnd = Timer(const Duration(seconds: 1), () {
        widget.onEnd();
      });

      orderTimerNext = Timer(const Duration(seconds: 2), () {
        widget.onEnd();
        setState(() {
          run.value = false;
        });
      });
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: animation,
    );
  }
}