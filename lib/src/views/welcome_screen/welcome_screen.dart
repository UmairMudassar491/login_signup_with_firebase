import 'package:flutter/material.dart';
import 'package:login_signup/src/constants/image_string.dart';
import 'package:login_signup/src/constants/text_string.dart';
import 'package:login_signup/src/widgets/buttons_widgets/btn_elevated_widget.dart';
import 'package:login_signup/src/widgets/buttons_widgets/btn_outlined.dart';
import 'package:login_signup/src/widgets/cardview/cardview_widget.dart';
import 'package:login_signup/src/widgets/radio_button_widget/radio_button_widget.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _isTeacherSelected = false;
  bool _isStudentSelected = false;

  void _handleTeacherSelected() {
    setState(() {
      _isTeacherSelected = true;
      _isStudentSelected = false;
    });
  }

  void _handleStudentSelected() {
    setState(() {
      _isTeacherSelected = false;
      _isStudentSelected = true;
    });
  }

  void _navigateToLoginPage() {
    if (_isTeacherSelected) {
      Navigator.pushNamed(context, "/QariLogin");
    } else if (_isStudentSelected) {
      Navigator.pushNamed(context, "/StudentLogin");
    }
  }

  void _navigateToSignupPage() {
    if (_isTeacherSelected) {
      Navigator.pushNamed(context, "/SignupQari");
    } else if (_isStudentSelected) {
      Navigator.pushNamed(context, "/SignupStudent");
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(mBackground2),
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(
            children: [
              Container(
                width: width,
                height: height * 0.10,
                margin: const EdgeInsets.only(top: 50),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                        children: <TextSpan>[
                          TextSpan(
                              text: mWelcomeScreenTitle1,
                              style: TextStyle(color: Colors.white)),
                          TextSpan(
                              text: mWelcomeScreenTitle2,
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      mWelcomeScreenSubTitle,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Center(
                  child: SizedBox(
                width: width * 0.9,
                height: height * 0.5,
                child: CardviewWidget(
                  borderRadius: BorderRadius.circular(25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BtnOutlinedWidget(
                        width: width * 0.7,
                        height: height * 0.1,
                        onPressed: () => _navigateToSignupPage(),
                        btnText: mSignUp,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BtnElevatedWidget(
                        width: width * 0.7,
                        height: height * 0.1,
                        onPressed: () => _navigateToLoginPage(),
                        child: const Text(mLogin),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RadioButtonWidget(
                            label: 'Teacher',
                            isSelected: _isTeacherSelected,
                            onPressed: _handleTeacherSelected,
                          ),
                          RadioButtonWidget(
                            label: 'Student',
                            isSelected: _isStudentSelected,
                            onPressed: _handleStudentSelected,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
