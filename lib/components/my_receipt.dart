import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techify/models/store.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 50),
      child: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.secondary),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(25),
                  child: Consumer<Store>(
                    builder: (context, store, child) =>
                        Text(store.displayCartReceipt()),
                  ),
                ),
                const SizedBox(height: 25),
                const Text("Estimated Delivery Time is 3-4 Working Days"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
