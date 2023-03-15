import 'package:flungry/helpers/colors.dart';
import 'package:flungry/helpers/flungry_icons.dart';
import 'package:flutter/material.dart';

class OrderBadge extends StatelessWidget {

  final int orderNumber;
  const OrderBadge({super.key, required this.orderNumber });

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(minWidth: 350),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(80)
        ),
        padding: const EdgeInsets.only(left: 30, top: 30, bottom: 30, right: 80),
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Flungry.flungry_burger, size: 60, color: FlungryColors.mainColor),
            const SizedBox(width: 20),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('ORDER', style: TextStyle(fontSize: 25, fontFamily: 'Product Sans')),
                Text('#$orderNumber', style: const TextStyle(fontSize: 50, fontFamily: 'Product Sans', fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ),
      );
  }
}