import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LatihanController extends GetxController {
  final count = 0.obs;
  final storage = GetStorage();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final RxString email = ''.obs;
  RxBool isUjianDone = false.obs;
  RxBool isLatihanDone = false.obs;

  // Fungsi Mengambil Informasi Dari Firestore
  Future<void> _load() async {
    User? user = _auth.currentUser;
    if (user != null) {
      email.value = user.email ?? 'Email tidak ditemukan';
    }
    // Mendapatkan Dokumen Status Ujian
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var docL = firestore.collection("status").doc("latihan");
    var docU = firestore.collection("status").doc("ujian");
    docL.get().then(
      (value) {
        var data = value.data();
        try {
          isLatihanDone.value = data![email.value];
        } catch (err) {
          printError(info: "does not exist");
        }
      },
    );
    docU.get().then(
      (value) {
        var data = value.data();
        try {
          isUjianDone.value = data![email.value];
        } catch (err) {
          printError(info: "does not exist");
        }
      },
    );
    // Memuat Status Ujian dari Penyimpanan Lokal
    String? isUjianString = storage.read(email.value + "_ujian");
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
