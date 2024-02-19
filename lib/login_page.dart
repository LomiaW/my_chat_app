import 'package:flutter/material.dart';
import 'package:my_chat_app/services/auth_service.dart';
import 'package:my_chat_app/utils/spaces.dart';
import 'package:my_chat_app/widgets/login_text_field.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:social_media_buttons/social_media_buttons.dart';

class LoginPage extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _mainUrl = "https://github.com/LomiaW";
  final _linkedinUrl = "https://www.linkedin.com/in/lomiawu/";

  LoginPage({super.key});

  Future<void> loginUser(BuildContext context) async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      context.read<AuthService>().loginUser(usernameController.text);

      // Navigate to ChatPage on successful login
      Navigator.pushReplacementNamed(context, '/chat',
          arguments: usernameController.text);
    } else {
      throw Exception("Login failed!");
    }
  }

  Widget _buildHeader(context) {
    return Column(
      children: [
        const Text('Let\'s sign you in!',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5)),
        const Text(
          'Welcome back!\nYou\'ve been missed!',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              color: Colors.blueGrey,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2),
        ),
        verticalSpacing(12),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            image: const DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('assets/login_image.jpg')),
          ),
        ),
        verticalSpacing(12),
      ],
    );
  }

  Widget _buildForm(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
          onPressed: () async {
            loginUser(context);
          },
          child: const Text('Login',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              )),
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
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
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: LayoutBuilder(builder: (context, BoxConstraints constraints) {
          if (constraints.maxWidth > 1000) {
            // Render web layout
            return Row(
              children: [
                const Spacer(flex: 1,),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildHeader(context),
                      _buildFooter(),
                    ],
                  ),
                ),
                const Spacer(flex: 1,),
                Expanded(child: _buildForm(context)),
                const Spacer(flex: 1,),
              ],
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildHeader(context),
              _buildForm(context),
              _buildFooter(),
            ],
          );
        }),
      ),
    );
  }
}
