import 'package:get/get.dart';

import '../controllers/resonansi_detail_controller.dart';

class ResonansiDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResonansiDetailController>(
      () => ResonansiDetailController(),
    );
  }
}
