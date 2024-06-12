import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class HomeController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Observable untuk mengatur gambar profil dan status operasi
  final Rx<File?> profileImage = Rx<File?>(null);
  final RxBool isLoading = false.obs;
  final RxString userName = ''.obs;
  final RxString email = ''.obs;
  final RxString photoURL = ''.obs;
  final selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _loadUserProfile();
  }

  // Fungsi untuk memuat data profil pengguna saat inisialisasi
  Future<void> _loadUserProfile() async {
    User? user = _auth.currentUser;
    if (user != null) {
      userName.value = user.displayName ?? 'Pengguna';
      email.value = user.email ?? 'Email tidak ditemukan';
      photoURL.value = user.photoURL ?? '';
    }
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  final count = 0.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;
}
