import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerNavBar extends StatefulWidget {
  const DrawerNavBar({super.key});

  @override
  State<DrawerNavBar> createState() => _DrawerNavBarState();
}

class _DrawerNavBarState extends State<DrawerNavBar> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final drawerItems = Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          //TODO add here about page and credit
          Row(
            children: [
              Text('options'),
              SizedBox(
                width: 4,
              ),
              Expanded(child: Divider()),
            ],
          ),
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
          Row(
            children: [
              Text('More informations'),
              SizedBox(
                width: 4,
              ),
              Expanded(child: Divider()),
            ],
          ),
          ListTile(
            title: const Text(
              'About',
            ),
            leading: const Icon(
              Icons.info,
            ),
            onTap: () {
              Navigator.pushNamed(context, '/about');
              Scaffold.of(context).closeDrawer();
            },
          ),
          ListTile(
            title: const Text(
              'Credit',
            ),
            leading: const Icon(
              Icons.library_books,
            ),
            onTap: () {
              Navigator.pushNamed(context, '/credit');
              Scaffold.of(context).closeDrawer();
            },
          ),
        ],
      ),
    );

    return drawerItems;
  }
}
