import 'package:kantinwisaga1/utils/food.dart';

class CartItem {
  Food food;
  List<Addon> selectedAddons;
  int quantity;

  CartItem({
    required this.food,
    required this.selectedAddons,
    this.quantity = 1,
  });

  double get totalPrice {
    double addonsPrice =
        selectedAddons.fold(0, (sum, addon) => sum + addon.price);
    return (food.price + addonsPrice) * quantity;
  }

  // Method to reduce the stock when adding this item to the cart
  void reduceStock() {
    if (food.stock > 0) {
      food.stock--;
    }
  }

  // Method to increase the stock when removing this item from the cart
  void increaseStock() {
    food.stock++;
  }
}

