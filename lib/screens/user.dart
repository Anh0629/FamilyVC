// import 'dart:ffi';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app/consts/theme_data.dart';
//import 'package:flutter_app/consts/theme_data.dart';
// import 'package:flutter_app/main.dart';
import 'package:flutter_app/provider/dark_theme.dart';
import 'package:flutter_app/screens/Widget/WishList/wishlist.dart';
import 'package:provider/provider.dart';
// ignore: unused_import
import '../consts/colors.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'Widget/Cart/cart.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  // bool _switchValues = false;
  late ScrollController scrollController;
  var top = 0.0;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    // ignore: unused_local_variable
    var _buildFab = buildFab();
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.pink[200],
        body: Stack(
          children: [
            CustomScrollView(
              controller: scrollController,
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: Theme.of(context).backgroundColor,
                  automaticallyImplyLeading: false,
                  elevation: 4,
                  expandedHeight: 200,
                  pinned: true,
                  flexibleSpace: LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    top = constraints.biggest.height;
                    return Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).appBarTheme.backgroundColor!,
                      ),
                      child: FlexibleSpaceBar(
                        collapseMode: CollapseMode.parallax,
                        centerTitle: true,
                        title: Row(
                          //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AnimatedOpacity(
                              //lam mo
                              duration: Duration(milliseconds: 300),
                              opacity: top <= 110.0 ? 1.0 : 0,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 14,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    height: kToolbarHeight / 1.4,
                                    width: kToolbarHeight / 1.4,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white,
                                          // blurRadius: 0.5,
                                        ),
                                      ],
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/healthyfood.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    // 'top.toString()',
                                    'Thành Viên',
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        background: Container(
                          color: Theme.of(context).backgroundColor,
                          child: Image(
                            image: AssetImage('assets/images/healthyfood.png'),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: Theme.of(context).backgroundColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment
                          .center, //ăn chỉnh các widget con của nó theo chiều dọc
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: userTitle(
                            'Giỏ Hàng',
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Theme.of(context).primaryColorLight,
                            onTap: () => Navigator.of(context)
                                .pushNamed(WishlistScreen.routeName),
                            child: ListTile(
                              title: Text('Yêu Thích',
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).primaryColorLight,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900)),
                              trailing: Icon(Icons.chevron_right_rounded),
                              leading: Icon(
                                Entypo.heart,
                                color: Theme.of(context).primaryColorLight,
                              ),
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Theme.of(context).primaryColorLight,
                            onTap: () => Navigator.of(context)
                                .pushNamed(CartScreen.routeName),
                            child: ListTile(
                              title: Text(
                                'Giỏ Hàng',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColorLight,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900),
                              ),
                              trailing: Icon(Icons.chevron_right_rounded),
                              leading: Icon(Entypo.shopping_cart,
                                  color: Theme.of(context).primaryColorLight),
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Theme.of(context).primaryColorLight,
                            onTap: () => Navigator.of(context),
                            child: ListTile(
                              title: Text('Thêm',
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).primaryColorLight,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900)),
                              trailing: Icon(Icons.chevron_right_rounded),
                              // leading: Icon(),
                            ),
                          ),
                        ),
                        Divider(
                          //giai phan cach
                          thickness: 2,
                          color: Theme.of(context).primaryColorLight,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: userTitle('Thông Tin Người Dùng'),
                        ),
                        userListTitle('Email', 'sub', 0, context),
                        userListTitle('Số Điện Thoại', 'sub', 1, context),
                        userListTitle('Đang Giao Hàng', 'sub', 2, context),
                        userListTitle('Tình Trạng Đơn Hàng', 'sub', 3, context),
                        Divider(
                          thickness: 2,
                          color: Theme.of(context).primaryColorLight,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: userTitle('Cài Đặt'),
                        ),
                        ListTileSwitch(
                          value: themeChange.darkTheme,
                          leading: Icon(
                            themeChange.darkTheme
                                ? Icons.dark_mode_rounded
                                : Icons.light_mode_rounded,
                            color: Theme.of(context).primaryColorLight,
                          ),
                          onChanged: (value) {
                            setState(() {
                              themeChange.darkTheme = value;
                            });
                          },
                          visualDensity: VisualDensity.comfortable,
                          switchType: SwitchType.cupertino,
                          switchActiveColor:
                              Theme.of(context).primaryColorLight,
                          title: Text(
                            themeChange.darkTheme
                                ? 'Dark Theme'
                                : 'Light Theme',
                            style: TextStyle(
                                color: Theme.of(context).primaryColorLight),
                          ),
                        ),
                        userListTitle('Logout', 'subTitle', 4, context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            buildFab()
          ],
        ),
      ),
    );
  }

  Widget buildFab() {
    //starting fab position
    final double defaultTopMargin = 200.0 - 60.0;
    //pixels from top where scaling should start
    final double scaleStart = 160.0;
    //pixels from top where scaling should end
    final double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 1.0;
    if (scrollController.hasClients) {
      double offset = scrollController.offset;
      top -= offset;
      if (offset < defaultTopMargin - scaleStart) {
        //offset small => don't scale down
        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        //offset between scaleStart and scaleEnd => scale down
        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        //offset passed scaleEnd => hide fab
        scale = 0.0;
      }
    }
    return Positioned(
      top: top,
      right: 16.0,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: FloatingActionButton(
          heroTag: "btn1",
          onPressed: () {},
          child: Icon(Icons.camera_alt_outlined),
          backgroundColor: Theme.of(context).primaryColorLight,
        ),
      ),
    );
  }

  List<IconData> userTitleIcons = [
    Icons.email,
    Icons.phone,
    Icons.local_shipping,
    Icons.watch_later,
    Icons.exit_to_app_rounded,
  ];

  Widget userListTitle(
      String title, String subTitle, int index, BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).primaryColorLight,
        child: ListTile(
          onTap: () {},
          title: Text(title,
              style: TextStyle(color: Theme.of(context).primaryColorLight)),
          subtitle: Text(
            subTitle,
            style: TextStyle(color: Theme.of(context).primaryColorLight),
          ),
          leading: Icon(
            userTitleIcons[index],
            color: Theme.of(context).primaryColorLight,
          ),
        ),
      ),
    );
  }

  Widget userTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: Theme.of(context).buttonColor,
        height: 2,
      ),
    );
  }
}
