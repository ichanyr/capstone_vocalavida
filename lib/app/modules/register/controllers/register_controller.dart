import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  var obscureText = true.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.onClose();
  }

  void register(String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        userCredential.user!.updateDisplayName(nameController.text);
        await userCredential.user!.sendEmailVerification();
        Get.dialog(
          AlertDialog(
            title: Text('Verifikasi Email'),
            content: Text(
              'Silakan verifikasi alamat email Anda untuk melanjutkan. Kami telah mengirimkan tautan verifikasi ke email Anda.',
            ),
            actions: [
              TextButton(
                onPressed: () => Get.offAllNamed(Routes.LOGIN),
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else {
        Get.snackbar('Error', 'Gagal membuat pengguna baru');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('Error', 'Kata sandi yang diberikan terlalu lemah.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Error', 'Akun sudah ada untuk email tersebut.');
      } else {
        Get.snackbar('Error', 'Terjadi kesalahan: ${e.message}');
      }
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    }
  }

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }
}
