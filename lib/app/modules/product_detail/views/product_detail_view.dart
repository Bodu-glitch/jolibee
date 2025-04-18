import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jolibee/app/modules/cart/controllers/cart_controller.dart';

import '../controllers/product_detail_controller.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({super.key});



  @override
  Widget build(BuildContext context) {
    // get cart controller
    final CartController cartController = Get.put(CartController());

    return Scaffold(
      appBar: AppBar(),

      body: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.88)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 450,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 20,
                  children: [
                    Image.asset(controller.product.image, height: 280),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 12,
                                children: [
                                  Text(
                                    controller.product.description,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${controller.product.price} đ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromRGBO(207, 0, 15, 1),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              spacing: 20,
                              children: [
                                FilledButton(
                                  onPressed: () {
                                    controller.decreaseQuantity();
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      Color.fromRGBO(207, 0, 15, 1),
                                    ),
                                    padding: MaterialStateProperty.all(
                                      EdgeInsets.zero,
                                    ),
                                    minimumSize: MaterialStateProperty.all(
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
                                    '${controller.quantity.value}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                FilledButton(
                                  onPressed: () {
                                    controller.increaseQuantity();
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      Color.fromRGBO(207, 0, 15, 1),
                                    ),
                                    padding: MaterialStateProperty.all(
                                      EdgeInsets.zero,
                                    ),
                                    minimumSize: MaterialStateProperty.all(
                                      Size(50, 40),
                                    ),
                                  ),
                                  child: Icon(Icons.add, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // separator
              Column(
                spacing: 20,
                children: [
                  Container(height: 1, color: Colors.grey.withOpacity(0.5)),
                  Column(
                    spacing: 20,
                    children: [
                      Obx(
                            () => Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Tổng cộng: ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text:
                                '${controller.product.price * controller.quantity.value}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(207, 0, 15, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 50, // Chiều cao lớn hơn
                              child: OutlinedButton(
                                onPressed: () {
                                  cartController.addToCart(controller.product.productId,controller.quantity.value);
                                },
                                child: Text(
                                  'Thêm vào giỏ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromRGBO(207, 0, 15, 1),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: ButtonStyle(
                                  side: MaterialStateProperty.all(
                                    BorderSide(
                                      color: Color.fromRGBO(207, 0, 15, 1),
                                      width: 1.5,
                                    ),
                                  ),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: SizedBox(
                              height: 50, // Chiều cao giống với nút bên trái
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Mua ngay',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromRGBO(207, 0, 15, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
