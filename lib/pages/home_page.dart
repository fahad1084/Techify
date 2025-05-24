import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techify/components/my_accessories_tile.dart';
import 'package:techify/components/my_current_location.dart';
import 'package:techify/components/my_description_box.dart';
import 'package:techify/components/my_drawer.dart';
import 'package:techify/components/my_silver_app_bar.dart';
import 'package:techify/components/my_tab_bar.dart';
import 'package:techify/models/accessories.dart';
import 'package:techify/models/store.dart';
import 'package:techify/pages/accessories_page.dart';

class HomePage extends StatefulWidget {
  const HomePage ({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  with SingleTickerProviderStateMixin {

  // tab controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: AccessoriesCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // sort out and return a list of items that belong to specific category
  List<Accessories> _filterMenuByCategory(AccessoriesCategory category, List<Accessories> fullMenu) {
    return fullMenu.where((Accessories) => Accessories.category == category).toList();
  }

  // return list of food in given category
  List<Widget> getFoodInThisCategory(List<Accessories> fullMenu) {
    return AccessoriesCategory.values.map((category) {

      // return accessories tile UI
      List<Accessories> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index){
          // get individual accessories
          final accessories = categoryMenu[index];
          return AccessoriesTile(
              accessories: accessories,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AccessoriesPage(accessories: accessories),
                ),
              ),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
              title: MyTabBar(tabController: _tabController),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Divider(
                    indent: 25,
                    endIndent: 25,
                    color: Theme.of(context).colorScheme.secondary,
                  ),

                  // my current location
                   MyCurrentLocation(),

                  // description
                  const MyDescription(),

                ],
              ),
          ),
        ],

        body: Consumer<Store> (builder: (context, Store, child) =>
            TabBarView(
            controller: _tabController,
            children: getFoodInThisCategory(Store.menu),
        ),
        ),
      ),
    );
  }
}