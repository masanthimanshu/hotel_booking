import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/view/auth/login_screen.dart';
import 'package:hotel_booking/view/navigation/navigation_screen.dart';

class RootElement extends StatelessWidget {
  const RootElement({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const NavigationScreen();
        }

        return const LoginScreen();
      },
    );
  }
}
