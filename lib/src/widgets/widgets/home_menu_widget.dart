import 'package:flutter/material.dart';

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
    return ListTile(
      onTap: onPress,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      shape: const Border(bottom: BorderSide(color: Colors.teal)),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.teal),
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.white,
        ),
        child: Icon(
          icon,
          color: Colors.teal,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium?.apply(color: textColor),
      ),
      trailing: endIcon
          // ignore: sized_box_for_whitespace
          ? Container(
              width: 30,
              height: 30,
              child: const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 18.0,
                color: Colors.teal,
              ),
            )
          : null,
    );
  }
}
