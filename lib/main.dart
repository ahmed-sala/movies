import 'package:flutter/material.dart';
import 'package:movies_app/presentation_layer/homeScreen.dart';
import 'package:movies_app/presentation_layer/main_screen/details/DetailsScreen.dart';
import 'package:movies_app/presentation_layer/my_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        DetailsScreen.routeName: (_) => DetailsScreen(),
      },
      initialRoute: HomeScreen.routeName,
      theme: MyTheme.darkTheme,
    );
  }
}
