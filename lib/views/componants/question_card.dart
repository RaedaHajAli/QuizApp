import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/controller/quiz_controller.dart';

import '../../models/question_model.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.question,
  });
  final QuestionModel question;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(builder: (controller) {
     
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text(
                question.question,
                textDirection: TextDirection.rtl,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.separated(
                itemBuilder: (context, index) {
                  return Option(
                    optIndex: index,
                    optionText: question.options[index],
                    onTap: () {
                      controller.checkAnswer(question, index);
                     
                    },
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: question.options.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ]),
          ),
        ),
      );
    });
  }
}
