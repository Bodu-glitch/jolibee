import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jolibee/app/modules/cart/controllers/cart_controller.dart';
import 'package:jolibee/app/modules/layout/controllers/layout_controller.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
          scaffoldBackgroundColor: Color.fromRGBO(255, 255, 255, 0.88),
          appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0,
            foregroundColor: Colors.black,
            titleTextStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.black
            )
          ),
          primaryColor: Color.fromRGBO(207, 41, 0, 1),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey
            ),
          ),
          bottomAppBarTheme: BottomAppBarTheme(
            color: Color.fromRGBO(207, 41, 0, 1),
            shape: CircularNotchedRectangle(),
          )
    ),
      initialBinding: AppBinding(),

  ));
}

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LayoutController>(LayoutController(), permanent: true);
    Get.put<CartController>(CartController(), permanent: true);
  }
}
