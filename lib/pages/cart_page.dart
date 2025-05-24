import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techify/components/my_button.dart';
import 'package:techify/components/my_cart_tile.dart';
import 'package:techify/models/store.dart';
import 'package:techify/pages/delivery_progress_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Store>(builder: (context, store, child) {
      final userCart = store.cart;

      // Scaffold UI
      return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            // Clear cart button
            IconButton(
              onPressed: () => _showClearCartDialog(context, store),
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
        body: Column(
          children: [
            // List of cart
            userCart.isEmpty
                ? const Expanded(
              child: Center(child: Text("Cart is Empty...")),
            )
                : Expanded(
              child: ListView.builder(
                itemCount: userCart.length,
                itemBuilder: (context, index) {
                  final cartItem = userCart[index];
                  return MyCartTile(cartItem: cartItem);
                },
              ),
            ),

            // Button to pay
            MyButton(
              text: "Go to Checkout",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DeliveryProgressPage(),
                ),
              ),
            ),
            const SizedBox(height: 15,),
          ],
        ),
      );
    });
  }

  void _showClearCartDialog(BuildContext context, Store store) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Are You Sure? You want to clear the cart?"),
        actions: [
          // Cancel button
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),

          // Yes button
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              store.clearCart();
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }
}
