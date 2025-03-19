import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(
        icon: Icon(
          FontAwesomeIcons.graduationCap,
          size: 20,
        ),
        label: 'Topics',
      ),
           BottomNavigationBarItem(
        icon: Icon(
          FontAwesomeIcons.bolt,
          size: 20,
        ),
        label: 'About',
      ),
           BottomNavigationBarItem(
        icon: Icon(
          FontAwesomeIcons.user,
          size: 20,
        ),
        label: 'Profile',
      ),
    ] ,
    onTap: (int value) {

      switch (value) {
        case 0:
          // do nothing 
          break;
        case 1:
          Navigator.pushNamed(context, '/about');
          break;
        case 2:
          Navigator.pushNamed(context, '/profile');
          break;
        default:
      }


    },
    );
  }
}
