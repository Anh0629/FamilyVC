// import 'package:backdrop/app_bar.dart';
// import 'package:backdrop/button.dart';
// import 'package:backdrop/scaffold.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_pro/carousel_pro.dart';
// ignore: import_of_legacy_library_into_null_safe
// import 'package:carousel_pro/carousel_pro.dart';

// import 'package:backdrop/sub_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/feeds.dart';
// import 'package:flutter_app/consts/theme_data.dart';
// import 'package:flutter_app/screens/Widget/Feeds_products.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';

import 'Widget/popular_products.dart';
import 'Widget/shop_home.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  static const routeName = '/HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

@override
class _HomeScreenState extends State<HomeScreen> {
  // var top = 0.0;

  @override
  // ignore: override_on_non_overriding_member

  // ignore: override_on_non_overriding_member
  List _carouselImage = [
    'assets/images/healthyfood.png',
    'assets/images/healthyfood.png',
    'assets/images/healthyfood.png',
    'assets/images/healthyfood.png',
  ];
  List _brandImage = [
    'assets/images/12378.png',
    'assets/images/healthyfood.png',
    'assets/images/12378.png',
    'assets/images/healthyfood.png',
  ];

  @override
  Widget build(BuildContext context) {
    var course;
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: Text("Trang Chủ "),
        // leading: BackdropToggleButton(
        //   icon: AnimatedIcons.home_menu,
      ),
      body: Container(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: Carousel(
                    boxFit: BoxFit.fitHeight,
                    autoplay: true,
                    animationCurve: Curves.fastOutSlowIn,
                    animationDuration: Duration(milliseconds: 2000),
                    dotSize: 5.0,
                    dotIncreasedColor: Colors.indigo[500],
                    dotBgColor: Colors.indigo.withOpacity(0.2),
                    dotPosition: DotPosition.bottomCenter,
                    dotVerticalPadding: 10.0,
                    showIndicator: true,
                    indicatorBgPadding: 7.0,
                    images: [
                      ExactAssetImage(_carouselImage[0]),
                      ExactAssetImage(_carouselImage[1]),
                      ExactAssetImage(_carouselImage[2]),
                      ExactAssetImage(_carouselImage[3]),
                      FittedBox(
                        fit: BoxFit.fitWidth,
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.03,
                  color: Colors.pink[100],
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(children: [
                      Container(
                        child: Text(
                          'Gian Hang',
                          style: TextStyle(
                              color: Colors.indigo[500],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      // ignore: deprecated_member_use
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          'View All',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                              color: Colors.indigo[500]),
                        ),
                      ),
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // color: Colors.black,
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width,

                    child: Stack(children: [
                      Swiper(
                        itemCount: _brandImage.length,
                        autoplay: true,
                        onTap: (index) {},
                        itemBuilder: (BuildContext ctx, int index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              _brandImage[index],
                            ),
                          );
                        },
                      ),
                    ]),
                  ),
                ),
                Container(
                  color: Colors.pink[100],
                  height: MediaQuery.of(context).size.height * 0.04,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(children: [
                      Text(
                        'Mặt Hàng Nổi Bật',
                        style: TextStyle(
                            color: Colors.indigo[500],
                            fontWeight: FontWeight.bold),
                      ),

                      Spacer(),
                      // ignore: deprecated_member_use
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          'Tất Cả',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                              color: Colors.indigo[500]),
                        ),
                      ),
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 160,
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return popularProduct();
                      },
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  color: Colors.pink[100],
                  child: Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          Text(
                            'Gian Hàng',
                            style: TextStyle(
                                color: Colors.indigo[500],
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          // ignore: deprecated_member_use

                          FlatButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen())),
                            child: Text(
                              'Quay lại Home',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15,
                                  color: Colors.indigo[500]),
                            ),
                          ),

                          // Spacer(),
                        ],
                      )),
                ),
                Column(children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        childAspectRatio: 200 / 280,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        children: List.generate(30, (index) {
                          return shopHome();
                        })),
                  ),
                ]),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // crossAxisAlignment: ,
                      children: [
                        FlatButton(
                          onPressed: () => Navigator.of(context)
                              .pushNamed(FeedsScreen.routeName),
                          child: Text(
                            'Xem thêm',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                                color: Colors.indigo[500]),
                          ),
                        ),
                      ]),
                ),
              ]),
              // Column(
              //   children: [
              //     Container(
              //       height: 150,
              //       width: MediaQuery.of(context).size.width,
              //       child: Carousel(
              //         boxFit: BoxFit.fitHeight,
              //         autoplay: true,
              //         animationCurve: Curves.fastOutSlowIn,
              //         animationDuration: Duration(milliseconds: 2000),
              //         dotSize: 5.0,
              //         dotIncreasedColor: Colors.indigo[500],
              //         dotBgColor: Colors.indigo.withOpacity(0.2),
              //         dotPosition: DotPosition.bottomCenter,
              //         dotVerticalPadding: 10.0,
              //         showIndicator: true,
              //         indicatorBgPadding: 7.0,
              //         images: [
              //           ExactAssetImage(_carouselImage[0]),
              //           ExactAssetImage(_carouselImage[1]),
              //           ExactAssetImage(_carouselImage[2]),
              //           ExactAssetImage(_carouselImage[3]),
              //         ],
              //       ),
              //     ),
              //     Container(
              //       height: MediaQuery.of(context).size.height * 0.03,
              //       color: Colors.pink[100],
              //       child: Padding(
              //         padding: const EdgeInsets.only(left: 8),
              //         child: Row(children: [
              //           Container(
              //             child: Text(
              //               'Gian Hang',
              //               style: TextStyle(
              //                   color: Colors.indigo[500],
              //                   fontWeight: FontWeight.bold),
              //             ),
              //           ),
              //           Spacer(),
              //           // ignore: deprecated_member_use
              //           FlatButton(
              //             onPressed: () {},
              //             child: Text(
              //               'View All',
              //               style: TextStyle(
              //                   fontWeight: FontWeight.w800,
              //                   fontSize: 15,
              //                   color: Colors.indigo[500]),
              //             ),
              //           ),
              //         ]),
              //       ),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Container(
              //         // color: Colors.black,
              //         height: MediaQuery.of(context).size.height * 0.2,
              //         width: MediaQuery.of(context).size.width,

              //         child: Stack(children: [
              //           Swiper(
              //             itemCount: _brandImage.length,
              //             autoplay: true,
              //             onTap: (index) {},
              //             itemBuilder: (BuildContext ctx, int index) {
              //               return ClipRRect(
              //                 borderRadius: BorderRadius.circular(10),
              //                 child: Image.asset(
              //                   _brandImage[index],
              //                 ),
              //               );
              //             },
              //           ),
              //         ]),
              //       ),
              //     ),
              //     Container(
              //       color: Colors.pink[100],
              //       height: MediaQuery.of(context).size.height * 0.04,
              //       child: Padding(
              //         padding: const EdgeInsets.only(left: 8.0),
              //         child: Row(children: [
              //           Text(
              //             'Mặt Hàng Nổi Bật',
              //             style: TextStyle(
              //                 color: Colors.indigo[500],
              //                 fontWeight: FontWeight.bold),
              //           ),

              //           Spacer(),
              //           // ignore: deprecated_member_use
              //           FlatButton(
              //             onPressed: () {},
              //             child: Text(
              //               'Tất Cả',
              //               style: TextStyle(
              //                   fontWeight: FontWeight.w800,
              //                   fontSize: 15,
              //                   color: Colors.indigo[500]),
              //             ),
              //           ),
              //         ]),
              //       ),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Container(
              //         width: double.infinity,
              //         height: 160,
              //         margin: EdgeInsets.symmetric(horizontal: 3),
              //         child: ListView.builder(
              //           scrollDirection: Axis.horizontal,
              //           itemCount: 10,
              //           itemBuilder: (BuildContext context, int index) {
              //             return popularProduct();
              //           },
              //         ),
              //       ),
              //     ),
              //     Container(
              //       color: Colors.pink[100],
              //       child: Padding(
              //         padding: const EdgeInsets.all(15.0),
              //         child: Container(
              //             child: Row(
              //           children: [
              //             Text(
              //               'Gian Hàng',
              //               style: TextStyle(
              //                   color: Colors.indigo[500],
              //                   fontWeight: FontWeight.bold),
              //             ),
              //             // Spacer(),
              //           ],
              //         )),
              //       ),
              //     ),
              //     Column(children: [
              //       Container(
              //         height: 500,
              //         child: GridView.count(
              //             shrinkWrap: true,
              //             crossAxisCount: 3,
              //             childAspectRatio: 200 / 280,
              //             crossAxisSpacing: 8,
              //             mainAxisSpacing: 8,
              //             children: List.generate(30, (index) {
              //               return shopHome();
              //             })),
              //       ),
              //     ]),
              //
              //       ),
              //     ),
              //   ],
              // ),
            )
          ],
        ),
      ),
    );
  }
}
