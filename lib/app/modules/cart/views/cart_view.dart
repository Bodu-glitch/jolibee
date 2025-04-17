import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jolibee/app/modules/category_detail/controllers/category_detail_controller.dart';
import 'package:jolibee/app/modules/category_detail/controllers/category_detail_controller.dart';
import 'package:jolibee/app/modules/product_detail/controllers/product_detail_controller.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Món đã chọn'), centerTitle: true),
      body: CartBody(),
    );
  }
}

class CartBody extends GetView<CartController> {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.selectedProductCards().length,
      itemBuilder: (context, index) {
        final product = controller.selectedProductCards()[index];
        if (product.productId == 0) {
          return const SizedBox.shrink();
        } else {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              color: Colors.white,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  spacing: 20,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              product.image,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Text(
                              '${product.description} x ${controller.cart[product.productId]}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Bên phải
                    Text(
                      '${product.price * controller.cart[product.productId]}đ',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(207, 0, 15, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
