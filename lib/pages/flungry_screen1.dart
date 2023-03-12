import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flungry/pages/flungry_animation_wrapper.dart';
import 'package:flutter/material.dart';

class FlungryScreen1 extends StatefulWidget {
  const FlungryScreen1({super.key});

  @override
  State<FlungryScreen1> createState() => _FlungryScreen1State();
}

class _FlungryScreen1State extends State<FlungryScreen1> with SingleTickerProviderStateMixin {

  late AnimationController ctrl;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();

    ctrl = AnimationController(vsync: this,
      duration: const Duration(seconds: 3)
    );
  }

  @override
  Widget build(BuildContext context) {

    DocumentReference screens = firestore.collection('order-screens').doc('screen1');

    return Scaffold(
      body: StreamBuilder(
        stream: screens.snapshots(),
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox.shrink();
          }

          var doc = snapshot.data!.data() as Map<String, dynamic>;
          if (doc['animate']) {
            var from = doc['from'];
            return FlungryAnimationWrapper(
              from: from,
              onComplete: () {
                firestore.collection('order-screens').doc('screen2').set({
                  'animate': true,
                  'from': 'left'
                });
              },  
            );            
          }

          return const SizedBox.shrink();
        }
      )
    );
  }
}
