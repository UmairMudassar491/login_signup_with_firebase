import 'package:flutter/material.dart';
import '../../../Helpers/helper_function.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 4),
      () {
        getUserLoggedInStatus().then((value) {
          if (_isSignedIn) {
            Navigator.pushNamedAndRemoveUntil(
                context, "/Home", (route) => false);
          } else {
            Navigator.pushNamedAndRemoveUntil(
                context, "/Welcome", (route) => false);
          }
        });
      },
    );
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
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: CircularProgressIndicator.adaptive(),
            )
          ],
        ),
      ),
    );
  }

  Future<void> getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        _isSignedIn = value;
      }
    });
  }
}
