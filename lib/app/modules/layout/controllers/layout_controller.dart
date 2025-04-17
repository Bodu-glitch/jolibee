import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jolibee/app/modules/cart/views/cart_view.dart';
import 'package:jolibee/app/modules/home/bindings/home_binding.dart';
import 'package:jolibee/app/modules/home/views/home_view.dart';
import 'package:jolibee/app/modules/menu/bindings/menu_binding.dart';
import 'package:jolibee/app/modules/menu/views/menu_view.dart';

class LayoutController extends GetxController {

  static LayoutController get to => Get.find();

  final pages = [HomeView(), MenuView(),CartView()].obs;

  var currentIndex = 0.obs;

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

  void changePage(int index) {
    currentIndex.value = index;
    print('changePage: $index');
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/home')
      return GetPageRoute(
        settings: settings,
        page: () => HomeView(),
        binding: HomeBinding(),
      );

    if (settings.name == '/menu')
      return GetPageRoute(
        settings: settings,
        page: () => const MenuView(),
        binding: MenuBinding(),
      );
    if (settings.name == '/cart')
      return GetPageRoute(
        settings: settings,
        page: () => const CartView(),
        binding: MenuBinding(),
      );

    return null;
  }

}
