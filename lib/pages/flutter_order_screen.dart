import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class FlungryOrderScreen extends StatefulWidget {

  final String pipeArtboard;
  final int screenIndex;
  final int secs;

  const FlungryOrderScreen({
    super.key,
    required this.screenIndex,
    required this.pipeArtboard,
    required this.secs
  });

  @override
  State<FlungryOrderScreen> createState() => _FlungryOrderScreenState();
}

class _FlungryOrderScreenState extends State<FlungryOrderScreen> {

  late StateMachineController smController;
  late RiveAnimation animation;
  late SMIBool input;
  Timer orderTimerCurrent = Timer(Duration.zero, () {});
  Timer orderTimerNext = Timer(Duration.zero, () {});
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();

    animation = RiveAnimation.asset(
      './assets/anims/order_flow.riv',
      artboard: widget.pipeArtboard,
      fit: BoxFit.contain,
      onInit: onRiveInit,
    );
  }

  @override
  void dispose() {
    orderTimerCurrent.cancel();
    orderTimerNext.cancel();
    super.dispose();
  }

  void onRiveInit(Artboard artboard) {
    
    smController = StateMachineController.fromArtboard(
      artboard,
      widget.pipeArtboard
    )!;
    artboard.addController(smController);

    input = smController.findInput<bool>('run') as SMIBool;

    setState(() {
      input.value = false;
    });

    firestore.collection('order-screens').doc('screen${widget.screenIndex}').snapshots().listen((snapshot) {
        var doc = snapshot.data() as Map<String, dynamic>;

        if (doc['animate']) {
          setState(() {
            input.value = true;
          });
        }

        orderTimerCurrent = Timer(Duration(seconds: widget.secs), () {
          setState(() {
            input.value = false;

            firestore.collection('order-screens').doc('screen${widget.screenIndex}').set({
              'animate': false
            }, SetOptions(merge: true));
          });
        });

        orderTimerNext = Timer(Duration(seconds: widget.secs - 1), () {
          if (widget.screenIndex <= 4) {
              firestore.collection('order-screens').doc('screen${widget.screenIndex + 1}').set({
                'animate': true
              }, SetOptions(merge: true));
            }
        });
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