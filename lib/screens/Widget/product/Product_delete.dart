import 'package:flutter/material.dart';
import 'package:flutter_app/consts/_list/Model/category_list_model.dart';
import 'package:flutter_app/consts/_list/Model/product_list_model.dart';
import 'package:flutter_app/consts/_list/view_model/category_view_model.dart';
import 'package:flutter_app/consts/_list/view_model/products_view_model.dart';
import 'package:flutter_app/screens/Widget/Feeds_products.dart';
import 'package:flutter_app/screens/Widget/product/test1.dart';
import 'package:provider/provider.dart';

class ProductDeleteScreen extends StatefulWidget {
  static const routerName = '/ProductDeleteScreen';
  @override
  _ProductDeleteScreenState createState() => _ProductDeleteScreenState();
}

class _ProductDeleteScreenState extends State<ProductDeleteScreen> {
   final TextEditingController _category = TextEditingController();
   final TextEditingController _categoryId = TextEditingController();
   

  String? _categoryValue;
  

  @override
  Widget build(BuildContext context) {
    CategoryViewModel _categoryViewModel =
        Provider.of<CategoryViewModel>(context);
        ProductViewModel productViewModel = Provider.of<ProductViewModel>(context);
    final productListByCategory = productViewModel.findByCategory(_categoryId.toString());




    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(title: Text("Delete Product ")),
      body: Container(
        padding: const EdgeInsets.all(.0),
        color: Theme.of(context).primaryColorLight,
        child: Column(children: [
          DropdownButton<CategoryModel>(
                items: _categoryViewModel.categoryList
                    .map(bildDropdownMenuWithtest1)
                    .toList(),
                hint: Text(_category.text),
                onChanged: (value) {
                  setState(() {
                    this._categoryValue = value!.id;
                    _categoryId.text = value.id;
                    _category.text = value.name;
                    print("value.id" + value.id);

                    print('----------------');
                    print(productListByCategory);
                    
                  });
                },
              ),
              Container(
                
                child: Column(children: [
                  textFromFieldWithTest1(_categoryId,'Id category',context)
                ],),
              ),
             
        ]),
      ),
    );
  }
}
