import 'package:flutter/material.dart';
import 'package:login_signup/src/constants/image_string.dart';
import 'package:login_signup/src/constants/text_string.dart';

class SignUpQariHeaderWidget extends StatelessWidget {
  const SignUpQariHeaderWidget({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: const AssetImage(mSplashImage),
          height: size.height * 0.2,
          //width: size.width,
        ),
        Text(
          mLoginTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          mLoginSubTitle,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
