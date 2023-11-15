import 'package:flutter/material.dart';
import 'package:login_signup/src/constants/image_string.dart';
import 'package:login_signup/src/views/auth/screens/header/login_signup_header_widget.dart';
import 'package:login_signup/src/views/auth/screens/signup/signup_students/signup_student_widgets/signup_student_form_widget.dart';
import 'package:login_signup/src/widgets/cardview/cardview_widget.dart';

class SignUpStudentScreen extends StatelessWidget {
  const SignUpStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(mBackground2),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                LoginSignupHeader(
                  width: width,
                  height: height * 0.10,
                  header: 'Student SignUp',
                  backAction: () => Navigator.of(context).pop(),
                ),
                Center(
                  child: SizedBox(
                    width: width * 0.9,
                    height: height * 0.72,
                    child: CardviewWidget(
                      borderRadius: BorderRadius.circular(25),
                      child: const SignUpStudentFormWidget(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // return SafeArea(
    //   child: WillPopScope(
    //     onWillPop: onpop,
    //     child: Scaffold(
    //       body: SingleChildScrollView(
    //         child: Container(
    //             padding: const EdgeInsets.all(mDefaultSize),
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //                 SignUpStudentHeaderWidget(size: size),
    //                 const SignUpStudentFormWidget(),
    //               ],
    //             )),
    //       ),
    //     ),
    //   ),
    // );
  }
}
