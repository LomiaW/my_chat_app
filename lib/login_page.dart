import 'package:flutter/material.dart';
import 'package:my_chat_app/utils/spaces.dart';
import 'package:my_chat_app/widgets/login_text_field.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:social_media_buttons/social_media_buttons.dart';

class LoginPage extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _mainUrl = "https://github.com/LomiaW";
  final _linkedinUrl = "https://www.linkedin.com/in/lomiawu/";

  LoginPage({super.key});

  void loginUser(context) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      // Navigate to ChatPage on successful login
      Navigator.pushReplacementNamed(context, '/chat',
        arguments: usernameController.text
      );
    } else {
      throw Exception("Login failed!");
    }
  }

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
                if (!await launchUrl(Uri.parse(_mainUrl))) {
                  throw Exception('Could not launch url');
                }
              },
              child: Column(
                children: [
                  const Text('Find me on'),
                  Text(_mainUrl),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialMediaButton.github(url: _mainUrl),
                SocialMediaButton.linkedin(url: _linkedinUrl),
              ],
            )
          ],
        ),
      ),
    );
  }
}
