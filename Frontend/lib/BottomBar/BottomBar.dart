import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:riderbooking/BikeRiding/BikeRiding.dart';
import 'package:riderbooking/CarRiding/CarRiding.dart';
import 'package:riderbooking/History/History.dart';
import 'package:riderbooking/Home/Home.dart';
import 'package:riderbooking/Login/Login.dart';
import 'package:riderbooking/Wallet/Wallet.dart';

class Bottombar extends StatelessWidget {
  const Bottombar({super.key});

  @override
  Widget build(BuildContext context, ) {
    const teal = Color(0xFF45E0DE);
    return Container(
      height: 64,
        color: teal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.logout, color: Colors.black87),
                onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPage()));
                },
              ),
              IconButton(
                icon: const Icon(Icons.home, color: Colors.black87),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
                },
              ),
              IconButton(
                icon: const Icon(Icons.directions_bike, color: Colors.black87),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const Bikeriding()));
                },
              ),
              IconButton(
                icon: const Icon(Icons.directions_car, color: Colors.black87),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const Carriding()));
                },
              ),
              IconButton(
                icon: const Icon(Icons.work_outline, color: Colors.black87),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const History()));
                },
              ),
              IconButton(
                icon: const Icon(Icons.account_balance_wallet,
                    color: Colors.black87),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const Wallet()));
                },
              ),
            ],
          ),
        ),
    );
  }
}