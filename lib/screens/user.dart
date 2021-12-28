// import 'dart:ffi';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app/consts/_list/view_model/login_view_model.dart';
import 'package:flutter_app/consts/_list/view_model/profile_view_model.dart';
import 'package:flutter_app/provider/dark_theme.dart';
import 'package:flutter_app/screens/Widget/WishList/wishlist.dart';
import 'package:flutter_app/screens/Widget/upload/Product_upload.dart';
import 'package:flutter_app/screens/Widget/upload/profile_upload.dart';
import 'package:flutter_app/screens/landing_page.dart';
import 'package:provider/provider.dart';
// ignore: unused_import
import '../consts/colors.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';

import 'Widget/Cart/cart.dart';

class UserScreen extends StatefulWidget {
  static const routeName = '/UserScreen';
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
    final _profileViewModel = Provider.of<ProfileViewModel>(context);
    final _userViewModel = Provider.of<UserViewModel>(context);

    var a = _profileViewModel.profileList;

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
                        Divider(
                          thickness: 2,
                          color: Theme.of(context).primaryColorLight,
                        ),
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
                        Divider(
                          //giai phan cach
                          thickness: 2,
                          color: Theme.of(context).primaryColorLight,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: userTitle('Thông Tin Người Dùng'),
                        ),
                        userListTitle(_userViewModel.userModel.data!.username!,
                            3, context,
                            subTitle: ''),
                        userListTitle(
                            a.data!.isEmpty
                                ? 'chưa thêm email'
                                : a.data!.first.user!.email!,
                            0,
                            context,
                            subTitle: 'Email'),
                        userListTitle(
                            a.data!.isEmpty
                                ? 'Chưa thêm tên người dùng'
                                : a.data!.first.name!,
                            3,
                            context,
                            subTitle: 'Họ và tên'),
                        userListTitle(
                            a.data!.isEmpty
                                ? 'chưa thêm sđt'
                                : a.data!.first.phone!,
                            1,
                            context,
                            subTitle: 'Số điện Thoại'),
                        userListTitle(
                            a.data!.isEmpty
                                ? 'chưa thêm địa chỉ'
                                : a.data!.first.address!.street! +
                                    ' ' +
                                    a.data!.first.address!.city! +
                                    ' ' +
                                    a.data!.first.address!.province! +
                                    ' ' +
                                    a.data!.first.address!.state!,
                            2,
                            context,
                            subTitle: 'Địa chỉ'),
                        Divider(
                          endIndent:
                              _userViewModel.userModel.data!.isAdmin == true
                                  ? 0
                                  : 500,
                          thickness: 2,
                          color: Theme.of(context).primaryColorLight,
                        ),
                        _userViewModel.userModel.data!.isAdmin == true
                            ? Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: userTitle('admin'))
                            : Container(
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    splashColor:
                                        Theme.of(context).primaryColorLight,
                                    onTap: () => Navigator.of(context)
                                        .pushNamed(ProfileUpLoad.routeName),
                                    child: Column(children: [
                                      userTitle('User: '),
                                      ListTile(
                                        title: Text('Thêm thông tin người dùng',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColorLight,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w900)),
                                        trailing:
                                            Icon(Icons.chevron_right_rounded),
                                        // leading: Icon(),
                                      ),
                                    ]),
                                  ),
                                ),
                              ),
                        _userViewModel.userModel.data!.isAdmin == true
                            ? Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor:
                                      Theme.of(context).primaryColorLight,
                                  onTap: () => Navigator.of(context)
                                      .pushNamed(UploadProductForm.routeName),
                                  child: ListTile(
                                    title: Text('Thêm sản Phẩm',
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .primaryColorLight,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900)),
                                    trailing: Icon(Icons.chevron_right_rounded),
                                    // leading: Icon(),
                                  ),
                                ),
                              )
                            : Container(),
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
                        userListTitle(
                          'Logout',
                          4,
                          context,
                          onTap: () => {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LandingPage()),
                              (route) => false,
                            ),
                          },
                        ),
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
    Icons.person,
    Icons.exit_to_app_rounded,
  ];

  Widget userListTitle(String title, int index, BuildContext context,
      {VoidCallback? onTap, String? subTitle}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).primaryColorLight,
        child: ListTile(
          onTap: onTap,
          title: Text(title,
              style: TextStyle(color: Theme.of(context).primaryColorLight)),
          subtitle: Text(
            subTitle ?? '',
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
