import 'package:flutter/material.dart';
import 'package:online_quran_learning/src/constants/image_string.dart';
import 'package:online_quran_learning/src/constants/sizes.dart';
import 'package:online_quran_learning/src/constants/text_string.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(mDefaultSize),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image: const AssetImage(mSplashImage),
                    height: height * 0.6,
                  ),
                  Column(
                    children: [
                      Text(
                        mWelcomeScreenTitle,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        mWelcomeScreenSubTitle,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, '/Login'),
                            style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Colors.black),
                                padding: const EdgeInsets.symmetric(
                                    vertical: mButtonHeight)),
                            child: Text(mLogin.toUpperCase())),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text(
                                        "Choose Signup",
                                        textAlign: TextAlign.center,
                                      ),
                                      content: SizedBox(
                                        height: 120,
                                        child: Column(
                                          children: [
                                            ListTile(
                                              onTap: () => Navigator.pushNamed(
                                                  context, "/SignupQari"),
                                              // leading: const Icon(
                                              //   Icons.camera_alt_outlined,
                                              //   color: Colors.teal,
                                              // ),
                                              title: const Text(
                                                "Signup as Tutor",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              tileColor: Colors.teal,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            const SizedBox(height: 7.0),
                                            ListTile(
                                              onTap: () => Navigator.pushNamed(
                                                  context, "/SignupStudent"),
                                              // leading: const Icon(
                                              //   Icons.camera_alt_outlined,
                                              //   color: Colors.teal,
                                              // ),
                                              title: const Text(
                                                "Signup as Student",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              tileColor: Colors.teal,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                side: const BorderSide(color: Colors.black),
                                padding: const EdgeInsets.symmetric(
                                    vertical: mButtonHeight)),
                            child: Text(mSignUp.toUpperCase())),
                      )
                    ],
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
