import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/category_detail_controller.dart';

class CategoryDetailView extends GetView<CategoryDetailController> {
  const CategoryDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chọn món'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: controller.productList.length,
            itemBuilder: (context, index){
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8),
                color: Colors.white,
                elevation: 1,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    spacing: 32,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipRRect(
                        child: Image.asset(
                          controller.productList[index].image,
                          height: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.productList[index].description,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${controller.productList[index].price}đ',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromRGBO(207, 0, 15, 1),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            FilledButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Color.fromRGBO(207, 0, 15, 1)),
                              ),
                              onPressed: () {
                              },
                              child: SizedBox(
                                width: double.infinity,
                                child: Center(
                                  child: Text(
                                    'Mua ngay',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              );
            }
        ),
      )
    );
  }
}
