import 'package:flutter/material.dart';
import 'package:my_chat_app/utils/spaces.dart';
import 'package:my_chat_app/widgets/login_text_field.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();
  void loginUser(context) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      print('Username: ' + usernameController.text);
      print('Password: ' + passwordController.text);

      // Navigate to ChatPage on successful login
      Navigator.pushReplacementNamed(context, '/chat',
        arguments: usernameController.text
      );

      print('Login successful!');
    } else {
      print('Login not successful!');
    }
  }

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Let\'s sign you in!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5
              )
            ),
            const Text(
              'Welcome back!\nYou\'ve been missed!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.blueGrey,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2
              ),
            ),
            Image.asset(
              'assets/login_image.jpg',
              width: 350,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  LoginTextField(
                    validator: (value) {
                      if (value != null && value.isNotEmpty && value.length < 5) {
                        return "Your username should be more than 5 characters.";
                      } else if (value != null && value.isEmpty) {
                        return "Please type your username";
                      }
                      return null;
                    },
                    controller: usernameController,
                    hintText: 'Enter your username',
                  ),
                  verticalSpacing(24),
                  LoginTextField(
                    hasAsterisks: true,
                    controller: passwordController,
                    hintText: 'Enter your password',
                  ),
                ],
              ),
            ),
            verticalSpacing(24),
            ElevatedButton(
              onPressed: () {
                loginUser(context);
              },
              child: const Text('Login',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                )
              ),

            ),
            verticalSpacing(24),
            GestureDetector(
              onTap: () async {
                // TODO: Navigate to browser
                print('Link clicked!');
                if (!await launchUrl(Uri.parse('https://github.com/LomiaW'))) {
                  throw Exception('Could not launch url');
                }
              },
              child: const Column(
                children: [
                  Text('Find me on'),
                  Text('https://github.com/LomiaW'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
