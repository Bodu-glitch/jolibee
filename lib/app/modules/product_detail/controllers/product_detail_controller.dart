import 'package:get/get.dart';
import 'package:jolibee/app/widgets/custom_product_card.dart';

class ProductDetailController extends GetxController {
  //TODO: Implement ProductDetailController

  final product = Get.arguments as ProductCard;

  final count = 0.obs;

  RxInt quantity = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void decreaseQuantity () {
    if (quantity.value > 0) {
      quantity.value--;
    }
  }
  void increaseQuantity () {
    quantity.value++;
  }
}
