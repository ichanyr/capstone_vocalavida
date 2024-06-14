import 'package:capstone_vocalavida/app/modules/home/views/components/materi.dart';
import 'package:capstone_vocalavida/app/style/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/intonasi_detail_controller.dart';

class IntonasiDetailView extends GetView<IntonasiDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: offWhite,
        body: MateriDetail(
          title: 'Teknik Intonasi',
          description:
              'Intonasi adalah teknik vokal yang berperan dalam mengatur nada suara yang dihasilkan oleh seorang penyanyi. Modul ini mengajarkan cara mengatur nada suara agar dapat menyanyikan lagu dengan lebih ekspresif dan menarik.',
          imagePath: 'assets/images/intonasiDetail.png',
          content:
              '''Berikut ini adalah beberapa tips yang bisa Kamu gunakan untuk menguasai teknik intonasi dengan baik dan benar, di antaranya yaitu:

1. Latihan bernyanyi dengan tempo yang lambat dan kemudian diubah menjadi tempo yang lebih cepat.
2. Latihan bernyanyi dengan menggunakan tempo yang lebih variatif.
3. Latihan bernyanyi dengan nada yang lebih variatif, bisa dilakukan dengan memulai dari nada rendah ke nada tinggi dan melafalkan artikulasi na, ka, la, dan ra.
''',
        ));
  }
}
