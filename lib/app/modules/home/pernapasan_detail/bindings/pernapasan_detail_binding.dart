import 'package:get/get.dart';

import '../controllers/pernapasan_detail_controller.dart';

class PernapasanDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PernapasanDetailController>(
      () => PernapasanDetailController(),
    );
  }
}
