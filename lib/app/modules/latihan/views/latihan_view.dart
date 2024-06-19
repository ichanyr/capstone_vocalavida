import 'dart:ffi';

import 'package:capstone_vocalavida/app/modules/latihan_detail/views/latihan_detail_view.dart';
import 'package:capstone_vocalavida/app/modules/ujian_detail/views/ujian_detail_view.dart';
import 'package:capstone_vocalavida/app/style/colors.dart';
import 'package:capstone_vocalavida/app/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/latihan_controller.dart';

class LatihanView extends GetView<LatihanController> {
  final controller = Get.put(LatihanController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/Background.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Text(
                  "Latihan & Ujian",
                  style: TextStyle(
                    fontFamily: 'Exo',
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.25),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(LatihanDetailView());
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          controller.isLatihanDone.value
                              ? ultramarineBlue
                              : Color(0xFFEDEDED)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Latihan Soal",
                            style: regular.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: controller.isLatihanDone.value
                                    ? Colors.white
                                    : blueWood),
                          ),
                          controller.isLatihanDone.value
                              ? Icon(
                                  Icons.check,
                                  color: Colors.white,
                                )
                              : Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.25),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Ganti dengan navigasi yang sesuai untuk tombol Ujian
                      Get.to(UjianDetailView());
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          controller.isUjianDone.value
                              ? ultramarineBlue
                              : Color(0xFFEDEDED)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Ujian",
                            style: regular.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: controller.isUjianDone.value
                                    ? Colors.white
                                    : blueWood),
                          ),
                          controller.isUjianDone.value
                              ? Icon(
                                  Icons.check,
                                  color: Colors.white,
                                )
                              : Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
