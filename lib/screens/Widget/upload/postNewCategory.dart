// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_app/consts/_list/Model/category_list_model.dart';
import 'package:flutter_app/consts/_list/view_model/category_view_model.dart';
import 'package:provider/provider.dart';

class NewCategory extends StatefulWidget {
  static const routeName = '/NewCategory';
  @override
  NewCategoryState createState() => NewCategoryState();
}

class NewCategoryState extends State<NewCategory> {
  final _fromkey = GlobalKey<FormState>();

  final TextEditingController _newcategory = TextEditingController();
  final TextEditingController _deleteCategory = TextEditingController();

  String? _categoryValue;

  @override
  Widget build(BuildContext context) {
    CategoryViewModel _categoryViewModel =
        Provider.of<CategoryViewModel>(context);
    CategoryModel _categoryModel = Provider.of<CategoryModel>(context);
    // String _categoryId = _categoryModel.id;
    return Scaffold(
      appBar: AppBar(title: Text("Category") ,),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            
            children: [
      Container(
          child: Column(
            children: [
              Form(
                key: _fromkey,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(children: [
                    Text('new category'),
                    textFromField(_newcategory, "", context)
                  ]),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    Map<dynamic, dynamic> datanew = {};
                    if (_fromkey.currentState!.validate()) {
                      datanew = {
                        "name": _newcategory.text,
                      };
                      await _categoryViewModel.postCategory(datanew);
                      await _categoryViewModel.getCategory();
                    }
                  },
                  child: Text("Create ")),
            ],
          ),
      ),
      Container(
          child: Column(
            children: [
              Container(
                child: TextFormField(
                  enabled: false,
                  controller: _deleteCategory,
                  key: ValueKey("Category Delete"),
                  maxLines: 2,
                  decoration: InputDecoration(
                    labelText: 'Category DElete',
                    hintText: 'category description',
                  ),
                ),
              ),
              DropdownButton<CategoryModel>(
                items: _categoryViewModel.categoryList
                    .map(bildDropdownMenu)
                    .toList(),
                hint: Text(_deleteCategory.text),
                onChanged: (value) {
                  setState(() {
                    this._categoryValue = value!.id;
                    _deleteCategory.text = value.name;
                    print("value.id" + value.id);
                  });
                },
              ),
              ElevatedButton(
                  onPressed: () async {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            scrollable: true,
                            backgroundColor: Colors.orangeAccent,
                            actions: [
                              ElevatedButton(
                                onPressed: () async {
                                  await _categoryViewModel
                                      .deleteCategory(_categoryValue);
                                  _categoryValue =
                                      await _categoryViewModel.getCategory();
                                  Navigator.pop(context);
                                  print("--------------------------");
                                  print(_categoryValue);
                                },
                                child: Text("Delete Category"),
                              ),
                              ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(" Cancer"))
                            ],
                          );
                        });
                  },
                  child: Text("Delete category"))
            ],
          ),
      )
    ]),
        ));
  }

  Widget textFromField(
      TextEditingController controller, String title, BuildContext context) {
    return Material(
      child: InkWell(
          child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            labelText: title,
            labelStyle: TextStyle(color: Colors.black),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 182, 77, 77), width: 3))),
      )),
    );
  }

  DropdownMenuItem<CategoryModel> bildDropdownMenu(CategoryModel item) {
    return DropdownMenuItem(
        value: item,
        child: Text(
          item.name,
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ));
  }

  void showPopup(String title, String subtitle, Function fct) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text(title),
            content: Text(subtitle),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text('Huỷ')),
              TextButton(onPressed: () => fct, child: Text('Xoá'))
            ],
          );
        });
  }
}
