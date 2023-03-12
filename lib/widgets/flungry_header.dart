import 'package:flungry/helpers/flungry_icons.dart';
import 'package:flungry/helpers/utils.dart';
import 'package:flutter/material.dart';

class FlungryHeader extends StatelessWidget {
  const FlungryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            color: Colors.white.withOpacity(0.2),
            child: Icon(Flungry.menu, color: Colors.white)),
          Expanded(
            child: Row(
              children: [
                const SizedBox(width: 40),
                Icon(Flungry.flungry_burger, color: Colors.white, size: 40),
                const SizedBox(width: 20),
                Icon(Flungry.flungry_text, color: Colors.white, size: 40),
              ],
            ),
          ),
          Row(
            children: [
              Icon(Flungry.reload, color: Colors.white, size: 40),
              const SizedBox(width: 20),
              Icon(Flungry.kitchen, color: Colors.white, size: 40),
              const SizedBox(width: 20),
            ],
          )
        ],
      ),
    );
  }
}