import 'package:flutter/material.dart';
import 'package:techify/components/my_button.dart';
import 'package:techify/components/my_textfiield.dart';
import 'package:techify/services/auth/auth_service.dart';

import 'home_page.dart';

class LogInPage extends StatefulWidget {
  final void Function()? onTap;

  const LogInPage({super.key, required this.onTap});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  // text editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  // login method
  void LogIn() async {
    // get instance of auth service
    final authService = AuthService();

    // try sign in
    try {
      await authService.signInWithEmailPassword(
        emailController.text,
        passwordController.text,
      );
    }

    // display errors
    catch (e) {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
          title: Text("Please enter email and password"),
        ),
      );
    }
  }

  void forgotPw() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text("User tapped forgot password."),
      ), // AlertDialog
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Image.asset(
                'lib/images/logos/logo_1.png',
              width: 400,
              height: 200,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 10),

            // message, app slogan
            Text(
                "Tech Accessories Delivery App",
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
            ),

            const SizedBox(height: 25),

            // email textfield
            MyTextField(
                controller: emailController,
                hintText: "Email",
                obscureText: false,
            ),

            const SizedBox(height: 15),

            // password text field
            MyTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),

            const SizedBox(height: 30),
            // sign in button
            MyButton(
              text: "Sign In",
              onTap: () async {
                try {
                  final authService = AuthService();
                  await authService.signInWithEmailPassword(
                    emailController.text,
                    passwordController.text,
                  );
                  // Navigate to home page on success
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                } catch (e) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Login Failed"),
                      content: Text(e.toString()),
                    ),
                  );
                }
              },
            ),


            const SizedBox(height: 25),

            // not a member? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a Member?",
                  style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text("Register Now",
                      style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                      ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}