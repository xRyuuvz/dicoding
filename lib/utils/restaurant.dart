import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kantinwisaga1/utils/cart_item.dart';
import 'package:kantinwisaga1/utils/food.dart';
import 'package:collection/collection.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    Food(
      name: "Classic CheeseBurger",
      description:
          "A juicy beef patty with melted cheddar, laettuce, tomato, and a hint of onion and pickle",
      imagePath: "lib/images/burgers/cheeseburger.png",
      price: 25.000,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 2.000),
        Addon(name: "Beef", price: 7.000),
        Addon(name: "Avocado", price: 5.000),
      ],
      stock: 10,
    ),
    Food(
      name: "Aloha Burger",
      description:
          "A juicy beef patty topped with sweet caramelized pineapple, melted Swiss cheese, crispy bacon, fresh lettuce, ripe tomatoes, and a tangy BBQ sauce, all nestled in a soft, toasted brioche bun.",
      imagePath: "lib/images/burgers/alohaburger.png",
      price: 35.000,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Avocado Slices", price: 4.000),
        Addon(name: "Grilled Jalapeños", price: 3.000),
        Addon(name: "Fried Egg", price: 5.000),
      ],
      stock: 10,
    ),
    Food(
      name: "BlueMoon Burger",
      description:
          "Succulent beef patty, sesame seed bun, melted blue cheese, lettuce, tomato, red onions, tangy garlic aioli.",
      imagePath: "lib/images/burgers/bluemoonburger.png",
      price: 20.000,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Crispy Onion Strings", price: 6.000),
        Addon(name: "Applewood Smoked Beef", price: 7.000),
        Addon(name: "Roasted Portobello Mushrooms", price: 5.000),
      ],
      stock: 10,
    ),
    Food(
      name: "vegetable Burger",
      description:
          "Veggie Patty, Melted Provolone, Fresh Veggies, Tangy Tzatziki, Whole Wheat Bun",
      imagePath: "lib/images/burgers/vegeburger.png",
      price: 15.000,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Grilled Portobello Mushroom", price: 3.000),
        Addon(name: "Sliced Avocado", price: 4.000),
        Addon(name: "Crispy Sweet Potato Fries", price: 6.000),
      ],
      stock: 10,
    ),
    Food(
      name: "Rodeo Burger",
      description:
          "Savor the flavors of the Wild West with our Rodeo Burger. Juicy beef patty, tangy BBQ sauce, crispy onion rings, all on a toasted bun.",
      imagePath: "lib/images/burgers/rodeoburger.png",
      price: 45.000,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Pepper Jack Cheese", price: 4.000),
        Addon(name: "Jalapeños", price: 2.000),
        Addon(name: "Beef Strips", price: 7.000),
      ],
      stock: 10,
    ),

    //pizza
    Food(
      name: "Black Pizza",
      description:
          "Indulge in the dark side of pizza with our Black Pizza. Charcoal-infused crust topped with rich marinara sauce, gooey mozzarella cheese, and a selection of savory toppings.",
      imagePath: "lib/images/pizza/blackpizza.png",
      price: 25.000,
      category: FoodCategory.pizza,
      availableAddons: [
        Addon(name: "Spicy Pepperoni", price: 4.000),
        Addon(name: "Roasted Garlic", price: 2.000),
        Addon(name: "Fresh Arugula", price: 7.000),
      ],
      stock: 10,
    ),
    Food(
      name: "Burger Pizza",
      description:
          "Indulge in the best of both worlds with our Burger Pizza. A mouthwatering fusion of juicy beef patty, melted cheese, crisp lettuce, ripe tomatoes, all atop a savory pizza crust.",
      imagePath: "lib/images/pizza/burgerpizza.png",
      price: 40.000,
      category: FoodCategory.pizza,
      availableAddons: [
        Addon(name: "Crispy Beef", price: 7.000),
        Addon(name: "Sliced Pickles", price: 2.000),
        Addon(name: "Chipotle Mayo Drizzle", price: 3.000),
      ],
      stock: 10,
    ),
    Food(
      name: "Cheese Pizza",
      description:
          "Savor the classic simplicity of our Cheese Pizza, featuring a perfect blend of gooey melted mozzarella cheese atop a crispy golden crust, and tangy tomato sauce.",
      imagePath: "lib/images/pizza/cheesepizza.png",
      price: 25.000,
      category: FoodCategory.pizza,
      availableAddons: [
        Addon(name: "Fresh Basil Leaves", price: 4.000),
        Addon(name: "Sliced Pepperoni", price: 5.000),
        Addon(name: "Roasted Garlic", price: 3.000),
      ],
      stock: 10,
    ),
    Food(
      name: "Pepperoni Pizza",
      description:
          "Classic pepperoni pizza with a thin, crispy crust, tangy tomato sauce, gooey mozzarella cheese, and savory slices of pepperoni.",
      imagePath: "lib/images/pizza/pepperonipizza.png",
      price: 30.000,
      category: FoodCategory.pizza,
      availableAddons: [
        Addon(name: "Fresh Basil", price: 4.000),
        Addon(name: "Spicy Jalapeños", price: 5.000),
        Addon(name: "Caramelized Onions", price: 4.000),
      ],
      stock: 10,
    ),
    Food(
      name: "Vegetable Pizza",
      description:
          "A medley of fresh veggies atop a crispy crust, smothered in tangy marinara sauce and melted mozzarella cheese.",
      imagePath: "lib/images/pizza/vegepizza.png",
      price: 30.000,
      category: FoodCategory.pizza,
      availableAddons: [
        Addon(name: "Roasted Garlic", price: 4.000),
        Addon(name: "Artichoke Hearts", price: 2.000),
        Addon(name: "Sun-Dried Tomatoes", price: 3.000),
      ],
      stock: 10,
    ),
  ];

 List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  final List<CartItem> _cart = [];

  void addToCart(Food food, List<Addon> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;

      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(
        CartItem(food: food, selectedAddons: selectedAddons),
      );
    }

    // Kurangi stok makanan
    int foodIndex = _menu.indexOf(food);
    if (foodIndex != -1) {
      if (_menu[foodIndex].stock > 0) {
        _menu[foodIndex].stock--;
      } else {
        // Optional: Handle stok habis di sini
        print('Maaf, stok ${food.name} sudah habis.');
      }
    }

    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }

      // Tambahkan stok makanan yang dihapus dari keranjang
      int foodIndex = _menu.indexOf(cartItem.food);
      if (foodIndex != -1) {
        _menu[foodIndex].stock++;
      }
    }
    notifyListeners();
  }

  double getTotalPrice() {
    double total = 0.000;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  void clearCart() {
    // Mengembalikan stok makanan yang ada di keranjang
    for (CartItem cartItem in _cart) {
      int foodIndex = _menu.indexOf(cartItem.food);
      if (foodIndex != -1) {
        _menu[foodIndex].stock += cartItem.quantity;
      }
    }

    _cart.clear();
    notifyListeners();
  }
}