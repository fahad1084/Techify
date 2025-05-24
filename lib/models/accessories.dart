// accessories items
class Accessories {
  final String name;
  final String description;
  final String ImagePath;
  final double price;
  final AccessoriesCategory category;
  List<Addon> availableAddons;

  Accessories({
    required this.name,
    required this.description,
    required this.ImagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });
}

// accessories categories
enum AccessoriesCategory {
  airpods,
  laptops,
  Phones,
  Watches,
  tablets,
}

// accessories addons
class Addon {
  String name;
  double price;

  Addon({
    required this.name,
    required this.price,
  });
}