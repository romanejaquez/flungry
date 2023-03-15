import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class FlungryOrderFlowUp extends StatefulWidget {
  const FlungryOrderFlowUp({super.key});

  @override
  State<FlungryOrderFlowUp> createState() => _FlungryOrderFlowUpState();
}

class _FlungryOrderFlowUpState extends State<FlungryOrderFlowUp> {

  late StateMachineController smController;
  late RiveAnimation animation;
  late SMIBool input;
  Timer orderTimer = Timer(Duration.zero, () {});
  FirebaseFirestore firestore = FirebaseFirestore.instance;


  @override
  void initState() {
    super.initState();

    animation = RiveAnimation.asset(
      './assets/anims/order_flow.riv',
      artboard: 'pipe_down_right',
      fit: BoxFit.contain,
      onInit: onRiveInit,
    );

    firestore.collection('order-screens').doc('screen1').snapshots().listen((snapshot) {
        var doc = snapshot.data() as Map<String, dynamic>;

        if (doc['animate']) {
          setState(() {
            input.value = !input.value;
          });
        }
    });
  }

  @override
  void dispose() {
    orderTimer.cancel();
    super.dispose();
  }

  void onRiveInit(Artboard artboard) {
    
    smController = StateMachineController.fromArtboard(
      artboard,
      'pipe_down_right'
    )!;
    artboard.addController(smController);

    input = smController.findInput<bool>('run') as SMIBool;

    setState(() {
      input.value = false;
    });

  }
  
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container(
            child: animation,
          )
        ],
    );

  }
}