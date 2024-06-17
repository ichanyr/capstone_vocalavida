import 'package:get/get.dart';

import '../controllers/ujian_detail_controller.dart';

class UjianDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UjianDetailController>(
      () => UjianDetailController(),
    );
  }
}
