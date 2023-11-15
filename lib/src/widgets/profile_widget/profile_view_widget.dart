import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView(
      {super.key, required this.data, required this.icon, required this.title});

  final String data, title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(title, style: Theme.of(context).textTheme.titleSmall),
          leading: SizedBox(
            width: 40,
            height: 40,
            child: Icon(icon, color: Colors.teal),
          ),
          trailing: Text(data),
        ),
        Divider(
          color: Colors.teal.withOpacity(0.4),
        )
      ],
    );
  }
}
