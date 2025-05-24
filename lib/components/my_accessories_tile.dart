import 'package:flutter/material.dart';
import 'package:techify/models/accessories.dart';

class AccessoriesTile extends StatelessWidget {
  final Accessories accessories;
  final void Function()? onTap;

  const AccessoriesTile({
    super.key,
    required this.accessories,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                //text accessories details
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(accessories.name ),
                        Text(
                            '\$' + accessories.price.toString(),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                            accessories.description,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                        ),
                      ],
                    ),
                ),

                const SizedBox(width: 20),
                // accessories image

                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                    child: Image.asset(accessories.ImagePath, height: 100)
                ),

              ],
            ),
          ),
        ),

        // divider line

        Divider(
            color: Theme.of(context).colorScheme.tertiary,
        endIndent: 25,
          indent: 25,

        ),
      ],
    );

  }
}