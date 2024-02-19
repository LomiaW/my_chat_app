import 'package:flutter/material.dart';
import 'package:my_chat_app/services/auth_service.dart';
import 'package:my_chat_app/utils/brand_color.dart';
import 'package:provider/provider.dart';
import 'chat_page.dart';
import 'login_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthService.init();
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => AuthService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Chat App',
      theme: ThemeData(
        canvasColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          backgroundColor: BrandColor.primaryColor,
          foregroundColor: Colors.black,
        )
      ),
      home: FutureBuilder<bool>(
        future: context.read<AuthService>().isLoggedIn(),
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && snapshot.data!) {
              return ChatPage();
            } else {
              return LoginPage();
            }
          }
          return const CircularProgressIndicator();
        },
      ),
      routes: {
        '/chat': (context) => ChatPage(),
      },
    );
  }
}
