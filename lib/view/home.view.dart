import 'package:flutter/material.dart';
import 'package:kantinwisaga1/utils/food.dart';
import 'package:kantinwisaga1/utils/restaurant.dart';
import 'package:kantinwisaga1/view/cart.view.dart';
import 'package:kantinwisaga1/view/food.view.dart';
import 'package:kantinwisaga1/widgets/drawer.global.dart';
import 'package:kantinwisaga1/widgets/my.food.tile.dart';
import 'package:kantinwisaga1/widgets/my.tab.bar.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);
      return ListView.builder(
        itemCount: categoryMenu.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final food = categoryMenu[index];
          return FoodTile(
            food: food,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FoodPage(food: food)),
            ),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 150),
            Text(
              'Wisaga',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                  MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: Consumer<Restaurant>(
        builder: (context, restaurant, child) {
          return TabBarView(
            controller: _tabController,
            children: getFoodInThisCategory(restaurant.menu),
          );
        },
      ),
      bottomNavigationBar: MyTabBar(tabController: _tabController),
    );
  }
}
