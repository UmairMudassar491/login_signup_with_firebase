import 'package:flutter/material.dart';
import 'package:login_signup/src/constants/colors.dart';

class LoginSignupHeader extends StatelessWidget {
  final String header;
  final Function? backAction;
  final double? width;
  final double? height;
  const LoginSignupHeader(
      {Key? key,
      required this.header,
      this.backAction,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.transparent,
      margin: const EdgeInsets.only(top: 10, left: 5),
      child: Row(
        children: [
          backAction != null
              ? InkWell(
                  onTap: () => backAction!(),
                  child: const Icon(
                    Icons.chevron_left,
                    size: 30,
                    color: whiteColor,
                  ),
                )
              : const SizedBox(),
          const SizedBox(width: 25),
          Text(
            header,
            style: const TextStyle(
              fontSize: 22,
              color: whiteColor,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
