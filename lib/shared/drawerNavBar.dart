import 'package:flutter/material.dart';
import 'package:oopquiz/utils/constants.dart';

class DrawerNavBar extends StatefulWidget {
  const DrawerNavBar({super.key});

  @override
  State<DrawerNavBar> createState() => _DrawerNavBarState();
}

class _DrawerNavBarState extends State<DrawerNavBar> {
  String userName = 'USER123';
  String imageUrl = "assets/user/man.png";

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final drawerHeader = UserAccountsDrawerHeader(
      accountEmail: const Text(""),
      currentAccountPicture: CircleAvatar(
        child: Image.asset(imageUrl),
      ),
      decoration: const BoxDecoration(color: charcoalColor),
      accountName: Text(userName,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );

    final drawerItems = ListView(
      children: [
        drawerHeader,
        //TODO add here about page and credit 
        ListTile(
            title: const Text(
              'score',
            ),
            leading: const Icon(
              Icons.bar_chart,
              color: Colors.blue,
            ),
            onTap: () {}),
        ListTile(
          title: const Text(
            'sign out',
          ),
          leading: const Icon(
            Icons.power_settings_new,
            color: Colors.red,
          ),
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Are you sure you want to leave'),
                    content: const Text('What do you want to do?'),
                    actions: [
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text(
                          'sign out',
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/');
                        },
                      ),
                    ],
                  );
                });
          },
        ),
      ],
    );

    return drawerItems;
  }
}
