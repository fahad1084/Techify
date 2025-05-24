import 'package:flutter/material.dart';
import 'package:techify/models/accessories.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final Accessories accessories;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantitySelector({
    super.key,
    required this.accessories,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          // decrement button
          GestureDetector(
            onTap: onDecrement,
            child: Icon(
                Icons.remove,
                    size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),

          // quantity count
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: 20,
              child: Center(child: Text(quantity.toString(),
              ),
              ),
            ),
          ),

          // increment button
          GestureDetector(
            onTap: onIncrement,
            child: Icon(
              Icons.add,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),

        ],
      ),
    );
  }
}