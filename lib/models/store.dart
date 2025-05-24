import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:techify/models/accessories.dart';
import 'package:techify/models/cart_item.dart';

class Store extends ChangeNotifier{
  // list of accessories menu
  final List<Accessories> _menu =[

    // airpods
Accessories(
    name: "Apple AirPods 4",
    description: "Experience unparalleled sound and seamless connectivity with Apple AirPods 4, the ultimate in wireless audio innovation.",
    ImagePath: "lib/images/airpods/apple_airpods_4_blanco_01_l.jpg",
    price: 179,
    category: AccessoriesCategory.airpods,
    availableAddons: [
      Addon(name: "AirPods Plastic Case", price: 20),
      Addon(name: "AirPods Leather Case", price: 80),
    ]
),
    Accessories(
        name: "Airbud 550",
        description: "Elevate your listening with Audionic Airbuds 550, delivering premium sound quality and all-day comfort.",
        ImagePath: "lib/images/airpods/audionic.jpg",
        price: 50,
        category: AccessoriesCategory.airpods,
        availableAddons: [
          Addon(name: "AirBuds Plastic Case", price: 20),
          Addon(name: "AirBuds Leather Case", price: 80),
          Addon(name: "AirBuds Strip", price: 15),
        ]
    ),

    // laptops
    Accessories(
        name: "Dell Latitude 9000",
        description: "Dell Latitude 9000: A premium business laptop offering exceptional performance, a stunning display, and long-lasting battery life, designed for professionals who demand power, security, and portability in one sleek device.",
        ImagePath: "lib/images/laptops/dell latitude 9000.jpg",
        price: 799,
        category: AccessoriesCategory.laptops,
        availableAddons: [
          Addon(name: "Dell Mouse", price: 349),
          Addon(name: "Dell Keyboard", price: 249),
          Addon(name: "1 to 8 Multiport Adapter", price: 350),
          Addon(name: "1 to 4 Multiport Adapter", price: 175),
        ]
    ),

    Accessories(
        name: "Lenovo ThinkPad X1 Yoga Gen 7",
        description: "Lenovo ThinkPad X1 Yoga: A versatile 2-in-1 laptop with a stunning display, powerful performance, and enterprise-grade security features, designed for professionals who need flexibility, durability, and top-tier productivity on the go.",
        ImagePath: "lib/images/laptops/lenovo-thinkpad-x1-yoga.jpg",
        price: 449,
        category: AccessoriesCategory.laptops,
        availableAddons: [
          Addon(name: "Lenovo Laptop Bag", price: 49),
          Addon(name: "Lenovo Wireless Mouse", price: 149),
          Addon(name: "1 to 8 Multiport Adapter", price: 350),
          Addon(name: "1 to 4 Multiport Adapter", price: 175),
        ]
    ),

    Accessories(
        name: "MacBook Pro",
        description: "MacBook Pro: A high-performance laptop designed for professionals, featuring a stunning Retina display, powerful M1 or M2 chip, and exceptional battery life. With its sleek design, fast processing power, and advanced graphics capabilities, it's built to handle demanding tasks with ease while providing a seamless macOS experience.",
        ImagePath: "lib/images/laptops/MacBook-Pro.jpg",
        price: 1699,
        category: AccessoriesCategory.laptops,
        availableAddons: [
          Addon(name: "Apple Laptop Charger", price: 349),
          Addon(name: "Apple Wireless Mouse", price: 299),
          Addon(name: "Apple Wireless Keyboard", price: 249),
          Addon(name: "1 to 8 Multiport Adapter", price: 350),
          Addon(name: "1 to 4 Multiport Adapter", price: 175),
        ]
    ),

    Accessories(
        name: "Surface Laptop Studio 2",
        description: "Microsoft Surface: A versatile and sleek 2-in-1 device that combines the power of a laptop with the flexibility of a tablet. Featuring a high-resolution touchscreen, powerful performance, and long battery life, it's designed for productivity, creativity, and seamless integration with Microsoft’s ecosystem.",
        ImagePath: "lib/images/laptops/microsoftsurface.jpg",
        price: 2499,
        category: AccessoriesCategory.laptops,
        availableAddons: [
          Addon(name: "Surface Thunderbolt™ 4 Dock", price: 299),
          Addon(name: "Surface Slim Pen", price: 129),
          Addon(name: "Surface Pro Signature Keyboard – Sapphire", price: 125),
          Addon(name: "1 to 8 Multiport Adapter", price: 350),
          Addon(name: "1 to 4 Multiport Adapter", price: 175),
        ]
    ),

    // Phones
    Accessories(
        name: "Pixel 7 pro",
        description: "Google Pixel 7 Pro: A flagship device featuring a stunning 120Hz OLED display, powerful performance, and an advanced AI-powered camera system. Capture professional-quality photos with features like Super Res Zoom, Night Sight, and Cinematic Blur, all while enjoying Google’s seamless software integration, enhanced security, and long-lasting battery life for a truly exceptional mobile experience.",
        ImagePath: "lib/images/Phones/google-pixel-7.jpeg",
        price: 699,
        category: AccessoriesCategory.Phones,
        availableAddons: [
          Addon(name: "Pixel 30W Adapter", price: 49),
          Addon(name: "Pixel Charging Cable", price: 19),
          Addon(name: "3 Pairs Leather Phone Cases", price: 299),
          Addon(name: "USB B to C Converter", price: 150),
          Addon(name: "USB C Audio Adapter With Microphone Jack", price: 95),
        ]
    ),

    Accessories(
        name: "Pixel 9 Pro",
        description: "Google Pixel 9 Pro: A cutting-edge smartphone with a vibrant OLED display, powerful AI-driven camera capabilities, and seamless integration with Google’s ecosystem. Capture stunning photos with advanced features like enhanced Night Sight, Ultra-Wide lens, and video stabilization, while enjoying top-tier performance, long battery life, and a secure, intuitive user experience.",
        ImagePath: "lib/images/Phones/google-pixel-9.jpg",
        price: 1199,
        category: AccessoriesCategory.Phones,
        availableAddons: [
          Addon(name: "Pixel 30W Adapter", price: 49),
          Addon(name: "Pixel Charging Cable", price: 19),
          Addon(name: "3 Pairs Leather Phone Cases", price: 299),
          Addon(name: "USB B to C Converter", price: 150),
          Addon(name: "USB C Audio Adapter With Microphone Jack", price: 95),
        ]
    ),

    Accessories(
        name: "Apple iPhone 12",
        description: "iPhone 12: A powerful blend of sleek design and advanced technology, featuring a stunning Super Retina XDR display, A14 Bionic chip, and an improved dual-camera system for high-quality photos and videos. With 5G connectivity, Ceramic Shield, and all-day battery life, it’s built for performance, durability, and an immersive experience.",
        ImagePath: "lib/images/Phones/iphone_12.jpeg",
        price: 799,
        category: AccessoriesCategory.Phones,
        availableAddons: [
          Addon(name: "Apple 30W Adapter", price: 299),
          Addon(name: "Apple Charging Cable", price: 99),
          Addon(name: "3 Pairs Leather Phone Cases", price: 249),
          Addon(name: "USB B to C Converter", price: 150),
          Addon(name: "USB C Audio Adapter With Microphone Jack", price: 95),
        ]
    ),

    Accessories(
        name: "Apple iPhone 16",
        description: "iPhone 16: The latest innovation from Apple, featuring a dynamic display, enhanced A16 Bionic chip, and an upgraded camera system with advanced AI capabilities for stunning photos and videos. With 5G support, longer battery life, and cutting-edge features like improved Face ID and a sleek design, it’s built to deliver a superior performance and seamless user experience.",
        ImagePath: "lib/images/Phones/iphone_16.jpeg",
        price: 1199,
        category: AccessoriesCategory.Phones,
        availableAddons: [
          Addon(name: "Apple 30W Adapter", price: 299),
          Addon(name: "Apple Charging Cable", price: 99),
          Addon(name: "3 Pairs Leather Phone Cases", price: 249),
          Addon(name: "USB B to C Converter", price: 119),
          Addon(name: "USB C Audio Adapter With Microphone Jack", price: 99),
        ]
    ),

    // tablets

    Accessories(
        name: "Apple iPad Pro",
        description: "iPad Pro: Combining a breathtaking display, professional-grade performance, and powerful tools, it’s designed to elevate your productivity, creativity, and entertainment experience.",
        ImagePath: "lib/images/Phones/apple_ipad.jpg",
        price: 999,
        category: AccessoriesCategory.tablets,
        availableAddons: [
          Addon(name: "iPad Leather Back Cover", price: 150),
          Addon(name: "Front or Back Paper Sheet", price: 49),
          Addon(name: "1 to 8 Multiport Adapter", price: 350),
          Addon(name: "1 to 4 Multiport Adapter", price: 175),
        ]
    ),

    Accessories(
        name: "Pixel Tablet",
        description: "Pixel Tablet: A sleek, versatile device that blends powerful performance with a vibrant display, perfect for work, entertainment, and smart home control.",
        ImagePath: "lib/images/Phones/pixel.jpg",
        price: 399,
        category: AccessoriesCategory.tablets,
        availableAddons: [
          Addon(name: "Pixel Leather Back Cover", price: 90),
          Addon(name: "Pixel or Back Paper Sheet", price:29),
          Addon(name: "1 to 8 Multiport Adapter", price: 350),
          Addon(name: "1 to 4 Multiport Adapter", price: 175),
        ]
    ),

    //Watches
    Accessories(
        name: "Gucci Interlocking watch, 41mm",
        description: "Gucci Interlocking 41mm: A timeless blend of elegance and iconic design.",
        ImagePath: "lib/images/Watches/guci.jpeg",
        price: 2300,
        category: AccessoriesCategory.Watches,
        availableAddons: [
          Addon(name: "Lifetime Warrenty Card", price: 500),
        ]
    ),

    Accessories(
        name: "Apple Watch 4",
        description: "Apple Watch Series 4: Combining advanced health tracking, fitness features, and seamless connectivity, it’s the perfect companion for a healthier, more connected lifestyle.",
        ImagePath: "lib/images/Watches/applewatch_4.jpeg",
        price: 499,
        category: AccessoriesCategory.Watches,
        availableAddons: [
          Addon(name: "1 Pair of Leather Strapes", price: 80),
          Addon(name: "3 Pairs of Leather Strapes", price: 200),
        ]
    ),

    Accessories(
        name: "Rolex Deepsea",
        description: "Rolex Deepsea: A masterpiece of precision, durability, and unmatched deep-sea performance.",
        ImagePath: "lib/images/Watches/rolex.jpg",
        price: 12999,
        category: AccessoriesCategory.Watches,
        availableAddons: [
          Addon(name: "Premium Box", price: 200),
        ]
    ),

    Accessories(
        name: "Pixel Watch 2",
        description: "Pixel Watch 2: The ultimate fusion of sleek design, advanced fitness tracking, and Google-powered smart features for a connected, active lifestyle.",
        ImagePath: "lib/images/Watches/google_pixel_watch_2_.jpg",
        price: 399,
        category: AccessoriesCategory.Watches,
        availableAddons: [
          Addon(name: "1 Pair Leather Strapes", price: 40),
          Addon(name: "3 Pairs Leather Strapes", price: 100),
          Addon(name: "3 Pairs Fancy Strapes", price: 150),
        ]
    ),
  ];

