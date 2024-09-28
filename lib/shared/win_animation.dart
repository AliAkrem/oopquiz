import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WinAnimationProvider extends StatefulWidget {
  final bool show;
  final Widget child;
  const WinAnimationProvider(
      {super.key, required this.show, required this.child});

  @override
  State<WinAnimationProvider> createState() => _WinAnimationProviderState();
}

class _WinAnimationProviderState extends State<WinAnimationProvider>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        widget.show
            ? Lottie.asset(              
                repeat: false,
                'assets/animation/winanimation.json',
                onLoaded: (composition) {
                  _controller
                    ..duration = composition.duration
                    ..forward();
                },
              )
            : Container()
      ],
    );
  }
}
