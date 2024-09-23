import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_list/pages/home_screen.dart';
import 'package:to_list/provider/todo_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TodoProvider(),
    child: const MyApp(),
  ));
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
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
