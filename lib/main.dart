import 'package:ex_01/pages/homePage.dart';
import 'package:ex_01/pages/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: "/",
      routes: {
        '/': (context) => const BaseLayout(body: HomePage()),
        "/result": (context) => BaseLayout(body: ResultPage())
      },
    );
  }
}

class BaseLayout extends StatelessWidget {
  final Widget body;
  const BaseLayout({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Pedra, Papel, Tesoura"),
      ),
      body: body,
    );
  }
}