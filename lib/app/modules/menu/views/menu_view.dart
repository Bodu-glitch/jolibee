import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:jolibee/app/modules/menu/controllers/menu_controller.dart';
import 'package:jolibee/app/widgets/custom_category.dart';

class MenuView extends GetView<CustomMenuController> {
  const MenuView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          CustomCategory()
        ],
      )


    );
  }
}
