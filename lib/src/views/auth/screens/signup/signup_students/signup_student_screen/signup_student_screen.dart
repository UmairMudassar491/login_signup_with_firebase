import 'package:flutter/material.dart';
import 'package:online_quran_learning/src/constants/sizes.dart';
import 'package:online_quran_learning/src/views/auth/screens/signup/signup_students/signup_student_widgets/signup_student_form_widget.dart';
import 'package:online_quran_learning/src/views/auth/screens/signup/signup_students/signup_student_widgets/signup_student_header_widget.dart';

class SignUpStudentScreen extends StatelessWidget {
  const SignUpStudentScreen({super.key});

  Future<bool> onpop() async {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: WillPopScope(
        onWillPop: onpop,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(mDefaultSize),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SignUpStudentHeaderWidget(size: size),
                    const SignUpStudentFormWidget(),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
