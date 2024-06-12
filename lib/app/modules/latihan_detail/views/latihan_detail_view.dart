import 'package:capstone_vocalavida/app/modules/latihan/views/latihan_view.dart';
import 'package:capstone_vocalavida/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:capstone_vocalavida/app/style/colors.dart'; // Import the colors.dart

import '../controllers/latihan_detail_controller.dart';

class LatihanDetailView extends GetView<LatihanDetailController> {
  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width / 2;
    RxInt selectedButtonIndex = 0.obs;

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: StepProgressIndicator(
                  totalSteps: 5,
                  currentStep: 1,
                  size: 10,
                  selectedColor: ultramarineBlue,
                  unselectedColor: Colors.grey,
                  roundedEdges: Radius.circular(5),
                ),
              ),
              SizedBox(height: 40),
              Text(
                "Facebook Founder",
                style: TextStyle(
                  fontFamily: 'Exo',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Obx(() => Container(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        selectedButtonIndex.value = 1;
                      },
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(
                          BorderSide(
                            color: selectedButtonIndex.value == 1
                                ? ultramarineBlue
                                : Colors.grey,
                          ),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          "Mark Zuckerberg",
                          style: TextStyle(
                            fontFamily: 'Exo',
                            fontSize: 20,
                            color: selectedButtonIndex.value == 1
                                ? ultramarineBlue
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  )),
              SizedBox(height: 10),
              Obx(() => Container(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        selectedButtonIndex.value = 2;
                      },
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(
                          BorderSide(
                            color: selectedButtonIndex.value == 2
                                ? ultramarineBlue
                                : Colors.grey,
                          ),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          "Mark Mark",
                          style: TextStyle(
                            fontFamily: 'Exo',
                            fontSize: 20,
                            color: selectedButtonIndex.value == 2
                                ? ultramarineBlue
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  )),
              SizedBox(height: 10),
              Obx(() => Container(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        selectedButtonIndex.value = 3;
                      },
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(
                          BorderSide(
                            color: selectedButtonIndex.value == 3
                                ? ultramarineBlue
                                : Colors.grey,
                          ),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          "Mark Murkk",
                          style: TextStyle(
                            fontFamily: 'Exo',
                            fontSize: 20,
                            color: selectedButtonIndex.value == 3
                                ? ultramarineBlue
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  )),
              SizedBox(height: 10),
              Obx(() => Container(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        selectedButtonIndex.value = 4;
                      },
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(
                          BorderSide(
                            color: selectedButtonIndex.value == 4
                                ? ultramarineBlue
                                : Colors.grey,
                          ),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          "Mark Murkk",
                          style: TextStyle(
                            fontFamily: 'Exo',
                            fontSize: 20,
                            color: selectedButtonIndex.value == 4
                                ? ultramarineBlue
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  )),
              Spacer(),
              Center(
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return AlertDialog(
                            title: Center(
                                child: Text(
                              "Hasil",
                              style: TextStyle(
                                fontFamily: 'Exo',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
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
                                Text(
                                  "Selamat kamu berhasil",
                                  style: TextStyle(
                                    fontFamily: 'Exo',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Kamu Benar 5 dari 5",
                                  style: TextStyle(
                                    fontFamily: 'Exo',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
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
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color>((states) {
                                      if (states
                                          .contains(MaterialState.pressed)) {
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
                          );
                        },
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(ultramarineBlue),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        "Lanjut",
                        style: TextStyle(
                          fontFamily: 'Exo',
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
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
