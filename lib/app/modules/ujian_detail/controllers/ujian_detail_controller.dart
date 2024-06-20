import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:capstone_vocalavida/app/routes/app_pages.dart';
import 'package:capstone_vocalavida/app/style/colors.dart';
import 'package:get_storage/get_storage.dart';

class UjianDetailController extends GetxController {
  var currentQuestionIndex = 0.obs;
  var selectedAnswerIndex = (-1).obs;
  var score = 0.obs;

  final RxString email = "".obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final storage = GetStorage();

  Future<void> _load() async {
    User? user = _auth.currentUser;
    if (user != null) {
      email.value = user.email ?? 'Email tidak ditemukan';
    }
  }

  @override
  void onInit() {
    _load();
    super.onInit();
  }

  List<String> questions = [
    "Latihan yang melatih pengucapan vokal dan konsonan termasuk dalam...",
    "Menggunakan dinamika dan ekspresi yang tepat dalam bernyanyi membuat penampilan menjadi...",
    "Apa yang dimaksud dengan resonansi dalam bernyanyi?",
    "Latihan humming (mendengung) berguna untuk...",
    "Menggunakan variasi volume suara dalam bernyanyi disebut..."
  ];

  List<List<String>> options = [
    [
      "Latihan pitch",
      "Latihan dinamika",
      "Latihan artikulasi",
      "Latihan pernapasan"
    ],
    [
      "Lebih cepat",
      "Lebih membosankan",
      "Lebih hidup dan menarik",
      "Lebih keras"
    ],
    [
      "Proses mengatur tinggi rendahnya nada suara",
      "Proses menguatkan dan memantulkan suara alami dalam tubuh",
      "Proses menghafal lirik lagu",
      "Proses mempercepat tempo lagu"
    ],
    [
      "Menghafal lirik",
      "Meningkatkan kontrol volume",
      "Memperkuat resonansi dalam tubuh",
      "Menambah kecepatan bernyanyi"
    ],
    ["Pitch", "Artikulasi", "Diksi", "Dinamika"]
  ];

  List<String> correctAnswers = [
    "Latihan artikulasi",
    "Lebih hidup dan menarik",
    "Proses menguatkan dan memantulkan suara alami dalam tubuh",
    "Memperkuat resonansi dalam tubuh",
    "Dinamika"
  ];

  void nextQuestion() {
    if (selectedAnswerIndex.value != -1) {
      if (checkAnswer()) {
        score++;
      }

      if (currentQuestionIndex.value < questions.length - 1) {
        currentQuestionIndex.value++;
        selectedAnswerIndex.value = -1;
      } else {
        // Tampilkan dialog hasil atau navigasi ke halaman hasil
        Get.dialog(
          AlertDialog(
            title: Center(
              child: Text(
                score.value >= 4 ? "Hasil" : "Gagal",
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
                    score.value >= 4 ? Icons.check : Icons.close,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    score.value >= 4
                        ? "Selamat kamu berhasil"
                        : "Maaf kamu belum berhasil",
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
                    score.value >= 4
                        ? "Kamu telah menyelesaikan semua soal"
                        : "Jawaban benar kamu kurang dari 4",
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
                    "Kamu Benar: ${score.value}/${questions.length}",
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
                    var doc = FirebaseFirestore.instance
                        .collection("status")
                        .doc("ujian");
                    doc.set({email.value: true}, SetOptions(merge: true));
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
  }

  bool checkAnswer() {
    return options[currentQuestionIndex.value][selectedAnswerIndex.value] ==
        correctAnswers[currentQuestionIndex.value];
  }

  void selectAnswer(int index) {
    selectedAnswerIndex.value = index;
  }
}
