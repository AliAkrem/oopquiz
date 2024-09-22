import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NoConnectionScreen extends StatefulWidget {
  const NoConnectionScreen({super.key});

  @override
  State<NoConnectionScreen> createState() => _NoConnectionScreenState();
}

class _NoConnectionScreenState extends State<NoConnectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AlertDialog(
          title: const Text('No Connection'),
          content: const Text(
              'Please check your internet connection and try again.'),
          actions: [
            TextButton(
              onPressed: () {
                _hideOverlay();
                SystemNavigator.pop();
              }, // Hide overlay when retry button is pressed
              child: const Text('exit'),
            ),
          ],
        ),
      ),
    );
  }

  void _hideOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  OverlayEntry? _overlayEntry;
}
