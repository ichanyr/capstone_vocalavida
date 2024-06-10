import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../style/colors.dart';
import '../../../style/text_style.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: offWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.userName.value,
                            style: semibold.copyWith(
                                fontSize: 32, color: blueWood),
                          ),
                          Text(
                            controller.email.value,
                            style:
                                regular.copyWith(fontSize: 20, color: blueWood),
                          ),
                        ],
                      );
                    }),
                    Obx(() {
                      return CircleAvatar(
                        radius: 40,
                        backgroundImage: controller.photoURL.isNotEmpty
                            ? NetworkImage(controller.photoURL.value)
                            : AssetImage('assets/images/ava.png')
                                as ImageProvider,
                      );
                    }),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => controller.pickImage(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Ganti Foto Profil',
                                style: semibold.copyWith(
                                  fontSize: 16,
                                )),
                            Icon(Icons.arrow_forward_ios,
                                color: Colors.grey, size: 16),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Divider(
                        thickness: 1,
                        color: lightGrey,
                      ),
                      SizedBox(height: 8),
                      GestureDetector(
                        onTap: () => _showChangePasswordDialog(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Ganti Sandi',
                                style: semibold.copyWith(
                                  fontSize: 16,
                                )),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Container(
                  height: 61,
                  width: 267,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ultramarineBlue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Text('Keluar Akun',
                        style: semibold.copyWith(fontSize: 20, color: white)),
                    onPressed: () => controller.logout(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showChangePasswordDialog(BuildContext context) {
    final TextEditingController _passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ganti Sandi'),
          content: TextField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Password Baru'),
            obscureText: true,
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Batal'),
              onPressed: () {
                Get.back();
              },
            ),
            TextButton(
              child: Text('Ganti'),
              onPressed: () {
                controller.changePassword(_passwordController.text.trim());
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
