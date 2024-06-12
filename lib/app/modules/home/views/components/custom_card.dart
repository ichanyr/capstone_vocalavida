import 'package:capstone_vocalavida/app/style/colors.dart';
import 'package:capstone_vocalavida/app/style/text_style.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final double imageWidth;
  final double imageHeight;

  CustomCard({
    required this.imagePath,
    required this.title,
    required this.description,
    this.titleStyle,
    this.descriptionStyle,
    this.imageWidth = 100,
    this.imageHeight = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: semibold.copyWith(fontSize: 20, color: blueWood),
                      ),
                      SizedBox(height: 12),
                      Text(
                        description,
                        style: regular.copyWith(fontSize: 12, color: onyx),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
