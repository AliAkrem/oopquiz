import 'package:flutter/material.dart';

showLeaveAlertDialog(BuildContext context) {
  return showDialog(
      // Prevent dismissal via tapping outside the dialog
      // barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return PopScope(
          canPop: true,
          child: AlertDialog(
            title: const Text('Are you sure you want to leave the quiz'),
            content:
                const Text('you still have time to complete this mission.'),
            actions: [
              TextButton(
                child: const Text(
                  'Leave',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  // Redirect to the home page
                  Navigator.pushReplacementNamed(context, '/');
                },
              ),
              TextButton(
                child: const Text(
                  'Stay',
                  style: TextStyle(color: Colors.blueAccent),
                ),
                onPressed: () {
                  // Redirect to the home page
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      });
}
