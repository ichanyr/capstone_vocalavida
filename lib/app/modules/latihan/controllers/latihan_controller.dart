import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LatihanController extends GetxController {
  //TODO: Implement LatihanController

  final count = 0.obs;
  final storage = GetStorage();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final RxString email = ''.obs;
  RxBool isUjianDone = false.obs;
  RxBool isLatihanDone = false.obs;

  Future<void> _load() async {
    User? user = _auth.currentUser;
    if (user != null) {
      email.value = user.email ?? 'Email tidak ditemukan';
    }

    String? isLatihanString = storage.read(email.value + "_latihan");
    String? isUjianString = storage.read(email.value + "_ujian");
    if (isLatihanString != null) {
      isLatihanDone.value = isLatihanString == "true" ? true : false;
    } else {
      storage.write(email.value + "_latihan", "false");
      isLatihanDone.value = false;
    }
    if (isUjianString != null) {
      isUjianDone.value = isUjianString == "true" ? true : false;
    } else {
      storage.write(email.value + "_ujian", "false");
      isUjianDone.value = isUjianString == "true" ? true : false;
      isUjianDone.value = false;
    }
  }

  @override
  void onInit() {
    _load();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
