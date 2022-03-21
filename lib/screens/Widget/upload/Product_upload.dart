// import 'dart:io';

// import 'package:ECommerceApp/consts/colors.dart';
// import 'package:ECommerceApp/services/global_method.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/consts/_list/Model/category_list_model.dart';
import 'package:flutter_app/consts/_list/view_model/category_view_model.dart';
// import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class UploadProductForm extends StatefulWidget {
  static const routeName = '/UploadProductForm';

  @override
  _UploadProductFormState createState() => _UploadProductFormState();
}

class _UploadProductFormState extends State<UploadProductForm> {
  final _formKey = GlobalKey<FormState>();
  
  bool validate = false;
  // ignore: unused_field
  var _productTitle = '';
  // ignore: unused_field
  var _productPrice = '';
  // ignore: unused_field
  var _productCategory = '';
  // ignore: unused_field
  var _productDescription = '';
  // ignore: unused_field
  var _productQuantity = '';
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _productTitleController = TextEditingController();
  final TextEditingController _productQuantityController =
      TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();
  final TextEditingController _productDescriptionController =
      TextEditingController();

   final TextEditingController _addnewcategory = TextEditingController();   
  Map<String, dynamic>? data = {};
    // ignore: unused_field
    String? _categoryValue;


  // var uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    CategoryViewModel categoryViewModel =
        Provider.of<CategoryViewModel>(context);
        
    

