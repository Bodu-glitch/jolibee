import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jolibee/app/modules/layout/controllers/layout_controller.dart';
import 'package:jolibee/app/widgets/custom_carousel_widget.dart';
import 'package:jolibee/app/widgets/custom_product_card.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            const Text('Xin chào, Quan'),
            Text(
              DateTime.now().day.toString() +
                  '/' +
                  DateTime.now().month.toString() +
                  '/' +
                  DateTime.now().year.toString(),
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTy5wll8jerdW3k66iZL2vJrXdn7PJ5aEMywDp_tS-MKcdrLMoKRWE6ZumXWvWMC92QQQtPdjcwq1UGC-YLPdA6bP7fVxMp272Xob0xX3w',
                width: 45,
                height: 45,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
        toolbarHeight: 80,
      ),
      body: HomeBody(),
    );
  }
}

class Category {
  final String name;
  final String imageUrl;
  final int? pageIndex;

  Category({required this.name, required this.imageUrl, this.pageIndex});
}

class HomeBody extends StatelessWidget {
  HomeBody({super.key});

  // layout controller
  final controller = Get.find<LayoutController>();

  final List<Category> imgList = [
    Category(name: 'Khuyến mãi', imageUrl: 'assets/categories/1.png'),
    Category(
      name: 'Thực đơn',
      imageUrl: 'assets/categories/2.png',
      pageIndex: 1,
    ),
    Category(name: 'Đơn hàng gần đây', imageUrl: 'assets/categories/3.png'),
    Category(name: 'Cửa hàng', imageUrl: 'assets/categories/4.png'),
    Category(name: 'Sinh nhật', imageUrl: 'assets/categories/5.png'),
    Category(name: 'Đơn hàng lớn', imageUrl: 'assets/categories/6.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        padding: const EdgeInsets.only(top: 16.0),
        children: [
          CustomCarouselWidget(),
          const SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Wrap(
              spacing: 10,
              alignment: WrapAlignment.spaceBetween,
              children:
                  imgList.map((i) {
                    return GestureDetector(
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.1,
                              blurRadius: 5,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        height: 150,
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(i.imageUrl),
                              ),
                              Text(
                                i.name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () => {controller.changePage(i.pageIndex ?? 0)},
                    );
                  }).toList(),
            ),
          ),
          CustomProductCard(),
        ],
      ),
    );
  }
}
