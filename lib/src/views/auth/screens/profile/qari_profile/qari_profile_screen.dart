import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_signup/src/constants/sizes.dart';
import 'package:login_signup/src/constants/text_string.dart';
import 'package:login_signup/src/views/auth/repository/authantication_repository/database_service.dart';
import 'package:login_signup/src/widgets/profile_widget/profile_view_widget.dart';

class QariProfileScreen extends StatefulWidget {
  const QariProfileScreen({super.key});

  @override
  State<QariProfileScreen> createState() => _QariProfileScreenState();
}

class _QariProfileScreenState extends State<QariProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text("Profile"),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder<DocumentSnapshot>(
            future: DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                .getQariesData(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  final data = snapshot.data!.data() as Map<String, dynamic>;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Container(
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
                            child: data["profileUrl"] == null
                                ? const Icon(
                                    Icons.person,
                                    size: 40,
                                  )
                                : Image(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      data["profileUrl"],
                                    ),
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    },
                                    errorBuilder: (context, object, stack) {
                                      // ignore: avoid_unnecessary_containers
                                      return Container(
                                        child: const Icon(Icons.error_outline),
                                      );
                                    },
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      ProfileView(
                        title: mFullName,
                        data: data["fullName"],
                        icon: Icons.person,
                      ),
                      ProfileView(
                        title: mEmail,
                        data: data["email"],
                        icon: Icons.email_outlined,
                      ),
                      ProfileView(
                        title: mPhoneNo,
                        data: data["phoneNo"],
                        icon: Icons.phone,
                      ),
                      ProfileView(
                        title: mGender,
                        data: data["gender"],
                        icon: Icons.transgender_sharp,
                      ),
                      ProfileView(
                        title: mLanguage,
                        data: data["language"],
                        icon: Icons.language_sharp,
                      ),
                      ProfileView(
                        title: mCountry,
                        data: data["country"],
                        icon: Icons.location_pin,
                      ),
                      ProfileView(
                        title: mCity,
                        data: data["city"],
                        icon: Icons.location_pin,
                      ),
                      ProfileView(
                        title: mHourlyRate,
                        data: data["hourlyRate"],
                        icon: Icons.currency_exchange_sharp,
                      ),
                      ProfileView(
                        title: mSpecializations,
                        data: data["specializations"],
                        icon: Icons.abc,
                      ),
                      ProfileView(
                        title: mPassword,
                        data: data["password"],
                        icon: Icons.lock,
                      ),
                      const SizedBox(height: mDefaultSize),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/UpdateQariProfile');
                          },
                          style: ElevatedButton.styleFrom(
                            side: BorderSide.none,
                          ),
                          child: const Text(mEditProfie,
                              style: TextStyle(color: Colors.white)),
                        ),
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
            },
          ),
        ),
      ),
    );
  }
}
