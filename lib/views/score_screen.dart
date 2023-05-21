import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz/controller/quiz_controller.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuizController controller = Get.find();
    return Scaffold(
      extendBody: true,
      body: Stack(
  
        children: [
        SvgPicture.asset(
            'assets/bg.svg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.maxFinite,
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              
              children: [
               const Text(
                 'لقد حصلت على ',
                  style: TextStyle(color: Colors.white,fontSize: 45),),
                 const SizedBox(height: 30,),
                  
                  Text(
                      '${controller.result*10}/${controller.questionList.length*10}',
                      style:const TextStyle(color: Colors.white,fontSize: 35))
                     
                
              ],
            ),
          )
      ]),
    );
  }
}