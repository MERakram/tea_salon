import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tea_salon/pages/ProfilePage.dart';
import 'package:tea_salon/pages/login_page.dart';
class ProfileLanding extends StatefulWidget {
  const ProfileLanding({Key? key}) : super(key: key);

  @override
  State<ProfileLanding> createState() => _ProfileLandingState();
}

class _ProfileLandingState extends State<ProfileLanding> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //if loading to log
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } // if a user is athenticated
            else if (snapshot.hasData) {
              return ProfilePage();
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Something went Wrong'),
              );
            } else {
              return Center(child: LoginPage());
            }
          },
        ),
      ),
    );
  }
}