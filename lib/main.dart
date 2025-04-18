import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/screen/api_call_list/api_list_screen.dart';
import 'package:riverpod_practice/screen/favorite/favourite_screen.dart';
import 'package:riverpod_practice/screen/future_provider/future_list_screen.dart';
import 'package:riverpod_practice/screen/home_screen.dart';
import 'package:riverpod_practice/screen/home_screen2.dart';
import 'package:riverpod_practice/screen/list_screen.dart';
import 'package:riverpod_practice/screen/stream_provider/stream_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: ApiListScreen(),
      ),
    );
  }
}
