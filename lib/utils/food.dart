class Food {
  String name;
  String description;
  String imagePath;
  double price;
  FoodCategory category;
  List<Addon> availableAddons;
  int stock; // Ubah menjadi bukan final

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
    required this.stock,
  });
}



enum FoodCategory {
  burgers,
  pizza,
}

class Addon {
  String name;
  double price;

  Addon({
    required this.name,
    required this.price,
  });
}
