import 'package:flutter/material.dart';

void main() {
  runApp(const FluffyApp());
}

class FluffyApp extends StatelessWidget {
  const FluffyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FluffyAppHome()
    );
  }
}


class FluffyAppHome extends StatefulWidget {
  const FluffyAppHome({Key? key}) : super(key: key);

  @override
  State<FluffyAppHome> createState() => _FluffyAppHomeState();
}

class _FluffyAppHomeState extends State<FluffyAppHome> with SingleTickerProviderStateMixin {

  late AnimationController ctrl;

  @override
  void initState() {
    super.initState();

    ctrl = AnimationController(vsync: this,
      duration: const Duration(seconds: 3)
    )..forward();
  }

  @override
  Widget build(BuildContext context) {

    double squareDim = 100;

    double normalizedDim = (MediaQuery.of(context).size.width / squareDim);
    double xPos = normalizedDim / 2; // - ((1 / normalizedDim) / 2);

    return Scaffold(
      body: Stack(
        children: [
          SlideTransition(
          position: Tween<Offset>(
            begin: Offset(xPos, -1.0),
            end: Offset(xPos, (MediaQuery.of(context).size.height / squareDim))
          ).animate(CurvedAnimation(parent: ctrl, curve: Curves.linear)),
          child: Container(
            width: squareDim,
            height: squareDim,
            color: Colors.red,
          ),
            )
        ],
      ),
    );
  }
}

class FlungrySecondScreen extends StatefulWidget {
  FlungrySecondScreen({Key? key}) : super(key: key);

  @override
  State<FlungrySecondScreen> createState() => _FlungrySecondScreenState();
}

class _FlungrySecondScreenState extends State<FlungrySecondScreen> with SingleTickerProviderStateMixin {
  late AnimationController ctrl;

  @override
  void initState() {
    super.initState();

    ctrl = AnimationController(vsync: this,
      duration: const Duration(seconds: 3)
    )..forward();
  }

  @override
  Widget build(BuildContext context) {

    double squareDim = 100;

    double normalizedDim = (MediaQuery.of(context).size.height / squareDim);
    double xPos = normalizedDim / 2; // - ((1 / normalizedDim) / 2);

    return Scaffold(
      body: Stack(
        children: [
          SlideTransition(
          position: Tween<Offset>(
            begin: Offset(-1.0, xPos),
            end: Offset((MediaQuery.of(context).size.width / squareDim), xPos)
          ).animate(CurvedAnimation(parent: ctrl, curve: Curves.linear)),
          child: Container(
            width: squareDim,
            height: squareDim,
            color: Colors.red,
          ),
            )
        ],
      ),
    );
  }
}