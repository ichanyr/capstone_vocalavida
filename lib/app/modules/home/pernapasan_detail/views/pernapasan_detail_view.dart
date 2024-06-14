import 'package:capstone_vocalavida/app/modules/home/views/components/materi.dart';
import 'package:capstone_vocalavida/app/style/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pernapasan_detail_controller.dart';

class PernapasanDetailView extends GetView<PernapasanDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: offWhite,
      body: MateriDetail(
        title: 'Teknik Pernapasan',
        description:
            'Pernapasan yang baik adalah dasar dari teknik vokal yang solid. Modul ini mengajarkan cara mengontrol pernapasan agar dapat menyanyikan nada dengan stabil dan kuat.',
        imagePath: 'assets/images/pernapasanDetail.png',
        content:
            '''Dalam bernyanyi, pernapasan menjadi salah satu teknik vokal yang berperan penting sehingga perlu untuk dilatih secara rutin dan berkelanjutan. Hal itu disebabkan karena seorang penyanyi akan lebih memerlukan banyak udara yang keluar dan masuk melalui paru-paru. Sebaliknya, apabila seorang penyanyi tidak melatih pernapasan secara rutin dan konsisten, maka akan sangat berakibat pada ketahanan daya tahan tubuh. Tentunya hal ini dapat menjadikan lagu yang dinyanyikan menjadi mudah terjeda atau terputus.

Berikut ini adalah 3 jenis teknik pernapasan yang perlu penyanyi kuasai dalam bernyanyi, di antaranya yaitu:

1. Pernapasan dada
   Pernapasan dada dapat dilakukan dengan cara menghirup udara ke dalam paru-paru dan menempatkannya pada bagian atas. Pernapasan dada bisa dikatakan juga sebagai napas pendek dan tidak cocok dipakai saat bernyanyi. Jenis pernapasan ini sering digunakan dalam menyanyikan lagu yang memiliki nada-nada rendah. Walaupun begitu, penyanyi yang menggunakan pernapasan dada akan lebih mudah kehabisan napas ketika bernyanyi.

2. Pernapasan perut
   Pernapasan perut merupakan pernapasan yang bisa menghasilkan suara menjadi lebih keras, namun, tidak cukup bagus apabila digunakan pada saat bernyanyi. Hal ini disebabkan karena pernapasan perut dilakukan dengan cara menghirup udara untuk kemudian dimasukkan dan ditahan dalam rongga perut hingga mengembang besar. Selain itu, teknik pernapasan jenis ini kurang efektif dikarenakan membuat paru-paru menjadi lebih sempit sehingga udara yang masuk menjadi lebih cepat keluar dan mengakibatkan penyanyi mudah kehabisan napas.

3. Pernapasan diafragma
   Teknik pernapasan terbaik yang paling sering digunakan oleh penyanyi adalah pernapasan diafragma. Pada pernapasan diafragma, penyanyi mampu mendapatkan udara lebih banyak, sehingga membuat napas menjadi lebih panjang dan kontrol udara menjadi lebih mudah. Pada pernapasan diafragma, napas yang dikeluarkan dapat dikontrol dengan sadar oleh diafragma dan otot bagian kiri. Ketika diafragma menegang dan lurus, secara otomatis rongga perut dan rongga dada menjadi lebih longgar. Pada saat seperti itu, volume menjadi bertambah sehingga membuat tekanan berkurang dan udara bisa masuk ke paru-paru lebih banyak.
''',
      ),
    );
  }
}
