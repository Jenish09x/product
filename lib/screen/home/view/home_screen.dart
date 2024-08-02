import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/screen/home/controller/home_controller.dart';
import 'package:project/screen/detail/view/detail_screen.dart';
import 'package:project/utils/db_model.dart';

import '../../../utils/db_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());
  final TextEditingController txtSearch = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.getApiData();
    txtSearch.addListener(() {
      controller.filterProducts(txtSearch.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('E-Commerce Shop'),
          actions: [IconButton(onPressed: () {
            Get.toNamed("like");
          }, icon: const Icon(Icons.bookmark_add_outlined))],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: txtSearch,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => controller.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: controller.filteredProducts.length,
                        itemBuilder: (context, index) {
                          var product = controller.filteredProducts[index];
                          return ListTile(
                            leading: Image.network("${product.thumbnail}"),
                            title: Text(
                              "${product.title}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              '\$ ${product.price}',
                              style: const TextStyle(),
                            ),
                            trailing: IconButton(
                              onPressed: () async {
                                DbModel model = DbModel(
                                  title: controller
                                      .model.value!.products![index].title,
                                  image: controller
                                      .model.value!.products![index].thumbnail,
                                  detail: controller.model.value!
                                      .products![index].description,
                                  price: controller
                                      .model.value!.products![index].price,
                                );
                                await DbHelper.helper.addData(model);
                              },
                              icon: const Icon(Icons.favorite_border),
                            ),
                            onTap: () {
                              Get.toNamed('detail', arguments: product);
                            },
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
