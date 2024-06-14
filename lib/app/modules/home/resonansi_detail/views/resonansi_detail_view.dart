import 'package:capstone_vocalavida/app/modules/home/views/components/materi.dart';
import 'package:capstone_vocalavida/app/style/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/resonansi_detail_controller.dart';

class ResonansiDetailView extends GetView<ResonansiDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: offWhite,
        body: MateriDetail(
            title: 'Teknik Resonansi',
            description:
                'Resonansi dalam aktivitas bernyanyi pada dasarnya adalah suatu gejala bunyi yang mengembalikan bunyi ke suatu ruangan lain. Hal ini bisa jadi menimbulkan semacam gema yang dikarenakan adanya pantulan suara yang berasal dari ruangan dengan dinding keras.',
            imagePath: 'assets/images/resonansiDetail.png',
            content:
                '''Resonansi dapat dibentuk secara alami dan menghasilkan suara yang nyaring apabila dilakukan latihan dengan optimal. Hal ini dikarenakan suara yang yang berasal dari pita suara hanya memiliki ukuran 1,5 sampai 2 cm saja atau bisa dikatakan sangat lemah.
Ada empat rongga resonansi yang dimiliki pada tubuh manusia, di antaranya yaitu:

1. Resonan atas atau langit-langit keras (nasal cavities), semua rongga yang terletak di atas mulut dan tenggorokan pada kepala manusia.
2. Resonan tengah, rongga yang terletak pada mulut dan bagian belakang mulut atau biasa disebut faring.
3. Resonan bawah yakni dada.
4. Resonan yang bentuknya tidak bisa diubah terletak pada rongga dahi, rongga tulang baji, rongga tulang saringan, rongga rahang.


'''));
  }
}
