import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_comm/pages_users/Profile.dart';
import 'package:e_comm/pages_users/home.dart';
import 'package:e_comm/pages_users/orderPage.dart';
import 'package:flutter/material.dart';

class Bottomnav extends StatefulWidget {
  final String routename = '/BottomNav';
  Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  late List pages = [];
  int index = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pages = [HomePage(), Orderpage(), ProfilePage()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        animationDuration: Duration(milliseconds: 500),
        backgroundColor: Colors.white,
        color: Colors.black,
        items: [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.shopping_bag_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
          ),
        ],
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
      body: pages[index],
    );
  }
}
