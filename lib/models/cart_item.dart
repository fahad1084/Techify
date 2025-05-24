import 'package:techify/models/accessories.dart';

class CartItem {
  Accessories accessories;
  List<Addon> selectedAddons;
  int quantity;

  CartItem({
    required this.accessories,
    required this.selectedAddons,
    this.quantity = 1,
  });

  double get totalPrice {
    double addonsPrice =
        selectedAddons.fold(0, (sum, addon) => sum + addon.price);
    return (accessories.price + addonsPrice) * quantity;
  }
}