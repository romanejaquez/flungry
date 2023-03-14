import 'package:flungry/helpers/colors.dart';
import 'package:flungry/widgets/flungry_burger_builder.dart';
import 'package:flungry/widgets/flungry_header.dart';
import 'package:flungry/widgets/flungry_steps.dart';
import 'package:flungry/widgets/flungry_steps_footer.dart';
import 'package:flutter/material.dart';

class FlungryLandingPage extends StatefulWidget {
  const FlungryLandingPage({super.key});

  @override
  State<FlungryLandingPage> createState() => _FlungryLandingPageState();
}

class _FlungryLandingPageState extends State<FlungryLandingPage> {

  
  
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
          Column(
            children: [
              const FlungryHeader(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 50),
                  child: Row(
                    children: [
                      const FlungryBurgerBuilder(),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: FlungryColors.mainLightColor
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: const [
                              Expanded(
                                child: FlungrySteps(),
                              ),
                              FlungryStepsFooter()
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    //FirebaseFirestore firestore = FirebaseFirestore.instance;

    // return Scaffold(
    //   body: Center(
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Text('Landing page!'),
    //         TextButton(onPressed: () {
    //             firestore.collection('order-screens').doc('screen1').set({
    //               'animate': true,
    //               'from': 'left'
    //             });
    //         }, child: Text('Start Animations!'))
    //       ],
    //     ),
    //   )
    // );
  }
}