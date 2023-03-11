
import 'package:flutter/material.dart';

/// top
class FlungryFromTopScreen extends StatefulWidget {
  final Function onComplete;
  const FlungryFromTopScreen({Key? key, required this.onComplete}) : super(key: key);

  @override
  State<FlungryFromTopScreen> createState() => _FlungryFromTopScreenState();
}

class _FlungryFromTopScreenState extends State<FlungryFromTopScreen> with SingleTickerProviderStateMixin {

  late AnimationController ctrl;

  @override
  void initState() {
    super.initState();

    ctrl = AnimationController(vsync: this,
      duration: const Duration(seconds: 3)
    )..forward().whenComplete(() {
      widget.onComplete();
    });
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
      )
    );
  }
}

/// left
/// 
class FlungryFromLeftScreen extends StatefulWidget {

  final Function onComplete;
  FlungryFromLeftScreen({Key? key,
    required this.onComplete
  }) : super(key: key);

  @override
  State<FlungryFromLeftScreen> createState() => _FlungryFromLeftScreenState();
}

class _FlungryFromLeftScreenState extends State<FlungryFromLeftScreen> with SingleTickerProviderStateMixin {
  late AnimationController ctrl;

  @override
  void initState() {
    super.initState();

    ctrl = AnimationController(vsync: this,
      duration: const Duration(seconds: 3)
    )..forward().whenComplete(() {
      widget.onComplete();
    });
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


/// bottom
/// 
/// /// top
class FlungryFromBottomScreen extends StatefulWidget {

  final Function onComplete;
  const FlungryFromBottomScreen({Key? key, required this.onComplete}) : super(key: key);

  @override
  State<FlungryFromBottomScreen> createState() => _FlungryFromBottomScreenState();
}

class _FlungryFromBottomScreenState extends State<FlungryFromBottomScreen> with SingleTickerProviderStateMixin {

  late AnimationController ctrl;

  @override
  void initState() {
    super.initState();

    ctrl = AnimationController(vsync: this,
      duration: const Duration(seconds: 3)
    )..forward().whenComplete(() {
      widget.onComplete();
    });
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
            begin: Offset(xPos, (MediaQuery.of(context).size.height / squareDim)),
            end: Offset(xPos, -1.0)
          ).animate(CurvedAnimation(parent: ctrl, curve: Curves.linear)),
          child: Container(
            width: squareDim,
            height: squareDim,
            color: Colors.red,
          ),
            )
        ],
      )
    );
  }
}
