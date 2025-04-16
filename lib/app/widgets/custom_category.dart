import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItem {
  final int id;
  final String name;
  final String image;
  final Color color;

  CategoryItem({required this.id, required this.name, required this.image, required this.color});
}


class CustomCategory extends StatelessWidget {
  const CustomCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return _CustomCategoryLayout();
  }
}

class _CustomCategoryLayout extends StatelessWidget {
  final List<CategoryItem> items = [
    CategoryItem(id: 0,name: 'Gà giòn vui vẻ', image: 'assets/images/funny_chicken.png', color: Color.fromRGBO(207, 0, 15, 1)),
    CategoryItem(id: 1,name: 'Combo bán chạy', image: 'assets/images/combo.png', color: Color.fromRGBO(246 , 199, 76, 1)),
    CategoryItem(id: 2,name: 'Mì sốt bò bầm', image: 'assets/images/noodles.png', color: Color.fromRGBO(225, 134, 52,1)),
    CategoryItem(id: 3,name: 'Món tráng miệng', image: 'assets/images/dessert.png', color: Colors.orangeAccent),
    CategoryItem(id: 4,name: 'Gà giòn vui vẻ', image: 'assets/images/funny_chicken.png', color: Color.fromRGBO(207, 0, 15, 1)),
    CategoryItem(id: 5,name: 'Combo bán chạy', image: 'assets/images/combo.png', color: Color.fromRGBO(246 , 199, 76, 1)),
    CategoryItem(id: 6,name: 'Mì sốt bò bầm', image: 'assets/images/noodles.png', color: Color.fromRGBO(225, 134, 52,1)),
    CategoryItem(id: 7,name: 'Món tráng miệng', image: 'assets/images/dessert.png', color: Colors.orangeAccent),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      alignment: WrapAlignment.spaceEvenly,
      crossAxisAlignment: WrapCrossAlignment.start,
      children: [
        for (var item in items)
          GestureDetector(
            onTap: () {
              // route to category_detail page
              Get.toNamed('/category-detail', arguments: item);
            },
            child: _CustomCategoryItem(item: item),
          ),

      ],
    );
  }
}

class _CustomCategoryItem extends StatelessWidget {
  final CategoryItem item;

  const _CustomCategoryItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: item.color,
            ),
            child: Image.asset(
              item.image,
              width: 50,
              height: 50,
            ),
          ),
          Text(
            item.name,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
