import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:quiz/controller/quiz_controller.dart';
import 'package:quiz/views/componants/progress_indicator.dart';
import 'package:quiz/views/componants/question_card.dart';

import '../../color.dart';

class QuizBody extends StatelessWidget {
  const QuizBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    QuizController controller = Get.find();

    return Stack(children: [
      SvgPicture.asset(
        'assets/bg.svg',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.maxFinite,
      ),
      SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const ProgressBar(),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() {
                    return RichText(
                        text:  TextSpan(
                            text: '${controller.questionList.length}',
                            style:const TextStyle(
                                color: AppColor.kSecondaryColor, fontSize: 25),
                            children: [
                          TextSpan(
                             text: '/${controller.quesNum} السؤال',
                            style:const TextStyle(
                                color: AppColor.kSecondaryColor, fontSize: 30),
                           
                          )
                        ]));
                  }),
                  const Divider(
                    thickness: 1,
                    color: AppColor.kSecondaryColor,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child:
                        QuestionCard(question: controller.questionList[index]),
                  );
                },
                itemCount: controller.questionList.length,
                controller: controller.pageController,
                onPageChanged: (pageNum) =>
                    controller.updateQuestionNum(pageNum),
                physics: const NeverScrollableScrollPhysics(),
              ),
            )
          ],
        ),
      )
    ]);
  }
}
