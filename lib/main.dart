import 'package:flutter/material.dart';
import 'package:riderbooking/Login/Login.dart';

void main() {
  runApp(const RiderBooking());
}

class RiderBooking extends StatelessWidget {
  const RiderBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home UI Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF45E0DE),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const LoginPage(),
    );
  }
}