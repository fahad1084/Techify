import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techify/components/my_button.dart';
import 'package:techify/main.dart';
import 'package:techify/models/accessories.dart';
import 'package:techify/models/store.dart';
import 'package:techify/pages/home_page.dart';

class AccessoriesPage extends StatefulWidget {
  final Accessories accessories;
  final Map<Addon, bool> selectedAddons = {};

  AccessoriesPage ({
    super.key,
    required this.accessories,
  }){
    // initialize selected add-ons to be false
    for(Addon addon in accessories.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<AccessoriesPage> createState() => _AccessoriesPageState();
}

class _AccessoriesPageState extends State<AccessoriesPage> {

  // method to add to cart
  void addToCart(Accessories accessories, Map<Addon, bool> selectedAddons) {

    //close the current accessories page and got to home
    Navigator.pop(context);

    // format the selected addons
    List<Addon> currentlySelectedAddons = [];
    for(Addon addon in widget.accessories.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }

    // add to cart
    context.read<Store>().addToCart(accessories, currentlySelectedAddons);
  }


  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // scaffold UI
    Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // food image
            Image.asset(widget.accessories.ImagePath),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // food name
                  Text(
                   widget.accessories.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,

                    ),
                  ),

                  // food price
                  Text(
                    '\$${widget.accessories.price}',
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  const SizedBox(height: 10),
                  // food description
                  Text(
                    widget.accessories.description,
                  ),
                  const SizedBox(height: 10),

                  Divider(color: Theme.of(context).colorScheme.secondary),
                  const SizedBox(height: 10),
                  // addons
                  Text(
                    "Add-ons",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 10),


                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).colorScheme.secondary),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: widget.accessories.availableAddons.length,
                      itemBuilder: (context, index) {
                        // get individual addons
                        Addon addon = widget.accessories.availableAddons[index];

                        // return checkbox UI
                        return CheckboxListTile(
                          title: Text(addon.name),
                          subtitle: Text('\$${addon.price}',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          value: widget.selectedAddons[addon],
                          onChanged: (bool? value) {
                            setState(() {
                              widget.selectedAddons[addon] = value!;
                            });

                            },
                        );
                        },
                    ),
                  ),
                ],
              ),
            ),

            // button -> add to cart
             MyButton(
               text: "Add to Cart",
               onTap: () => addToCart(widget.accessories, widget.selectedAddons),
             ),

            const SizedBox(height: 25,)
          ],
        ),
      ),
    ),

      // Back Button
      SafeArea(
        child: Opacity(
          opacity: 0.5,
          child: Container(
            margin: EdgeInsets.only(left: 25.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              shape: BoxShape.circle,
            ),
            child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_rounded),
            ),
          ),
        ),
      )

    ],
    );
  }
}