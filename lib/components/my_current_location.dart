import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techify/models/store.dart';

class MyCurrentLocation extends StatelessWidget {
  final TextEditingController textController = TextEditingController();

  MyCurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Your Location"),
        content: TextField(
          controller: textController, // Bind the controller
          decoration: const InputDecoration(hintText: "Enter address..."),
        ),
        actions: [
          // Cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),

          // Save button
          MaterialButton(
            onPressed: () {
              String newAddress = textController.text;
              if (newAddress.isNotEmpty) {
                context.read<Store>().updateDeliveryAddress(newAddress);
              }
              Navigator.pop(context);
              textController.clear();
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Deliver Now",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                Expanded(
                  child: Consumer<Store>(
                    builder: (context, store, child) => Text(
                      store.deliveryAddress.isNotEmpty
                          ? store.deliveryAddress
                          : "Enter your address",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
