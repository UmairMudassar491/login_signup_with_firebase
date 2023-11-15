import 'package:flutter/material.dart';
import 'package:login_signup/src/constants/colors.dart';

class ProfileMenuWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    required this.endIcon,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ListTile(
      onTap: onPress,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      shape: const Border(bottom: BorderSide(color: primaryColor)),
      leading: Container(
        width: width * 0.09,
        height: height * 0.09,
        decoration: BoxDecoration(
          border: Border.all(color: primaryColor),
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          icon,
          color: primaryColor,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: endIcon
          ? const SizedBox(
              width: 30,
              height: 30,
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 18.0,
                color: primaryColor,
              ),
            )
          : null,
    );
  }
}
