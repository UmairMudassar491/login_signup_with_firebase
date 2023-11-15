import 'package:flutter/material.dart';
import 'package:online_quran_learning/src/constants/image_string.dart';
import 'package:online_quran_learning/src/constants/text_string.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({super.key, required this.size});
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
