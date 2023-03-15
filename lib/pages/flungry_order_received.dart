import 'dart:math';

import 'package:flungry/helpers/colors.dart';
import 'package:flungry/helpers/flungry_icons.dart';
import 'package:flungry/widgets/flungry_orderflow_end.dart';
import 'package:flungry/widgets/order_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FlungryOrderReceived extends ConsumerStatefulWidget {
  const FlungryOrderReceived({super.key});

  @override
  ConsumerState<FlungryOrderReceived> createState() => _FlungryOrderReceivedState();
}

class _FlungryOrderReceivedState extends ConsumerState<FlungryOrderReceived> with SingleTickerProviderStateMixin {

  late AnimationController ctrl;
  List<int> randomTickets = [];

  @override
  void initState() {
    super.initState();

    ctrl = AnimationController(vsync: this,
      duration: const Duration(seconds: 1)
    );

    int randomTicket1 = Random().nextInt(6000) + 5000;
    int randomTicket2 = Random().nextInt(6000) + 5000;
    randomTickets.add(randomTicket1);
    randomTickets.add(randomTicket2);
  }

  @override
  Widget build(BuildContext context) {
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
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(80),
              child: Icon(Flungry.flungry_burger, 
                color: Colors.white.withOpacity(0.25),
                size: 150
              ),
            ),
          ),
          Center(
            child: Row(
              children: [
                FlungryOrderFlowEnd(onEnd: () {
                  setState(() {
                    ctrl.forward();
                  });
                }),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('NOW SERVING', 
                              style: TextStyle(
                                fontFamily: 'Product Sans', 
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 40
                              )
                            ),
                            Icon(Flungry.flungry_text, size: 60, color: Colors.white.withOpacity(0.5)),
                            const SizedBox(width: 0)
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white.withOpacity(0.5)
                          ),
                          padding: const EdgeInsets.all(30),
                          margin: const EdgeInsets.only(right: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(randomTickets.length, (index) {
                              
                              return OrderBadge(
                                orderNumber: randomTickets[index]
                              );
                            })
                          )
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 30),
                            const Text('JUST ARRIVED', 
                              style: TextStyle(
                                fontFamily: 'Product Sans', 
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 40
                              )
                            ),
                            const SizedBox(height: 30),
                            SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0, 1),
                                end: const Offset(0, 0)
                              ).animate(CurvedAnimation(parent: ctrl, curve: Curves.easeInOut)),
                              child: FadeTransition(
                                opacity: Tween<double>(
                                  begin: 0, end: 1
                                ).animate(CurvedAnimation(parent: ctrl, curve: Curves.easeInOut)),
                                child: Container(
                                  margin: const EdgeInsets.only(left: 30),
                                  child: const OrderBadge(
                                    orderNumber: 4567
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ]
      )
    );
  }
}