import 'package:flutter/material.dart';
import 'package:login_signup/src/constants/image_string.dart';
import 'package:login_signup/src/views/auth/screens/header/login_signup_header_widget.dart';
import 'package:login_signup/src/views/auth/screens/signup/signup_qari/signup_qari_widgets/signup_qari_form_widget.dart';
import 'package:login_signup/src/widgets/cardview/cardview_widget.dart';

class SignUpQariScreen extends StatelessWidget {
  const SignUpQariScreen({super.key});

  // Future<bool> onpop() async {
  //   return true;
  // }

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
                  header: 'Tutor SignUp',
                  backAction: () => Navigator.of(context).pop(),
                ),
                Center(
                  child: SizedBox(
                    width: width * 0.9,
                    height: height * 0.72,
                    child: CardviewWidget(
                      borderRadius: BorderRadius.circular(25),
                      child: const SignUpQariFormWidget(),
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
