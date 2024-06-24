import 'package:capstone_vocalavida/app/modules/home/views/components/materi.dart';
import 'package:capstone_vocalavida/app/routes/app_pages.dart';
import 'package:capstone_vocalavida/app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart'; // Import the services package for clipboard access

import '../../../../style/text_style.dart';
import '../controllers/artikulasi_detail_controller.dart';

class ArtikulasiDetailView extends GetView<ArtikulasiDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: offWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MateriDetail(
              title: 'Teknik Artikulasi',
              description:
                  'Teknik artikulasi pada dasar dapat diartikan sebagai jenis teknik vokal dalam melakukan perubahan saluran di ruang rongga udara. Hal itu dimaksudkan agar seorang penyanyi bisa menghasilkan bunyi atau suara yang lebih jelas.',
              imagePath: 'assets/images/artikulasiDetail.png',
              content: '''
Berikut ini adalah beberapa faktor yang perlu diperhatikan agar bisa menguasai teknik artikulasi dengan baik dan benar, sehingga pendengar mampu merasakan pesan dari sebuah lagu yang dinyanyikan, faktor tersebut diantaranya sikap badan, posisi mulut, latihan vokalisis, pembentukan bunyi vokal dan konsonan.

1. Kepala tegak dan pandangan ke depan.
2. Tulang punggung lurus.
3. Dada agak membusung atau ke depan.
4. Kaki terpancang kukuh di lantai dan sedikit lebar.

Selain itu, posisi mulut juga mempengaruhi kualitas suara penyanyi. Beberapa tips posisi dan bentuk mulut yang tepat adalah:

1. Mulut dibuka selebar tiga jari secara vertikal atau membentuk mulut elips.
2. Gigi seri atas tertutup setengah bagian dengan bibir atas.
3. Bibir bawah ditekan pada gigi seri bawah.
4. Aliran udara diarahkan ke langit-langit keras.
5. Langit-langit lunak dan anak lidah ditarik ke atas.

Latihan vokalisis membantu memelihara dan menyempurnakan huruf vokal dan konsonan, sementara teknik pembentukan bunyi vokal bergantung pada posisi bibir dan lidah. Sedangkan untuk teknik pembentukan bunyi konsonan, peran lidah sebagai artikulator harus diatur dengan baik.

Ini penting untuk menciptakan suara yang bulat, merdu, dan indah.
''',
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: _buildYouTubeLink(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildYouTubeLink() {
    return InkWell(
      onTap: () =>
          _copyToClipboard('https://youtu.be/zb_lVBSiTs4?si=nYKJ20tmkB5-Ui30'),
      child: Text(
        'Salin link video tutorial YouTube',
        style: TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  void _copyToClipboard(String url) {
    Clipboard.setData(ClipboardData(text: url));
    Get.snackbar(
      'Link Disalin',
      'Link YouTube telah disalin ke clipboard.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black.withOpacity(0.5),
      colorText: Colors.white,
    );
  }
}
