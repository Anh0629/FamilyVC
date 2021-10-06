import 'package:flutter/material.dart';
// import 'package:fluttericon/entypo_icons.dart';
// import 'package:fluttericon/iconic_icons.dart';

// ignore: camel_case_types
class popularProduct extends StatefulWidget {
  @override
  _popularProductState createState() => _popularProductState();
}

// ignore: camel_case_types
class _popularProductState extends State<popularProduct> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.indigo),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          // borderRadius: BorderRadius.only(
          //   bottomLeft: Radius.circular(10),
          //   bottomRight: Radius.circular(10),
          // ),
        ),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(10),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/healthyfood.png'),
                            fit: BoxFit.fitHeight)),
                  ),
                  // Positioned(
                  //     right: 12,
                  //     top: 10,
                  //     child: Icon(
                  //       Entypo.star,
                  //       color: Colors.pink.shade400,
                  //     )),
                  // Positioned(
                  //     right: 12,
                  //     top: 7,
                  //     child: Icon(
                  //       Entypo.star,
                  //       color: Colors.red.shade400,
                  //     )),
                  Positioned(
                      right: 5,
                      bottom: 5,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.indigo[100]),
                        padding: EdgeInsets.all(2.0),
                        // color: Colors.pink[50],
                        child: Text(
                          '_VND0444444500',
                          style: TextStyle(color: Colors.red, fontSize: 10),
                        ),
                      ))
                ],
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'data',
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo[400],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'data',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.shop_outlined,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