  // 1.user cart
  final List<CartItem> _cart = [];

  // delivery address
  String _deliveryAddress = 'Nafees Arcade E-11/2 Islambad.';

  /*
  GETTERS
   */

List<Accessories> get menu => _menu;
List<CartItem> get cart => _cart;
String get deliveryAddress => _deliveryAddress;

  /*
  OPERATIONS
   */

  // 2.add to cart
void addToCart(Accessories accessories, List<Addon> selectedAddons) {
  // see if there is a cart item already with same food and selected adsons
  CartItem? cartitem = _cart.firstWhereOrNull((item) {
    // check if accessories items are same
    bool isSameAccessories = item.accessories == accessories;

    // check if selected addons are same
    bool isSameAddons = ListEquality().equals(item.selectedAddons, selectedAddons);

    return isSameAccessories && isSameAddons;
  });

  // if item already exits, increase it's quantity
  if(cartitem != null) {
    cartitem.quantity++;
  }

  //otherwise, add a new cart item to the cart
  else {
    _cart.add(
      CartItem(
          accessories: accessories,
          selectedAddons: selectedAddons
      ),
    );
  }

  notifyListeners();
}

// 3.remove from cart
void removeFromCart(CartItem cartitem){
  int cartIndex = _cart.indexOf(cartitem);

  if (cartIndex != -1){
    if (_cart[cartIndex].quantity > 1) {
      _cart[cartIndex].quantity--;
    }
    else {
      _cart.removeAt(cartIndex);
    }
  }
  notifyListeners();
}

// 4.get total price of cart
double getTotalPrice() {
  double total = 0.0;

  for(CartItem cartItem in _cart) {
    double itemTotal = cartItem.accessories.price;

    for(Addon addon in cartItem.selectedAddons) {
      itemTotal += addon.price;
    }

    total += itemTotal * cartItem.quantity;
  }

  return total;
}

// 5.get total number of items in cart
int getTotalItemCount() {
  int totalItemCout = 0;

  for(CartItem cartItem in _cart) {
    totalItemCout += cartItem.quantity;
  }

  return totalItemCout;
}

// 6.clear cart
void clearCart() {
  _cart.clear();
  notifyListeners();
}

// update delivery address
  void updateDeliveryAddress (String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  /*
  HELPERS
   */

// 1.generate receipt
String displayCartReceipt() {
  final receipt = StringBuffer();
  receipt.writeln("Here's your receipt.");
  receipt.writeln();

  // format the date to include up to seconds only
  String formattedDate =
  DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

  receipt.writeln(formattedDate);
  receipt.writeln();
  receipt.writeln("----------");


  for(final CartItem in _cart) {
    receipt.writeln(
        "${CartItem.quantity} x ${CartItem.accessories.name} ${_formatPrice(CartItem.accessories.price)}");

  if(CartItem.selectedAddons.isNotEmpty) {
    receipt.writeln("Add-ons: ${_formatAddons (CartItem.selectedAddons)}");
  }
  receipt.writeln();
  }
  receipt.writeln("----------");
  receipt.writeln();
  receipt.writeln("Total Items: ${getTotalItemCount()}");
  receipt.writeln("Total Price: ${_formatPrice (getTotalPrice())}");
  receipt.writeln();
  receipt.writeln("Deliverying to: $deliveryAddress");


  return receipt.toString();
}

// format double value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed (2)}";
  }

// format list of addons into a string summary
String _formatAddons(List<Addon> addon) {
    return addon
    .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
    .join(",");
  }
}