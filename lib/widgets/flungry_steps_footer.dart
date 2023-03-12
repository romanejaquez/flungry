import 'package:flungry/helpers/colors.dart';
import 'package:flungry/helpers/flungry_icons.dart';
import 'package:flutter/material.dart';

class FlungryStepsFooter extends StatelessWidget {
  const FlungryStepsFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: FlungryColors.mainColor
          ),
          onPressed: () {}, 
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Flungry.prev, color: Colors.white, size: 30),
                SizedBox(width: 10),
                Text('Previous', style: TextStyle(fontSize: 30))
              ],
            ),
          )
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: FlungryColors.mainColor
          ),
          onPressed: () {}, 
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Flungry.next, color: Colors.white, size: 30),
                SizedBox(width: 10),
                Text('Next', style: TextStyle(fontSize: 30))
              ].reversed.toList(),
            ),
          )
        )
      ],
    );
  }
}