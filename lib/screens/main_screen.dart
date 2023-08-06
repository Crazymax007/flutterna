// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import '../service/auth_service.dart';
import 'home_screen.dart';
import 'order_screen.dart';
import 'account_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.auth});

  final AuthService auth;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final List<Widget> pages;
  late final List<String> titles;
  int navItemIndex = 0;

  @override
  void initState() {
    pages = [
      HomeScreen(),
      OrderScreen(),
      AccountScreen(auth: widget.auth,),
    ];

    titles = [
      'สินค้า',
      'คำสั่งซื้อ',
      'บัญชี',
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[navItemIndex]),
        actions: [
          IconButton(
            onPressed: () async {
              await widget.auth.logout();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: pages[navItemIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: navItemIndex,
        onTap: (value) {
          setState(() {
            navItemIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: titles[0],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.list),
            label: titles[1],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: titles[2],
          ),
        ],
      ),
    );
  }
}
