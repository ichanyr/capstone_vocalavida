import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:capstone_vocalavida/app/routes/app_pages.dart';
import 'package:capstone_vocalavida/app/style/colors.dart';
import '../../../../style/text_style.dart';

class MateriDetail extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final String content;

  const MateriDetail({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Get.offAndToNamed(Routes.MAIN),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    border: Border.all(color: ultramarineBlue, width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      Icons.arrow_back,
                      color: ultramarineBlue,
                      size: 35,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 42),
              Text(
                title,
                style: bold.copyWith(color: blueWood, fontSize: 36),
              ),
              SizedBox(height: 16),
              Text(
                description,
                style: regular.copyWith(fontSize: 15, color: mistBlue),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 36),
              Center(child: Image.asset(imagePath)),
              SizedBox(height: 36),
              Text(
                content,
                style: regular.copyWith(fontSize: 14, color: mistBlue),
                textAlign: TextAlign.justify,
              )
            ],
          ),
        ),
      ),
    );
  }
}
