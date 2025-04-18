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
    return Obx(
      () =>
          controller.cart.isNotEmpty
              ? ListView.builder(
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
                          child: Column(
                            children: [
                              Row(
                                spacing: 20,
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
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${product.description} x ${controller.cart[product.productId]}',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          softWrap: true,
                                          overflow: TextOverflow.visible,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Giá tiền: ',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              TextSpan(
                                                text:
                                                    '${product.price * controller.cart[product.productId]}đ',
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Color.fromRGBO(
                                                    207,
                                                    0,
                                                    15,
                                                    1,
                                                  ),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              //divider
                              const Divider(
                                height: 20,
                                thickness: 1,
                                color: Colors.grey,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // remove button
                                  FilledButton(
                                    onPressed: () {
                                      controller.removeFromCart(
                                        product.productId,
                                      );
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                            Color.fromRGBO(255, 246, 247, 1.0),
                                          ),
                                      padding: MaterialStateProperty.all(
                                        EdgeInsets.zero,
                                      ),
                                      minimumSize: MaterialStateProperty.all(
                                        Size(50, 40),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.delete,
                                      color: Color.fromRGBO(207, 0, 15, 1),
                                    ),
                                  ),
                                  Row(
                                    spacing: 20,
                                    children: [
                                      FilledButton(
                                        onPressed: () {
                                          controller.decreaseQuantity(
                                            product.productId,
                                          );
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                Color.fromRGBO(207, 0, 15, 1),
                                              ),
                                          padding: MaterialStateProperty.all(
                                            EdgeInsets.zero,
                                          ),
                                          minimumSize:
                                              MaterialStateProperty.all(
                                                Size(50, 40),
                                              ),
                                        ),
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                          size: 20,
                                        ), // Adjust icon size
                                      ),
                                      Obx(
                                        () => Text(
                                          '${controller.cart[product.productId]}',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      FilledButton(
                                        onPressed: () {
                                          controller.increaseQuantity(
                                            product.productId,
                                          );
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                Color.fromRGBO(207, 0, 15, 1),
                                              ),
                                          padding: MaterialStateProperty.all(
                                            EdgeInsets.zero,
                                          ),
                                          minimumSize:
                                              MaterialStateProperty.all(
                                                Size(50, 40),
                                              ),
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                },
              )
              : const Center(
                child: Text(
                  'Chưa có món nào trong giỏ hàng',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
    );
  }
}
