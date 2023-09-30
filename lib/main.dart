import 'package:sqlite_example/core.dart';
import 'package:flutter/material.dart';
import 'package:sqlite_example/state_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseService.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: Get.navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ProductListView(),
    );
  }
}
