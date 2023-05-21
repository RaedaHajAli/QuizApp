import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/controller/quiz_controller.dart';

import '../../color.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(builder: (controller) {
      return Container(
        width: double.infinity,
        height: 26,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColor.kGrayColor, width: 0.5)),
            child: Stack(
              children: [
                 LayoutBuilder(
                   builder: (context,constraints) {
                     return Container(
        
          width:constraints.maxWidth*controller.animation.value ,
          
          decoration: BoxDecoration(
            gradient: AppColor.kPrimaryGradient,
            borderRadius: BorderRadius.circular(15) ,
            border:Border.all(color: Colors.white,width: 0.5)
          ),
          
              
        );
                   }
                 ),
         Positioned.fill(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${(controller.animation.value*60).round()} sec',
                style: const TextStyle(color: Colors.white),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.timer_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              )
            ],
          ),
        ),
      )

              ],
            ),
      );
     
    });
  }
}
