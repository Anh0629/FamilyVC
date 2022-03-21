import 'package:flutter/material.dart';
import 'package:flutter_app/screens/feeds.dart';

class WishListEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: Center(
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: Column(children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage('assets/images/healthyfood.png'),
                ),
                // border: Border.all(color: Colors.black),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 60),
              child: Text(
                'Giỏ hàng của bạn đang không có gì nè !!!',
                style: TextStyle(
                    // ignore: deprecated_member_use
                    color: Theme.of(context).buttonColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic),
              ),
            ),
            Text(
              'Quay lại mua hàng tiếp nhé ',
              style: TextStyle(
                  // ignore: deprecated_member_use
                  color: Theme.of(context).buttonColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic),
            ),
            // ignore: deprecated_member_use
            Padding(
              padding: const EdgeInsets.all(35.0),
              // ignore: deprecated_member_use
              child: RaisedButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(FeedsScreen.routeName),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.pink.shade100),
                ),
                // ignore: deprecated_member_use
                color: Theme.of(context).buttonColor,
                child: SizedBox(
                  child: Center(
                    child: Icon(
                      Icons.shopping_cart_rounded,
                      color: Colors.white,
                    ),
                  ),
                  width: 20,
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
