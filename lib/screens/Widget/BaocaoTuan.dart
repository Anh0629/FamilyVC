import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Widget/product_details.dart';

class BaocaoTuan extends StatefulWidget {
  @override
  _BaocaoTuanState createState() => _BaocaoTuanState();
}

class _BaocaoTuanState extends State<BaocaoTuan> {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(productDetails.routeName),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        width: 200,
        height: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: Container(
                width: double.infinity,
                constraints: BoxConstraints(
                    minHeight: 50,
                    maxHeight: MediaQuery.of(context).size.height * 0.2),
                child: Image.asset(
                  'assets/images/healthyfood.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            // Container(
            //   padding: EdgeInsets.only(left: 5),
            //   margin: EdgeInsets.only(left: 5, bottom: 2, right: 3),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       SizedBox(
            //         height: 4,
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Text(
            //           'Tên Sản Phẩm',
            //           overflow: TextOverflow.ellipsis,
            //           maxLines: 2,
            //           style: TextStyle(
            //               fontSize: 14,
            //               color: Colors.black,
            //               fontWeight: FontWeight.w600),
            //         ),
            //       ),
            //       // Text(
            //       //   ' _:VNĐ',
            //       //   overflow: TextOverflow.ellipsis,
            //       //   maxLines: 2,
            //       //   style: TextStyle(
            //       //       fontSize: 16,
            //       //       color: Colors.indigo[500],
            //       //       fontWeight: FontWeight.w900),
            //       // ),
            //       // Row(
            //       //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       //   children: [
            //       //     Text(
            //       //       'Số Lượng: 12',
            //       //       overflow: TextOverflow.ellipsis,
            //       //       maxLines: 2,
            //       //       style: TextStyle(
            //       //           fontSize: 10,
            //       //           color: Colors.grey,
            //       //           fontWeight: FontWeight.w600),
            //       //     ),
            //       //     Material(
            //       //       color: Colors.transparent,
            //       //       child: InkWell(
            //       //         onTap: () {},
            //       //         borderRadius: BorderRadius.circular(18.0),
            //       //         child: Icon(
            //       //           Icons.more_horiz,
            //       //           color: Colors.grey,
            //       //         ),
            //       //       ),
            //       //     )
            //         ],
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
