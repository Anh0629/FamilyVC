// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_app/consts/_list/Model/category_list_model.dart';
import 'package:flutter_app/screens/Widget/Categori_detail.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryAttributes = Provider.of<CategoryModel>(context);

    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        CategoryDetail.routeName,
        arguments: categoryAttributes.id,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2.0),
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Theme.of(context).primaryColorLight,
          ),
          // border: Border.all(style: ) ),
          color: Theme.of(context).backgroundColor,
        ),
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                      minHeight: 50,
                      maxHeight: MediaQuery.of(context).size.height * 0.15),
                  child: Image.asset(
                    'assets/images/healthyfood.png',
                    fit: BoxFit.fitWidth,
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

                    // đổ dữ liệu category
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          categoryAttributes.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 14,
                              // ignore: deprecated_member_use
                              color: Theme.of(context).textSelectionColor,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
