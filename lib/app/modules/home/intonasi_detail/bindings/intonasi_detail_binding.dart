import 'package:get/get.dart';

import '../controllers/intonasi_detail_controller.dart';

class IntonasiDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntonasiDetailController>(
      () => IntonasiDetailController(),
    );
  }
}
