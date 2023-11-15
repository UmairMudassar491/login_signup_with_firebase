import 'package:flutter/material.dart';
import 'package:login_signup/src/constants/colors.dart';
import 'package:login_signup/src/views/auth/repository/authantication_repository/auth_repository.dart';
import 'package:login_signup/src/widgets/buttons_widgets/btn_elevated_widget.dart';
import 'package:login_signup/src/widgets/home_widgets/home_menu_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget(
      {super.key,
      required this.headerChild,
      required this.userName,
      required this.userEmail,
      required this.onBtnPressed});

  final Widget headerChild;
  final String userName;
  final String userEmail;
  final VoidCallback onBtnPressed;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          decoration:
              BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text(
                      userName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    accountEmail: Text(
                      userEmail,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    currentAccountPicture: headerChild,
                  ),
                  BtnElevatedWidget(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.08,
                    onPressed: onBtnPressed,
                    child: const Text("Edit Profile"),
                  ),
                  const SizedBox(height: 10.0),
                  const Divider(color: primaryColor),
                  ProfileMenuWidget(
                    endIcon: true,
                    icon: Icons.settings,
                    onPress: () {},
                    title: 'Setting',
                    textColor: Colors.black,
                  ),
                  //const SizedBox(height: 15.0),
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
                            content:
                                const Text("Are you sure you want to logout?"),
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
                                  AuthRepository authService = AuthRepository();
                                  await authService.signOut();
                                  if (!context.mounted) return;
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, "/QariLogin", (route) => false);
                                },
                                icon: const Icon(
                                  Icons.done,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    title: 'Logout',
                    textColor: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
