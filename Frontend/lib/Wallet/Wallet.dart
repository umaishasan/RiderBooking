import 'package:flutter/material.dart';
import 'package:riderbooking/BottomBar/BottomBar.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

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
          onPressed: () {Navigator.of(context).pop();},
        ),
        centerTitle: true,
        title: const Text(
          'Wallet',
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