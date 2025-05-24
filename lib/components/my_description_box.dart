import 'package:flutter/material.dart';

class MyDescription extends StatelessWidget {
  const MyDescription({super.key});

  @override
  Widget build(BuildContext context) {

    // textstyle
    var myPrimaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary);
    var mySecondaryTextStyle = TextStyle(
        color: Theme.of(context).colorScheme.primary);


    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(25.0),
      margin: const EdgeInsets.only(left: 30, right: 30, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // delivery fee
          Column(
            children: [
              Text(
                  '\$1.99',
                  style: myPrimaryTextStyle

              ),
              Text(
                  'Delivery Fee',
                  style: mySecondaryTextStyle),
            ],
          ),
          // delivery time
          Column(
            children: [
              Text(
                  '15-30 min',
                  style: myPrimaryTextStyle
              ),
              Text(
                  'Delivery Time',
                  style: mySecondaryTextStyle
              ),
            ],
          ),
        ],
      ),
    );
  }
}