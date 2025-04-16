import 'dart:math';

import 'package:get/get.dart';
import 'package:jolibee/app/widgets/custom_category.dart';
import 'package:jolibee/app/widgets/custom_product_card.dart';

class CategoryDetailController extends GetxController {
  //TODO: Implement CategoryDetailController

  final category = Get.arguments as CategoryItem;

  final Map<int, List<ProductCard>> productCards = {
    // gà giòn vui vẻ
    0: [
      ProductCard(
        productId: 1,
        price: 45000,
        description: '1 miếng gà giòn',
        image: 'assets/images/ga.png',
      ),
      ProductCard(
        productId: 2,
        price: 50000,
        description: '2 Miếng Gà Giòn',
        image: 'assets/images/ga.png',
      ),
      ProductCard(
        productId: 3,
        price: 55000,
        description: '4 Miếng Gà Giòn',
        image: 'assets/images/ga.png',
      ),
    ],
    1: [
      ProductCard(
        productId: 1,
        price: 300000,
        description: 'Combo tiệc Sốt cay nóng giòn',
        image: 'assets/images/ga.png',
      ),
      ProductCard(
        productId: 2,
        price: 420000,
        description: 'Combo Luxury Pasta cơm gà chiên xù',
        image: 'assets/images/ga.png',
      ),
      ProductCard(
        productId: 3,
        price: 120000,
        description: 'Combo Măm gà giòn Tặng trà ngon',
        image: 'assets/images/ga.png',
      ),
    ],
  };

  RxList<ProductCard> productList = <ProductCard>[].obs;
  @override
  void onInit() {
    super.onInit();
    print('category: ${category.id}');
    productList.value = productCards[category.id] ?? [];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
