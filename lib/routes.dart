import 'package:oopquiz/about/aboutPage.dart';
import 'package:oopquiz/home/home.dart';
import 'package:oopquiz/profile/profile.dart';

var appRoutes = {
  '/': (context) => const HomePage(),
  '/about': (context) => const AboutPage(),
  '/profile': (context) => const ProfilePage(),
}; 
