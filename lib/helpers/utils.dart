import 'package:flungry/models/flungrystep.dart';
import 'package:flungry/models/flungrystep.option.dart';
import 'package:flutter/material.dart';

class Utils {

  static String imgsRoot = './assets/imgs/';

  static List<FlungryStep> getDefaultSteps() {
    return [
      FlungryStep(
        label: 'Select Bun', 
        index: 0, 
        isComplete: false, 
        options: [
          FlungryStepOption(
            index: 0,
            img: '${Utils.imgsRoot}step1/bun1.png', 
            item: 'Plain Bread', 
            description: '350 Calories\n26 Carbs Per Slice', 
            price: 1.00, 
            isSelected: false
          ),
          FlungryStepOption(
            index: 1,
            img: '${Utils.imgsRoot}step1/bun2.png', 
            item: 'Sesame Bread', 
            description: '340 Calories\n20 Carbs Per Slice', 
            price: 1.25, 
            isSelected: false
          ),
          FlungryStepOption(
            index: 2,
            img: '${Utils.imgsRoot}step1/bun3.png', 
            item: 'Potato Bread', 
            description: '390 Calories\n28 Carbs Per Slice', 
            price: 1.35, 
            isSelected: false
          )
        ]
      ),
      FlungryStep(
        label: 'Select Meat', 
        index: 1, 
        isComplete: false, 
        options: [
          FlungryStepOption(
            index: 0,
            img: '${Utils.imgsRoot}step2/meat1.png', 
            item: 'Beef Patty', 
            description: '450 Calories\nPer Patty', 
            price: 1.20, 
            isSelected: false
          ),
          FlungryStepOption(
            index: 1,
            img: '${Utils.imgsRoot}step2/meat2.png', 
            item: 'Vegetable-Beef Patty', 
            description: '340 Calories\nPer Patty', 
            price: 1.45, 
            isSelected: false
          ),
          FlungryStepOption(
            index: 2,
            img: '${Utils.imgsRoot}step2/meat3.png', 
            item: 'Impossible Meat', 
            description: '300 Calories\nPer Patty', 
            price: 1.55, 
            isSelected: false
          )
        ]
      ),
      FlungryStep(
        label: 'Select Sauce', 
        index: 2, 
        isComplete: false, 
        options: [
          FlungryStepOption(
            index: 0,
            img: '${Utils.imgsRoot}step3/sauce1.png', 
            item: 'Mayo-Ketchup', 
            description: '20 Calories (1 Tablespoon)', 
            price: 0.99, 
            isSelected: false
          ),
          FlungryStepOption(
            index: 1,
            img: '${Utils.imgsRoot}step3/sauce2.png', 
            item: 'Chipotle Mayo', 
            description: '25 Calories (1 Tablespoon)', 
            price: 1.05, 
            isSelected: false
          ),
          FlungryStepOption(
            index: 2,
            img: '${Utils.imgsRoot}step3/sauce3.png', 
            item: 'Spicy Mayo', 
            description: '22 Calories (1 Tablespoon)', 
            price: 1.15, 
            isSelected: false
          )
        ]
      ),
      FlungryStep(
        label: 'Select Cheese', 
        index: 3, 
        isComplete: false, 
        options: [
          FlungryStepOption(
            index: 0,
            img: '${Utils.imgsRoot}step4/cheese1.png', 
            item: 'American Cheese', 
            description: '20 Calories Per Slice', 
            price: 0.99, 
            isSelected: false
          ),
          FlungryStepOption(
            index: 1,
            img: '${Utils.imgsRoot}step4/cheese2.png', 
            item: 'Cheddar Cheese', 
            description: '23 Calories Per Slice', 
            price: 0.85, 
            isSelected: false
          ),
          FlungryStepOption(
            index: 2,
            img: '${Utils.imgsRoot}step4/cheese3.png', 
            item: 'Swiss Cheese', 
            description: '22 Calories Per Slice', 
            price: 0.95, 
            isSelected: false
          )
        ]
      ),
      FlungryStep(
        label: 'Select Lettuce', 
        index: 4, 
        isComplete: false, 
        options: [
          FlungryStepOption(
            index: 0,
            img: '${Utils.imgsRoot}step5/veggie11.png', 
            item: 'Green Leaf Lettuce', 
            description: '3 Calories Per Leaf', 
            price: 0.19, 
            isSelected: false
          ),
          FlungryStepOption(
            index: 1,
            img: '${Utils.imgsRoot}step5/veggie12.png', 
            item: 'Iceberg Lettuce', 
            description: '3 Calories Per Leaf', 
            price: 0.25, 
            isSelected: false
          ),
          FlungryStepOption(
            index: 2,
            img: '${Utils.imgsRoot}step5/veggie13.png', 
            item: 'Romaine Lettuce', 
            description: '2 Calories Per Leaf', 
            price: 0.25, 
            isSelected: false
          )
        ]
      ),
      FlungryStep(
        label: 'Select Tomato', 
        index: 5, 
        isComplete: false, 
        options: [
          FlungryStepOption(
            index: 0,
            img: '${Utils.imgsRoot}step6/veggie21.png', 
            item: 'Johnson Tomato', 
            description: '2 Calories Per Slice', 
            price: 0.19, 
            isSelected: false
          ),
          FlungryStepOption(
            index: 1,
            img: '${Utils.imgsRoot}step6/veggie22.png', 
            item: 'Green Tomato', 
            description: '3 Calories Per Slice', 
            price: 0.25, 
            isSelected: false
          ),
          FlungryStepOption(
            index: 2,
            img: '${Utils.imgsRoot}step6/veggie23.png', 
            item: 'Better Boy Tomato', 
            description: '2 Calories Per Slice', 
            price: 0.25, 
            isSelected: false
          )
        ]
      )
    ];
  }
}