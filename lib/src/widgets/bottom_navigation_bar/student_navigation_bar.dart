import 'package:flutter/material.dart';
import 'package:login_signup/src/constants/image_string.dart';

class StudentBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const StudentBottomNavigationBar(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.teal),
        BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(10.0),
              child: ImageIcon(
                AssetImage(mVideoLessonIcon),
              ),
            ),
            label: 'Lessons',
            backgroundColor: Colors.teal),
        BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.teal),
        BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Messages',
            backgroundColor: Colors.teal),
      ],
    );
  }
}
