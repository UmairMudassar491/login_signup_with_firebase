import 'package:flutter/material.dart';
import 'package:online_quran_learning/src/constants/sizes.dart';
import 'package:online_quran_learning/src/views/auth/screens/signup/signup_qari/signup_qari_widgets/signup_qari_form_widget.dart';
import 'package:online_quran_learning/src/views/auth/screens/signup/signup_qari/signup_qari_widgets/signup_qari_header_widget.dart';

class SignUpQariScreen extends StatelessWidget {
  const SignUpQariScreen({super.key});

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
                    SignUpQariHeaderWidget(size: size),
                    const SignUpQariFormWidget(),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
