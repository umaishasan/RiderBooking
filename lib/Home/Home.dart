import 'package:flutter/material.dart';
import 'package:riderbooking/BottomBar/BottomBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            // Main column content (keeps space for top and bottom bars)
            Column(
              children: [
                const SizedBox(height: 18),
                // Spacer to show the card below the circle
                const SizedBox(height: 60),
                Expanded(
                  child: Center(
                    child: Container(
                      width: 300,
                      height: 320,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),

            // Overlapping circle positioned near the top of the card
            Positioned(
              top: 56,
              child: Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  color: circleColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
      // Bottom nav bar styled to match image
      bottomNavigationBar: Bottombar(),
    );
  }
}
