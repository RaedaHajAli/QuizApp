import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:quiz/controller/quiz_controller.dart';

import 'package:quiz/views/welcome_screen.dart';


import 'componants/quiz_body.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuizController controller = Get.put(QuizController());

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.to(const WelcomeScreen());
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                controller.nextQuestion();
              },
              child: const Text(
                'التالي',
                style: TextStyle(fontSize: 18, color: Colors.white),
              )),
        ],
      ),
      body:const QuizBody(),
    );
  }
}
