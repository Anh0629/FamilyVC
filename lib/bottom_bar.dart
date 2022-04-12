import 'package:flutter/material.dart';
import 'package:flutter_app/screens/feeds.dart';
import 'package:flutter_app/screens/home.dart';
// ignore: unused_import
import 'package:flutter_app/screens/search.dart';
import 'package:flutter_app/screens/user.dart';
import 'screens/Widget/Cart/cart.dart';
import 'screens/feeds.dart';
import 'screens/home.dart';


class BottomBarScreen extends StatefulWidget {
  static const routeName = '/BottomBarScreen';
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  late List<Map<String, dynamic>> pages;
  int selectedIndex = 0;

  @override
  void initState() {
    pages = [
      {
        'page': HomeScreen(),
      },
      {
        'page': FeedsScreen(),
      },
      {
        'page': CartScreen(),
      },
      {
        'page': UserScreen(),
      },
    ];
    super.initState();
  }

  void selectedPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex]['page'],
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).backgroundColor,
        notchMargin: 4,
        clipBehavior: Clip.antiAlias,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          onTap: selectedPage,
          backgroundColor: Theme.of(context).primaryColorLight,
          // ignore: deprecated_member_use
          unselectedItemColor: Theme.of(context).primaryColorLight,
          // ignore: deprecated_member_use
          selectedItemColor: Theme.of(context).buttonColor,
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), tooltip: 'Home', label: 'Trang Chủ'),
            BottomNavigationBarItem(
                icon: Icon(Icons.auto_awesome_motion_sharp),
                tooltip: 'Feeds',
                label: 'Sản Phẩm'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket),
                tooltip: 'Card',
                label: 'Thanh Toán'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), tooltip: 'User', label: 'Người Dùng'),
          ],
        ),
      ),
    );
  }
}