    return Scaffold(
        appBar: AppBar(
          title: Text('Thêm sản phẩm'),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Center(
              child: Card(
                  margin: EdgeInsets.all(15),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 9),
                                  child: TextFormField(
                                    controller: _productTitleController,
                                    key: ValueKey('Title'),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter a Title';
                                      }
                                      return null;
                                    },
                                   
                                    decoration: InputDecoration(
                                      labelText: 'Product Title',
                                    ),
                                    onSaved: (value) {
                                      _productTitle = value!;
                                    },
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: TextFormField(
                                  controller: _productPriceController,
                                  key: ValueKey('Price \$'),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Price is missed';
                                    }
                                    return null;
                                  },
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                  ],
                                  decoration: InputDecoration(
                                    labelText: 'Price \$',
                                    suffixIcon: Text(
                                      '\n \n \$',
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  obscureText: false,
                                  onSaved: (value) {
                                    _productPrice = value!;
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          /* Image picker here ***********************************/
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                //  flex: 2,
                                child:
                                    // this._pickedImage == null
                                    //     ?
                                    // Container(
                                    //         margin: EdgeInsets.all(10),
                                    //         height: 200,
                                    //         width: 200,
                                    //         decoration: BoxDecoration(
                                    //           border: Border.all(width: 1),
                                    //           borderRadius: BorderRadius.circular(4),
                                    //           color:
                                    //               Theme.of(context).backgroundColor,
                                    //         ),
                                    //       )
                                    //     :
                                    Container(
                                  margin: EdgeInsets.all(10),
                                  height: 200,
                                  width: 200,
                                  child: Container(
                                    height: 200,
                                    // width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: const Radius.circular(40.0),
                                      ),
                                      color: Theme.of(context).backgroundColor,
                                    ),
                                    child: Image.asset(
                                        'assets/images/healthyfood.png'),
                                    // child: Image.file(
                                    //   this._pickedImage,
                                    //   fit: BoxFit.contain,
                                    //   alignment: Alignment.center,
                                    // ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FittedBox(
                                    // ignore: deprecated_member_use
                                    child: FlatButton.icon(
                                      textColor: Colors.white,
                                      onPressed: () {},
                                      //_pickImageCamera,
                                      icon: Icon(Icons.camera,
                                          color: Colors.purpleAccent),
                                      label: Text(
                                        'Camera',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context)
                                              // ignore: deprecated_member_use
                                              .textSelectionColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  FittedBox(
                                    // ignore: deprecated_member_use
                                    child: FlatButton.icon(
                                      textColor: Colors.white,
                                      onPressed: () {},
                                      //_pickImageGallery,
                                      icon: Icon(Icons.image,
                                          color: Colors.purpleAccent),
                                      label: Text(
                                        'Gallery',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context)
                                              // ignore: deprecated_member_use
                                              .textSelectionColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  FittedBox(
                                    // ignore: deprecated_member_use
                                    child: FlatButton.icon(
                                      textColor: Colors.white,
                                      onPressed: () {},
                                      //_removeImage,
                                      icon: Icon(
                                        Icons.remove_circle_rounded,
                                        color: Colors.red,
                                      ),
                                      label: Text(
                                        'Remove',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          //    SizedBox(height: 5),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                // flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 9),
                                  child: Container(
                                    child: TextFormField(
                                      enabled: false,
                                      controller: _addnewcategory,
                                      key: ValueKey('Category'),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter a Category';
                                        }
                                        return null;
                                      },
                                      //keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        labelText: 'Add a new Category',
                                      ),
                                      onSaved: (value) {
                                        _productCategory = value!;
                                      },
                                    ),
                                  ),
                                ),
                              ),

                              //buttom danh muc ----------------------------------------------------
                              DropdownButton<CategoryModel>(
                                
                                items: categoryViewModel.categoryList
                                    .map(buildDropdownMenuItem)
                                    .toList(),
                                hint: Text('Danh muc'),
                                onChanged: (newValue) {
                                  setState(() {
                                    this._categoryValue = newValue!.id;
                                    print(newValue.id);
                                    _categoryController.text = newValue.name;
                                  });
                                },
                              ),
                            ],
                          ),

                          SizedBox(height: 15),
                          TextFormField(
                              controller: _productDescriptionController,
                              key: ValueKey('Description'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'product description is required';
                                }
                                return null;
                              },
                              //controller: this._controller,
                              maxLines: 10,
                              textCapitalization: TextCapitalization.sentences,
                              decoration: InputDecoration(
                                //  counterText: charLength.toString(),
                                labelText: 'Description',
                                hintText: 'Product description',
                                border: OutlineInputBorder(),
                              ),
                              onSaved: (value) {
                                _productDescription = value!;
                              },
                              onChanged: (text) {
                                // setState(() => charLength -= text.length);
                              }),
                          //    SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                //flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 9),
                                  child: TextFormField(
                                    controller: _productQuantityController,
                                    keyboardType: TextInputType.number,
                                    key: ValueKey('Quantity'),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Quantity is missed';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Quantity',
                                    ),
                                    onSaved: (value) {
                                      _productQuantity = value!;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          BottomAppBar(
                            child: Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      data = {
                                        "category": _addnewcategory.text,
                                        "name": _productTitleController.text,
                                        "price": _productPriceController.text,
                                        "description":
                                            _productDescriptionController.text,
                                        "countInStock":
                                            _productQuantityController.text,
                                      };

                                      var response = await http.post(
                                        Uri.parse(
                                            "http://localhost:4000/api/products"),
                                        headers: {
                                          'Content-Type': 'application/json',
                                        },
                                        body: json.encode(data),
                                        // "json object"== object
                                      );
                                      await categoryViewModel.postCategory(data.toString());
                                      await categoryViewModel.getCategory();

                                      if (response.statusCode == 200) {
                                        var data = json.decode(response.body);
                                        // object == "json object"

                                        if (data["status"]) {
                                          final snackBar = SnackBar(
                                            content: Text(data["message"]),
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        } else {
                                          final snackBar = SnackBar(
                                            content: Text(data["message"]),
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        }
                                      }
                                    }
                                  },
                                  child: Text(
                                    "Tạo Sản Phẩm",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )))
        ])));
  }

  DropdownMenuItem<CategoryModel> buildDropdownMenuItem(CategoryModel item) {
    return DropdownMenuItem(
      value: item,
      child: Text(
        item.name,
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
