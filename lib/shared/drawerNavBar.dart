import 'package:flutter/material.dart';
import 'package:oopquiz/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerNavBar extends StatefulWidget {
  const DrawerNavBar({super.key});

  @override
  State<DrawerNavBar> createState() => _DrawerNavBarState();
}

class _DrawerNavBarState extends State<DrawerNavBar> {
  String userName = '';
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
            'Clear Records',
          ),
          leading: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text(
                        'Are you sure you want to clear your records ?'),
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
                          'Clear',
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          prefs.clear().then((res) {
                            if (res) {
                              Navigator.pushReplacementNamed(context, '/');
                            }
                          });
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
