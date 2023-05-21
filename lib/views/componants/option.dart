// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:quiz/controller/quiz_controller.dart';

import '../../color.dart';

class Option extends StatelessWidget {
  const Option({
    Key? key,
    required this.optionText,
    required this.optIndex,
    required this.onTap,
  }) : super(key: key);
  final String optionText;
  final int optIndex;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(builder: (controller) {
      Color getOptionColor() {
        if (controller.isAnswered) {
          if (optIndex == controller.correctAns) {
            return AppColor.kGreenColor;
          } else if (optIndex == controller.selectedAns &&
              controller.selectedAns != controller.correctAns) {
            return AppColor.kRedColor;
          }
        }
        return AppColor.kGrayColor;
      }

      IconData getIcon() {
     return   getOptionColor() == AppColor.kRedColor ? Icons.close : Icons.done;
      }

      return InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 55,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: getOptionColor())),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             
              Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                    color: getOptionColor() == AppColor.kGrayColor
                        ? Colors.transparent
                        : getOptionColor(),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: getOptionColor() == AppColor.kGrayColor
                            ? AppColor.kGrayColor
                            : getOptionColor())),
                child:  Center(
                    child: Icon(
                  getOptionColor()==AppColor.kGrayColor?null:getIcon(),
                  color: Colors.white,
                )),
              ),
               Text(
                ' ${optIndex + 1}. ${optionText} ',
                textDirection: TextDirection.rtl,
                style:
                    const TextStyle(color: AppColor.kBlackColor, fontSize: 20),
              ),
            ],
          ),
        ),
      );
    });
  }
}
