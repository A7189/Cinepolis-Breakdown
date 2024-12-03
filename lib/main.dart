import 'package:flutter/material.dart';
import 'package:ukl/cinema.dart';
import 'package:ukl/movie.dart';
import 'package:ukl/my_booking.dart';
import 'package:ukl/test.dart';
import 'login.dart';
import 'splash.dart';
import 'home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
      title: 'MyCinema',
      routes: {
        '/': (context) => SplashPage(),
        '/login': (context) => LoginPage(),
        '/Home': (context) => HomePage(),
        '/Booking': (context) => BookingPage(),
        '/Movie': (context) => MoviePage(),
        '/Cinema': (context) => CinemaPage(),
        '/test': (context) => TestPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}