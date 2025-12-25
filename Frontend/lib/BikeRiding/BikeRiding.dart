import 'package:flutter/material.dart';
import 'package:riderbooking/BottomBar/BottomBar.dart';

class Bikeriding extends StatelessWidget {
  const Bikeriding({super.key});

  @override
  Widget build(BuildContext context) {
    const teal = Color(0xFF45E0DE);
    const circleColor = Color(0xFFB39C9C);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: teal,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () {},
        ),
        centerTitle: true,
        title: const Text(
          'Bike Riding',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            

            
          ],
        ),
      ),
      // Bottom nav bar styled to match image
      bottomNavigationBar: Bottombar(),
    );
  }
}