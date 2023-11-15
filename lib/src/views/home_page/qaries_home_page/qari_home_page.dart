import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/src/views/auth/repository/authantication_repository/database_service.dart';
import 'package:login_signup/src/views/navigations_tabs/qaries_navigation_tabs/qari_home_tab.dart';
import 'package:login_signup/src/views/navigations_tabs/qaries_navigation_tabs/qari_lessons_tab.dart';
import 'package:login_signup/src/views/navigations_tabs/qaries_navigation_tabs/qari_msg_tab.dart';
import 'package:login_signup/src/views/navigations_tabs/qaries_navigation_tabs/qari_search_tab.dart';
import 'package:login_signup/src/widgets/appbar/appbar_widget.dart';
import 'package:login_signup/src/widgets/bottom_navigation_bar/qaries_navigation_bar.dart';
import 'package:login_signup/src/widgets/circuler_image_widget/circuler_image_widget.dart';
import 'package:login_signup/src/widgets/drawer_widget/drawer_widget.dart';

class QariHomePage extends StatefulWidget {
  const QariHomePage({super.key});

  @override
  State<QariHomePage> createState() => _QariHomePageState();
}

class _QariHomePageState extends State<QariHomePage> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  String _getTitle() {
    switch (_currentIndex) {
      case 0:
        return 'Home';
      case 1:
        return 'Lessons';
      case 2:
        return 'SearchMessages';
      case 3:
        return 'Messages';
      default:
        return '';
    }
  }

  final List<Widget> _tabs = [
    const QariHomeTab(),
    const QariLessonsTab(),
    const QariSearchTab(),
    const QariMessagesTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appName(_getTitle()),
        elevation: 0.0,
      ),
      drawer: FutureBuilder<DocumentSnapshot>(
        future: DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
            .getQariesData(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && snapshot.data != null) {
              final data = snapshot.data!.data() as Map<String, dynamic>;
              String userName = data["fullName"] ?? "Default Name";
              String userEmail = data["email"] ?? "Default Email";
              return DrawerWidget(
                headerChild: CirculerImageViewWidget(
                  child: data['profileUrl'] == null
                      ? const Icon(
                          Icons.person,
                          size: 40,
                        )
                      : Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            data['profileUrl'],
                          ),
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return const Center(
                                child: CircularProgressIndicator());
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error_outline);
                          },
                        ),
                ),
                userName: userName,
                userEmail: userEmail,
                onBtnPressed: () {
                  Navigator.pushNamed(context, '/QariProfileScreen');
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return const Center(
                child: Text("Somthing went wrong"),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomNavigationBar: QariesBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
      body: _tabs[_currentIndex],
    );
  }
}
