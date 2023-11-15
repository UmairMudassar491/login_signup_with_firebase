import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/src/constants/sizes.dart';
import 'package:login_signup/src/constants/text_string.dart';
import 'package:login_signup/src/views/auth/repository/authantication_repository/auth_repository.dart';
import 'package:login_signup/src/views/auth/repository/authantication_repository/database_service.dart';
import 'package:login_signup/src/views/navigations_tabs/students_navigation_tabs/student_home_tab.dart';
import 'package:login_signup/src/views/navigations_tabs/students_navigation_tabs/student_lessons_tab.dart';
import 'package:login_signup/src/views/navigations_tabs/students_navigation_tabs/student_msg_tab.dart';
import 'package:login_signup/src/views/navigations_tabs/students_navigation_tabs/student_search_tab.dart';
import 'package:login_signup/src/widgets/appbar/appbar_widget.dart';
import 'package:login_signup/src/widgets/bottom_navigation_bar/student_navigation_bar.dart';
import 'package:login_signup/src/widgets/home_widgets/home_menu_widget.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
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
    const StudentHomeTab(),
    const StudentLessonsTab(),
    const StudentSearchTab(),
    const StudentMessagesTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appName(_getTitle()),
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: FutureBuilder<DocumentSnapshot>(
                future:
                    DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                        .getUserData(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      final data =
                          snapshot.data!.data() as Map<String, dynamic>;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: mDefaultSize),
                          Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 3,
                                color: Colors.teal,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
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
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      },
                                      errorBuilder: (context, object, stack) {
                                        // ignore: avoid_unnecessary_containers
                                        return Container(
                                          child:
                                              const Icon(Icons.error_outline),
                                        );
                                      },
                                    ),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            data["fullName"],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            data["email"],
                            textAlign: TextAlign.center,
                            style:
                                const TextStyle(fontWeight: FontWeight.normal),
                          ),
                          const SizedBox(height: 20.0),
                          SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/StudentProfileScreen');
                              },
                              style: ElevatedButton.styleFrom(
                                  side: BorderSide.none,
                                  shape: const StadiumBorder()),
                              child: const Text(mEditProfie,
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          const Divider(color: Colors.teal),
                          const SizedBox(height: 10.0),
                          ProfileMenuWidget(
                            endIcon: true,
                            icon: Icons.settings,
                            onPress: () {},
                            title: 'Setting',
                            textColor: Colors.black,
                          ),
                          const SizedBox(height: 15.0),
                          ProfileMenuWidget(
                            endIcon: true,
                            icon: Icons.logout_outlined,
                            onPress: () async {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text("Logout"),
                                      content: const Text(
                                          "Are you sure you want to logout?"),
                                      actions: [
                                        IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(
                                            Icons.cancel,
                                            color: Colors.red,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () async {
                                            AuthRepository authService =
                                                AuthRepository();
                                            await authService.signOut();
                                            // ignore: use_build_context_synchronously
                                            Navigator.pushNamedAndRemoveUntil(
                                                context,
                                                "/StudentLogin",
                                                (route) => false);
                                          },
                                          icon: const Icon(
                                            Icons.done,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            title: 'Logout',
                            textColor: Colors.black,
                          ),
                        ],
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
                }),
          ),
        ),
      ),
      bottomNavigationBar: StudentBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
      body: _tabs[_currentIndex],
    );
  }
}
