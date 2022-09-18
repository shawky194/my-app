import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nwes/controller/Api.dart';
import 'view/screens/HomeScreen.dart';

void main() {

  runApp(const MyApp());
  Api.fetchArticles();

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News',
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),

        primarySwatch: Colors.blue,
      ),
      home:  HomeScreen(),
    );
  }
}
