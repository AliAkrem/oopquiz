import 'package:flutter/material.dart';

class InternetConnectionService extends StatefulWidget {
  final Widget child;

  const InternetConnectionService({super.key, required this.child});

  @override
  State<InternetConnectionService> createState() =>
      _InternetConnectionServiceState();
}

class _InternetConnectionServiceState extends State<InternetConnectionService> {
  @override
  Widget build(BuildContext context) {
    return widget.child;

    //  StreamBuilder(
    //     stream: InternetConnection().onStatusChange,

    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const LoadingScreen();
    //       } else {
    //         if (snapshot.hasData && snapshot.data == InternetStatus.connected) {
    //           return widget.child;
    //         } else {
    //           return const NoConnectionScreen();
    //         }
    //       }
    //     });
  }
}
