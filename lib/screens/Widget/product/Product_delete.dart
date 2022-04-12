import 'package:flutter/material.dart';
import 'package:flutter_app/consts/_list/Model/category_list_model.dart';
import 'package:flutter_app/consts/_list/utils/global_method.dart';
import 'package:flutter_app/consts/_list/view_model/category_view_model.dart';
import 'package:flutter_app/consts/_list/view_model/products_view_model.dart';
import 'package:provider/provider.dart';

class ProductDeleteScreen extends StatefulWidget {
  static const routerName = '/ProductDeleteScreen';
  @override
  _ProductDeleteScreenState createState() => _ProductDeleteScreenState();
}

class _ProductDeleteScreenState extends State<ProductDeleteScreen> {
   final TextEditingController _category = TextEditingController();
   final TextEditingController _categoryId = TextEditingController();
   

  // ignore: unused_field
  String? _categoryValue;
  

  @override
  Widget build(BuildContext context) {
    CategoryViewModel _categoryViewModel =
        Provider.of<CategoryViewModel>(context);
        ProductViewModel productViewModel = Provider.of<ProductViewModel>(context);
    final productListByCategory = productViewModel.findByCategory(_categoryId.toString());
    
List<dynamic> list =[];
var a = Map.fromIterable(productListByCategory);
void maplist(){
  a.forEach((key, value) {
    list.add(value);
  });
}

GlobalMethods globalMethod = GlobalMethods();

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(title: Text("Delete Product ")),
      body: Container(
        padding: const EdgeInsets.all(.0),
        color: Theme.of(context).primaryColorLight,
        child: Column(children: [
          DropdownButton<CategoryModel>(
                items: _categoryViewModel.categoryList
                    .map(globalMethod.bildDropdownMenuWithtest1)
                    .toList(),
                hint: Text(_category.text),
                onChanged: (value) {
                  setState(() {
                    this._categoryValue = value!.id;
                    _categoryId.text = value.id;
                    _category.text = value.name;
                    print("value.id" + value.id);

                    print('----------------');
                    print(a);
                    print(list.toString());
                    maplist();
                    print('object');
                    print(productListByCategory);
                    print(_categoryId.toString());
                    
                  });
                },
              ),
              Container(
                
                child: Column(children: [
              globalMethod.textFromFieldWithTest1(_categoryId,'Id category',context)
                ],),
              ),
              Container(
              color: Theme.of(context).backgroundColor,
              padding: EdgeInsets.only(top: 8),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
               
                children: List.generate(
                  productListByCategory.length,
                  (index) {
                    return ChangeNotifierProvider.value(
                      value: productListByCategory[index],
                      
                      
                      
                    );
                  },
                ),
              ),
            ),
             
        ]),
      ),
    );
  }
}
