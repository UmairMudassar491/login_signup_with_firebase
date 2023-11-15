import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../../../Helpers/helper_function.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    initializeFirebase();
  }

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    bool isQariesLoggedIn = await HelperFunctions.getQariLoggedInStatus();
    bool isUsersLoggedIn = await HelperFunctions.getUserLoggedInStatus();

    await Future.delayed(const Duration(seconds: 4));

    setState(() {
      _isLoading = false;
    });

    if (isQariesLoggedIn) {
      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(
          context, "/QariHomePage", (route) => false);
    } else if (isUsersLoggedIn) {
      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(
          context, "/StudentHomePage", (route) => false);
    } else {
      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(context, "/Welcome", (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/quran.png",
              height: MediaQuery.of(context).size.width / 2.5,
              width: MediaQuery.of(context).size.width / 2.5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: _isLoading
                  ? const CircularProgressIndicator.adaptive()
                  : const Text(
                      'Splash Screen',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Colors.teal),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
