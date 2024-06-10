import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var obsecureText = true.obs;

  Stream<User?> get streamAuthStatus =>
      FirebaseAuth.instance.authStateChanges();

  void logout() async {
    await auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Email dan password tidak boleh kosong.');
      return;
    }

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null) {
        if (userCredential.user!.emailVerified) {
          Get.snackbar('Sukses', 'Pengguna Berhasil Masik');
          Get.offAllNamed(Routes.MAIN);
        } else {
          Get.snackbar('Error', 'Mohon Untuk Memverifikasi Email Anda');
        }
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          Get.snackbar('Error', 'Tidak Pengguna Dengan Email Tersebut.');
          break;
        case 'wrong-password':
          Get.snackbar(
              'Error', 'Kata sandi salah diberikan untuk pengguna itu.');
          break;
        case 'too-many-requests':
          Get.snackbar('Error', 'Terlalu banyak permintaan. Coba lagi nanti.');
          break;
        default:
          Get.snackbar('Error', 'Gagal masuk. Silakan coba lagi.');
          break;
      }
      print(e.code);
    } catch (e) {
      Get.snackbar(
          'Error', 'Terjadi kesalahan yang tidak terduga. Silakan coba lagi.');
      print(e);
    }
  }

  void toggleObsecureText() {
    obsecureText.value = !obsecureText.value;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
