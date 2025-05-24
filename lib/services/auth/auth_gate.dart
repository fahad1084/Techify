import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:techify/pages/home_page.dart';
import 'package:techify/services/auth/login_or_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // Show a loading spinner while waiting for the result
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Handle errors in the stream
          if (snapshot.hasError) {
            return const Center(
              child: Text("Something went wrong. Please try again."),
            );
          }

          // User is logged in
          if (snapshot.hasData) {
            return const HomePage();
          }

          // User is not logged in
          return const LoginOrRegister();
        },
      ),
    );
  }
}
