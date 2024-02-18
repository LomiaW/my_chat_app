import 'package:flutter/material.dart';
import 'package:my_chat_app/utils/brand_color.dart';
import 'chat_page.dart';
import 'login_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Chat App',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: BrandColor.primaryColor,
            foregroundColor: Colors.black,
          )
      ),
      home: LoginPage(),
      routes: {
        '/chat': (context) => ChatPage(),
      },
    );
  }
}
