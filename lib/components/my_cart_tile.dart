import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techify/components/my_quantity_selector.dart';
import 'package:techify/models/cart_item.dart';
import 'package:techify/models/store.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({
    super.key,
    required this.cartItem,
  });

@override
  Widget build(BuildContext context) {
  return Consumer<Store>(builder: (context, Store, child) => Container(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: BorderRadius.circular(15),
    ),
    margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // food image
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  cartItem.accessories.ImagePath,
                  height: 110,
                  width: 110,
                ),
              ),

              const SizedBox(width: 15),
              // name and price
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // accessories name
                  Text(cartItem.accessories.name),

                  // accessories price
                  Text( '\$${cartItem.accessories.price}',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary
                    ),
                  ),

                  const SizedBox(height: 20),
                  // increment and decrement the quantity
                  QuantitySelector(
                    accessories: cartItem.accessories,
                    quantity: cartItem.quantity,
                    onIncrement: () {
                      Store.addToCart(
                        cartItem.accessories,
                        cartItem.selectedAddons,
                      );
                    },
                    onDecrement: () {
                      Store.removeFromCart(cartItem);
                    },
                  ),

                ],
              ),

              const Spacer(),

            ],
          ),
        ),

        // addons
        SizedBox(
          height: cartItem.selectedAddons.isEmpty ? 0 : 60,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 15, right: 15,bottom: 15),
            children: cartItem.selectedAddons
                .map((addon) => Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: FilterChip(
                  label: Row(
                    children: [
                      // addon name
                      Text(addon.name),

                      // addon price
                      Text(' (\$${addon.price})'),                  ],
                  ),
                  shape: StadiumBorder(
                    side: BorderSide(color: Theme.of(context).colorScheme.primary)),
                  onSelected: (value) {},
                                backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                                labelStyle: TextStyle(
                    color:
                    Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 12,
                                ),
                              ),
                ),
            )
                .toList(),
          ),
        ),
      ],
    ),
  ),
  );
  }
}