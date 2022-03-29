import 'package:flutter/material.dart';
import 'package:flutter_app/consts/_list/Model/category_list_model.dart';

DropdownMenuItem<CategoryModel> bildDropdownMenuWithtest1(CategoryModel item) {
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
    Widget textFromFieldWithTest1(
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