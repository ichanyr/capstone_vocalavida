import 'package:get/get.dart';

import '../controllers/artikulasi_detail_controller.dart';

class ArtikulasiDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArtikulasiDetailController>(
      () => ArtikulasiDetailController(),
    );
  }
}
