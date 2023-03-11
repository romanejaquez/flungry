import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flungry/flungry_animation_wrapper.dart';
import 'package:flutter/material.dart';

class FlungryScreen3 extends StatefulWidget {
  const FlungryScreen3({super.key});

  @override
  State<FlungryScreen3> createState() => _FlungryScreen3State();
}

class _FlungryScreen3State extends State<FlungryScreen3> with SingleTickerProviderStateMixin {

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

    DocumentReference screens = firestore.collection('order-screens').doc('screen3');

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
              onComplete: () async {
                var batch = firestore.batch();
                var s1Ref = firestore.collection('order-screens').doc('screen1');
                batch.set(s1Ref, { 'animate': false, 'from': 'left'});
                var s2Ref = firestore.collection('order-screens').doc('screen2');
                batch.set(s2Ref, { 'animate': false, 'from': 'left'});
                var s3Ref = firestore.collection('order-screens').doc('screen3');
                batch.set(s3Ref, { 'animate': false, 'from': 'left'});

                await batch.commit();
              },  
            );            
          }

          return const SizedBox.shrink();
        }
      )
    );
  }
}
