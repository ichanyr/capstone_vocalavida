import 'package:capstone_vocalavida/app/style/text_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../style/colors.dart';
import '../controllers/home_controller.dart';
import 'components/custom_card.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: offWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selamat Datang',
                        style: semibold.copyWith(fontSize: 32, color: blueWood),
                      ),
                      Text(
                        'Hardline Scott',
                        style: semibold.copyWith(fontSize: 20, color: mistBlue),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('images/avatar.png'),
                  ),
                ],
              ),
              SizedBox(height: 42),
              Text(
                'Materi',
                style: semibold.copyWith(fontSize: 20, color: blueWood),
              ),
              SizedBox(height: 22),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomCard(
                        imagePath: 'assets/images/pernapasan.png',
                        title: 'Teknik Pernapasan',
                        description:
                            'Pernapasan yang baik adalah dasar dari teknik vokal yang solid. Modul ini mengajarkan cara mengontrol pernapasan agar dapat menyanyikan nada dengan stabil dan kuat.',
                      ),
                      SizedBox(height: 8),
                      CustomCard(
                          imagePath: 'assets/images/artikulasi.png',
                          title: 'Teknik Artikulasi',
                          description:
                              'Teknik artikulasi yang baik adalah kunci dalam komunikasi verbal yang efektif. Modul ini mengajarkan cara mengucapkan kata-kata dengan jelas dan tepat.'),
                      SizedBox(height: 8),
                      CustomCard(
                          imagePath: 'assets/images/resonansi.png',
                          title: 'Teknik Resonansi',
                          description:
                              'Resonansi adalah kunci untuk suara yang penuh dan kuat. Modul ini mengajarkan cara menggunakan resonansi untuk memaksimalkan kualitas suara.'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
