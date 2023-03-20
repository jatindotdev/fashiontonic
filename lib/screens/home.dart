import 'package:fashontonic/widgets/custom_chip.dart';
import 'package:fashontonic/widgets/product.dart';
import 'package:fashontonic/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}

PreferredSizeWidget _buildAppBar() {
  return AppBar(
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      onPressed: () {},
      icon: const Icon(CupertinoIcons.line_horizontal_3_decrease),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),
      ),
    ),
    leadingWidth: 72,
    toolbarHeight: kToolbarHeight + 20,
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SizedBox(
          height: kToolbarHeight + 4,
          child: IconButton(
            onPressed: () {},
            icon: Image.asset("assets/avatar.png"),
          ),
        ),
      ),
    ],
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(2 * kToolbarHeight + 40),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: kToolbarHeight,
              child: CustomTextField(label: "Search", onChanged: (value) {}),
            ),
          ),
          _buildCategories(),
        ],
      ),
    ),
  );
}

Widget _buildBody() {
  return Column(
    children: [
      _buildProducts(),
    ],
  );
}

Widget _buildCategories() {
  final selectedIndex = 0.obs;
  final categories = [
    "All Categories",
    "Men",
    "Women",
    "Kids",
    "Shoes",
    "Bags",
    "Accessories"
  ];
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
    child: SizedBox(
      height: 48,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Obx(
            () => CustomChip(
              label: categories[index],
              onPressed: () {
                selectedIndex.value = index;
              },
              selected: selectedIndex.value == index,
            ),
          );
        },
      ),
    ),
  );
}

Widget _buildProducts() {
  return Expanded(
    child: GridView.builder(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 40),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        mainAxisExtent: 332,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const GridTile(
          child: Product(
            image: "assets/ahri.jpg",
            name: "Men Red Self Designed T-Shirt",
            price: 49.99,
          ),
        );
      },
    ),
  );
}
