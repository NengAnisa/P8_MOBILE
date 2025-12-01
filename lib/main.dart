import 'package:flutter/material.dart';
import 'package:p8/homepage.dart';
import 'package:p8/themeprovider.dart';
import 'package:p8/username_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Themeprovider()),
        ChangeNotifierProvider(create: (_) => UsernameProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Themeprovider>(
      builder: (context, tema, child) {
        return MaterialApp(
          title: 'Demo Tema & Username',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(useMaterial3: true),
          darkTheme: ThemeData.dark(useMaterial3: true),
          themeMode: tema.themeMode,
          home: const Homepage(),
        );
      },
    );
  }
}
