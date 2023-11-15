import 'package:flutter/material.dart';
import 'package:login_signup/src/constants/colors.dart';
import 'package:login_signup/src/constants/image_string.dart';
import 'package:login_signup/src/views/auth/screens/header/login_signup_header_widget.dart';
import 'package:login_signup/src/views/auth/screens/login/student_login/student_login_widgets/student_login_form_widget.dart';
import 'package:login_signup/src/widgets/cardview/cardview_widget.dart';

class StudentLoginScreen extends StatelessWidget {
  const StudentLoginScreen({super.key});

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
                  header: 'Student Login',
                  backAction: () => Navigator.of(context).pop(),
                ),
                SizedBox(
                  width: width,
                  height: height * 0.10,
                  child: const Center(
                    child: Text(
                      'Welcome Back!',
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: width * 0.9,
                    height: height * 0.6,
                    child: CardviewWidget(
                      borderRadius: BorderRadius.circular(25),
                      child: const StudentLoginForm(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
