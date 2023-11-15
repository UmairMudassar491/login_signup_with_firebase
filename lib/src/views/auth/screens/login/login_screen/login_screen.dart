import 'package:flutter/material.dart';
import 'package:online_quran_learning/src/constants/sizes.dart';
import 'package:online_quran_learning/src/views/auth/screens/login/login_widgets/login_form_widget.dart';
import 'package:online_quran_learning/src/views/auth/screens/login/login_widgets/login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(mDefaultSize),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                LoginHeaderWidget(size: size),
                const SizedBox(
                  height: mFormHeight - 10,
                ),
                const LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
