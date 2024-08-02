import 'package:get/get.dart';
import 'package:project/utils/db_model.dart';

import '../../../utils/db_helper.dart';

class LikeController extends GetxController {
  Rxn<List<DbModel>> productList = Rxn();

  Future<void> getProductData() async {
    List<DbModel> l1 = await DbHelper.helper.readData();
    productList.value = l1;
  }
}