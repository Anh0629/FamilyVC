import 'package:flutter/material.dart';
import 'package:flutter_app/screens/card.dart';
import 'package:flutter_app/screens/feeds.dart';
import 'package:flutter_app/screens/home.dart';
import 'package:flutter_app/screens/search.dart';
import 'package:flutter_app/screens/user.dart';

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
        'page': SearchScreen(),
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
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(pages[selectedIndex]['title']),
      //   backgroundColor: Colors.indigo[400],
      // ),
      body: pages[selectedIndex]['page'],
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        clipBehavior: Clip.antiAlias,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          onTap: selectedPage,
          backgroundColor: Theme.of(context).bottomAppBarColor,
          // ignore: deprecated_member_use
          unselectedItemColor: Theme.of(context).bottomAppBarColor,
          selectedItemColor: Colors.indigo[500],
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), tooltip: 'Home', label: 'Trang Chủ'),
            BottomNavigationBarItem(
                icon: Icon(Icons.auto_awesome_motion_sharp),
                tooltip: 'Feeds',
                label: 'Sản Phẩm'),
            BottomNavigationBarItem(
                activeIcon: null, icon: Icon(null), tooltip: '', label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket),
                tooltip: 'Card',
                label: 'Thanh Toán'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), tooltip: 'User', label: 'Người Dùng'),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink[200],
        tooltip: 'Tìm Kiếm',
        elevation: 5,
        child: (Icon(Icons.search)),
        onPressed: () {
          setState(() {
            selectedIndex = 2;
          });
        },
      ),
    );
  }
}
