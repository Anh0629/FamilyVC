// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/consts/_list/Model/category_list_model.dart';
import 'package:flutter_app/consts/_list/view_model/category_view_model.dart';
import 'package:flutter_app/consts/_list/view_model/products_view_model.dart';
import 'package:flutter_app/provider/dark_theme.dart';
import 'package:flutter_app/screens/Widget/category.dart';
import 'package:flutter_app/screens/Widget/product_home_.dart';
import 'package:flutter_app/screens/feeds.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'Widget/popular_products.dart';

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
    'assets/images/giphy.gif',
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
  void initState() {
    super.initState();
    print("Home inistate");
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    CategoryViewModel categoryViewModel =
        Provider.of<CategoryViewModel>(context);

    ProductViewModel productsViewModel = Provider.of<ProductViewModel>(context);
    // categoryViewModel.setCategoryListModel(categoryListModel)

    // final productAttributes = Provider.of<ProductModel>(context);
    // var course;
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor!,
        title: Text("Trang Chủ "),

        // leading: BackdropToggleButton(
        //   icon: AnimatedIcons.home_menu,
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
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
                    dotIncreasedColor: Theme.of(context).primaryColorLight,
                    dotBgColor:
                        Theme.of(context).primaryColorLight.withOpacity(0.2),
                    dotPosition: DotPosition.bottomCenter,
                    dotVerticalPadding: 10.0,
                    showIndicator: true,
                    indicatorBgPadding: 7.0,
                    images: [
                      ExactAssetImage(_carouselImage[0]),
                      ExactAssetImage(_carouselImage[1]),
                      ExactAssetImage(_carouselImage[2]),
                      ExactAssetImage(_carouselImage[3]),
                      // FittedBox(
                      //   fit: BoxFit.fitWidth,
                      // )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  color: Theme.of(context).primaryColorLight,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(children: [
                      Container(
                        child: Text(
                          'Danh mục',
                          style: TextStyle(
                              color: Theme.of(context).backgroundColor,
                              // ignore: deprecated_member_use

                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      // ignore: deprecated_member_use
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          'Xem tất cả',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                            color:
                                // ignore: deprecated_member_use
                                Theme.of(context).backgroundColor,
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                Container(
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    height: 150,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        CategoryModel categoryModel =
                            categoryViewModel.categoryList[index];
                        return ChangeNotifierProvider.value(
                          value: categoryModel,
                          child: CategoryWidget(),
                        );
                      },
                      itemCount: categoryViewModel.categoryList.length,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  color: Theme.of(context).primaryColorLight,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(children: [
                      Container(
                        child: Text(
                          'Danh mục',
                          style: TextStyle(
                              color:
                                  // ignore: deprecated_member_use
                                  Theme.of(context).backgroundColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      // ignore: deprecated_member_use
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          'Xem tất cả',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                            color:
                                // ignore: deprecated_member_use
                                Theme.of(context).backgroundColor,
                          ),
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
                  color: Theme.of(context).primaryColorLight,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(children: [
                      Text(
                        'Mặt Hàng Nổi Bật',
                        style: TextStyle(
                            color:
                                // ignore: deprecated_member_use
                                Theme.of(context).backgroundColor,
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
                            color:
                                // ignore: deprecated_member_use
                                Theme.of(context).backgroundColor,
                          ),
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
                  color: Theme.of(context).primaryColorLight,
                  child: Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          Text(
                            'Gian Hàng',
                            style: TextStyle(
                                // ignore: deprecated_member_use
                                color: Theme.of(context).backgroundColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                        ],
                      )),
                ),
                Column(children: [
                  Container(
                    padding: EdgeInsets.all(5.0),
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      childAspectRatio: 200 / 280,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      children: List.generate(
                        productsViewModel.productList.length,
                        (index) {
                          return ChangeNotifierProvider.value(
                            value: productsViewModel.productList[index],
                            child: FeedProductsHome(),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(2.0),
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        // crossAxisAlignment: ,
                        children: [
                          TextButton(
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
              ]),
            )
          ],
        ),
      ),
    );
  }
}
