import 'package:flutter/material.dart';

// ignore: camel_case_types
class shopHome extends StatefulWidget {
  @override
  _shopHomeState createState() => _shopHomeState();
}

class _shopHomeState extends State<shopHome> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, top: 5),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 5, right: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: 120,
                  height: 80,
                  color: Colors.red,
                  // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  constraints: BoxConstraints(
                      minHeight: 50,
                      maxHeight: MediaQuery.of(context).size.height * 0.3),
                  child: Image.asset(
                    'assets/images/healthyfood.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 5),
              margin: EdgeInsets.only(left: 5, bottom: 2, right: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Tên Sản Phẩm shop_home',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    ' _:VNĐ',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.indigo[500],
                        fontWeight: FontWeight.w900),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Số Lượng: 12',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(18.0),
                          child: Icon(
                            Icons.more_horiz,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
