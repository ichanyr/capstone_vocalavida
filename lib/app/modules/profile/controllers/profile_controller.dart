import 'dart:io';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../login/controllers/login_controller.dart';

class ProfileController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();

  // Observable untuk mengatur gambar profil dan status operasi
  final Rx<File?> profileImage = Rx<File?>(null);
  final RxBool isLoading = false.obs;
  final RxString userName = ''.obs;
  final RxString email = ''.obs;
  final RxString photoURL = ''.obs;

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

  // Fungsi untuk logout
  Future<void> logout() async {
    try {
      Get.find<LoginController>().logout();
      Get.snackbar('Sukses', 'berhasil Keluar');
    } catch (e) {
      Get.snackbar('Error', 'Gagal Keluar: $e');
    }
  }

  // Fungsi untuk memilih gambar dari galeri
  Future<void> pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        profileImage.value = File(pickedFile.path);
        await uploadProfilePhoto();
      } else {
        Get.snackbar('Error', 'Tidak ada gambar yang dipilih');
      }
    } catch (e) {
      Get.snackbar('Error', 'Gagal memilih gambar: $e');
    }
  }

  // Fungsi untuk mengganti password
  Future<void> changePassword(String newPassword) async {
    isLoading.value = true;
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.updatePassword(newPassword);
        Get.snackbar('Sukses', 'Password berhasil diubah');
      }
    } catch (e) {
      Get.snackbar('Error', 'Gagal mengubah password: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Fungsi untuk mengunggah gambar profil
  Future<void> uploadProfilePhoto() async {
    if (profileImage.value != null) {
      isLoading.value = true;
      try {
        User? user = _auth.currentUser;
        if (user != null) {
          String uid = user.uid;
          Reference ref = _storage.ref().child('profile_photos').child(uid);
          await ref.putFile(profileImage.value!);
          String uploadedPhotoURL = await ref.getDownloadURL();
          await user.updatePhotoURL(uploadedPhotoURL);
          photoURL.value = uploadedPhotoURL; // Simpan URL gambar di Observable
          Get.snackbar('Sukses', 'Foto profil berhasil diubah');
        }
      } catch (e) {
        Get.snackbar('Error', 'Gagal mengubah foto profil: $e');
      } finally {
        isLoading.value = false;
      }
    } else {
      Get.snackbar('Error', 'Silakan pilih foto terlebih dahulu');
    }
  }
}
