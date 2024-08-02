import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:project/screen/like/controller/like_controller.dart';

import '../../../utils/db_helper.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({super.key});

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  LikeController controller = Get.put(LikeController());

  @override
  void initState() {
    super.initState();
    controller.getProductData();
    print(controller.productList.value);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("like data"),
          centerTitle: true,
        ),
        body: Obx(
          () => controller.productList.value==null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: controller.productList.value!.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: Image.network(
                        "${controller.productList.value![index].image}"),
                    title:
                        Text("${controller.productList.value![index].title}"),
                    subtitle:
                        Text("${controller.productList.value![index].price}"),
                    trailing: IconButton(
                      onPressed: () async {
                        await DbHelper.helper.deleteData(
                            controller.productList.value![index].id);
                        controller.getProductData();
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
