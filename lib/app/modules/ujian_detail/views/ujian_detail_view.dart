import 'package:capstone_vocalavida/app/modules/ujian_detail/controllers/ujian_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:capstone_vocalavida/app/style/colors.dart'; // Import the colors.dart

class UjianDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UjianDetailController controller = Get.put(UjianDetailController());
    double buttonWidth = MediaQuery.of(context).size.width / 2;

    return Scaffold(
      appBar: AppBar(
        title: Text('Ujian Bernyanyi'),
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
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: StepProgressIndicator(
                    totalSteps: controller.questions.length,
                    currentStep: controller.currentQuestionIndex.value + 1,
                    size: 10,
                    selectedColor: ultramarineBlue,
                    unselectedColor: Colors.grey,
                    roundedEdges: Radius.circular(5),
                  ),
                ),
                SizedBox(height: 40),
                Center(
                  child: Text(
                    controller.questions[controller.currentQuestionIndex.value],
                    style: TextStyle(
                      fontFamily: 'Exo',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                ...List.generate(
                    controller.options[controller.currentQuestionIndex.value]
                        .length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          controller.selectAnswer(index);
                        },
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(
                            BorderSide(
                              color:
                                  controller.selectedAnswerIndex.value == index
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
                          child: Center(
                            child: Text(
                              controller.options[
                                  controller.currentQuestionIndex.value][index],
                              style: TextStyle(
                                fontFamily: 'Exo',
                                fontSize: 20,
                                color: controller.selectedAnswerIndex.value ==
                                        index
                                    ? ultramarineBlue
                                    : Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                Spacer(),
                Center(
                  child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.selectedAnswerIndex.value != -1) {
                          controller.nextQuestion();
                        }
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
                          controller.currentQuestionIndex.value <
                                  controller.questions.length - 1
                              ? "Lanjut"
                              : "Kumpul",
                          style: TextStyle(
                            fontFamily: 'Exo',
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
