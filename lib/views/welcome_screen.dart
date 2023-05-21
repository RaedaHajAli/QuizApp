import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz/color.dart';
import 'package:quiz/views/quiz_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController nameController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
   
      body: Stack(
        children: [
       
          SvgPicture.asset(
            'assets/bg.svg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.maxFinite,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                  ),
                  RichText(
                    textDirection: TextDirection.rtl,
                      text: const TextSpan(
                        
                          text: 'دعنا نختبر معلوماتك',
                          
                          
                          style: TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                       
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 8,
                  ),
                  TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    validator: (value) {
                      if (value?.isEmpty ?? false) {
                        return 'يجب أن تدخل اسمك في الحقل';
                      } else {
                        return null;
                      }
                    },
                    style: const TextStyle(color: Colors.white,),
                    cursorColor: const Color(0xFF00FFCB),
                    decoration: InputDecoration(
                      hintText: 'أدخل اسمك هنا',
                      hintStyle: const TextStyle(color: Colors.white,),
                      filled: true,
                      fillColor: const Color(0xFF1C2341),
                      
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color:  Color(0xFF00FFCB)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
                  ),
                  InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        print('Start');
                        Get.to(()=> const QuizScreen(),
                  
                        );
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                      }
                    },
                    child: Center(
                      child: Container(
                        width:MediaQuery.of(context).size.width / 2,
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            gradient: AppColor.kPrimaryGradient),
                        alignment: Alignment.center,
                        child: Text(
                          'ابدأ'.toUpperCase(),
                          style:
                              const TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
