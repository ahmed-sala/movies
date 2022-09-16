import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/firebase_options.dart';
import 'package:movies_app/presentation_layer/homeScreen.dart';
import 'package:movies_app/presentation_layer/my_theme.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies ',
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
       // DetailsScreen.routeName: (_) => DetailsScreen(),
      },
      initialRoute: HomeScreen.routeName,
      theme: MyTheme.darkTheme,
    );
  }
}
