import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:capstone_vocalavida/app/routes/app_pages.dart';
import 'package:capstone_vocalavida/app/style/colors.dart';

class LatihanDetailController extends GetxController {
  var currentQuestionIndex = 0.obs;
  var selectedAnswerIndex = (-1).obs;

  List<String> questions = [
    "Apa yang dimaksud dengan pernapasan diafragma dalam bernyanyi? ",
    "Mengapa pemanasan vokal penting sebelum menyanyi?",
    "Apa itu artikulasi dalam konteks bernyanyi?",
    "Latihan trilling bibir membantu dalam:",
    "Apa yang dimaksud dengan pitch dalam bernyanyi?"
  ];

  List<List<String>> options = [
    [
      "Pernapasan menggunakan otot dada",
      "Pernapasan yang dangkal dan cepat ",
      "Pernapasan untuk mengontrol aliran udara",
      "Pernapasan hanya melalui hidung"
    ],
    [
      "Untuk menghafal lirik lagu",
      "Untuk melenturkan otot-otot suara dan mencegah cedera",
      "Untuk mempercepat tempo lagu",
      "Untuk memperbesar volume suara"
    ],
    [
      "Kecepatan bernyanyi",
      "Kekuatan suara",
      "Pengucapan kata-kata dengan jelas",
      "Tinggi rendahnya nada suara"
    ],
    [
      "Mengontrol pitch",
      "Melenturkan otot-otot bibir dan wajah",
      "Mengatur tempo",
      " Menghafal lirik"
    ],
    [
      "Volume suara yang dihasilkan",
      "Kecepatan menyanyi",
      "Tinggi rendahnya nada suara",
      "Kejelasan pengucapan lirik"
    ]
  ];

  void nextQuestion() {
    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;
      selectedAnswerIndex.value = -1;
    } else {
      // Tampilkan dialog hasil atau navigasi ke halaman hasil
      Get.dialog(
        AlertDialog(
          title: Center(
            child: Text(
              "Hasil",
              style: TextStyle(
                fontFamily: 'Exo',
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: ultramarineBlue,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  "Selamat kamu berhasil",
                  style: TextStyle(
                    fontFamily: 'Exo',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  "Kamu telah menyelesaikan semua soal",
                  style: TextStyle(
                    fontFamily: 'Exo',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.offAllNamed(Routes.MAIN);
                },
                child: Text(
                  "Selesai",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.red;
                    }
                    return ultramarineBlue;
                  }),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  void selectAnswer(int index) {
    selectedAnswerIndex.value = index;
  }
}
