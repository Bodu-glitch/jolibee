import 'package:get/get.dart';
import 'package:jolibee/app/widgets/custom_product_card.dart';

class CartController extends GetxController {

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
        productId: 4,
        price: 300000,
        description: 'Combo tiệc Sốt cay nóng giòn',
        image: 'assets/images/ga.png',
      ),
      ProductCard(
        productId: 5,
        price: 420000,
        description: 'Combo Luxury Pasta cơm gà chiên xù',
        image: 'assets/images/ga.png',
      ),
      ProductCard(
        productId: 6,
        price: 120000,
        description: 'Combo Măm gà giòn Tặng trà ngon',
        image: 'assets/images/ga.png',
      ),
    ],
  };

  var cart = <int, int>{}.obs;

  selectedProductCards() {
    var selectedProducts = <ProductCard>[];
    cart.forEach((productId, quantity) {
      for (var productList in productCards.values) {
        final product = productList.firstWhere(
              (p) => p.productId == productId,
          orElse: () => ProductCard(
            productId: 0,
            price: 0,
            description: '',
            image: '',
          ),
        );
        selectedProducts.add(product);
      }
    });
    return selectedProducts;
  }

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

  void addToCart(int productId, int quantity) {
    if (cart.containsKey(productId)) {
      cart[productId] = cart[productId]! + quantity;
    } else {
      cart[productId] = quantity;
    }
    print(cart[productId]);
  }

}
