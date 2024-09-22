import 'package:flutter/material.dart';

showTimeUpAlertDialog(BuildContext context) {
  return showDialog(
      // Prevent dismissal via tapping outside the dialog
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            title: const Text('Time is Up'),
            content: const Text(
                'The time allocated to complete the exam has expired.'),
            actions: [
              TextButton(
                child: const Text(
                  'Back to Home',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  // Redirect to the home page
                  Navigator.pushReplacementNamed(context, '/');
                },
              ),
            ],
          ),
        );
      });
}
