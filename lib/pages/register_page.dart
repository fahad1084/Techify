import 'package:flutter/material.dart';
import 'package:techify/services/auth/auth_gate.dart';
import 'package:techify/services/auth/auth_service.dart';
import '../components/my_button.dart';
import '../components/my_textfiield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();

  void register() async {

    // get auth service
    final authService = AuthService();

    // if password match
    if (passwordController.text == confirmpasswordController.text) {
      // try creating user
      try {
        await authService.signUpWithEmailPassword(emailController.text, passwordController.text,);
      }
      // display error
      catch (e) {
        showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
            title: Text(e.toString()),
        ),
        );
      }
    }
    // if password don't match
    else {
      showDialog(
          context: context,
          builder:
      (context) => const AlertDialog(
        title: Text("Password don't match!"),
      ),
      );
    }
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
              "Let's create an account for you",
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

            const SizedBox(height: 15),

            // confirm password text field
            MyTextField(
              controller: confirmpasswordController,
              hintText: "Confirm password",
              obscureText: true,
            ),

            const SizedBox(height: 30),

            // sign Up button
            MyButton(
              text: "Sign Up",
              onTap: register,
            ),

            const SizedBox(height: 25),

            // already have an account? Login here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("already have an account?",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text("Login Here",
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