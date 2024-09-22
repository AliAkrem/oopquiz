import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:oopquiz/home/home.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback(
//       (timeStamp) {
//         Future.delayed(const Duration(milliseconds: 2200), () => _redirect());
//       },
//     );
//   }

//   Future<void> _redirect() async {
//     Navigator.pushReplacementNamed(context, '/home');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: Lottie.asset('assets/animation/splash_animation_dark.lottie',
//               repeat: false, decoder: customDecoder)),
//     );
//   }
// }



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 400,

      backgroundColor: Colors.black,
      splash:Center(
          child: LottieBuilder.asset(
            'assets/animation/splash_animation_dark.json',
            // controller: _animationController,
            // decoder: customDecoder,

            fit: BoxFit.contain,
            repeat: false,
            onLoaded: (composition) {
              // Set the animation duration and start the animation
              // _animationController.duration = composition.duration;
              // _animationController.forward();
            },
          ),
        ),
      nextScreen: const  HomePage(),
    );
  }
}
