import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
   MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  double _appBarHeight = kToolbarHeight; // Initial height of the app bar

  void _handleExitGesture(DragStartDetails details) {
    setState(() {
      _appBarHeight =
          details.localPosition.dy; // Start animation from tap position
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (details) {
        if (details.velocity.pixelsPerSecond.dy > 0) {
          // Check for downward swipe
          setState(() {
            _appBarHeight = 0.0; // Collapse the app bar
          });
          Navigator.popUntil(
              context,
              ModalRoute.withName(
                  '/targetRoute')); // Replace '/targetRoute' with the route to which you want to exit
        }
      },
      child: AnimatedContainer(
        duration: const Duration(
            milliseconds: 300), // Adjust animation duration as needed
        curve: Curves.easeInOut, // Customize animation curve if desired
        height: _appBarHeight,
        child: AppBar(
          title: const Text("title"), // Replace with your app bar title
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context), // Handle back button press
          ),
          actions: const [
            // Add any app bar actions here
          ],
          // Add other app bar properties as needed (e.g., backgroundColor, etc.)
        ),
      ),
    );
  }
}
