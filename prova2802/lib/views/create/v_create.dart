
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/m_user.dart';
import '../../repository/r_central_implement.dart';

class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);

  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  bool isSwitched  = false;
  late final TextEditingController _nameController;
  late final TextEditingController _valuePriceController;
  late final TextEditingController _offerController;
  late final TextEditingController _categoryController;
  
  final CebtralRepositoryImplement _dioClient = CebtralRepositoryImplement();

  bool isCreating = false;

  @override
  void initState() {
    _nameController = TextEditingController();
    _valuePriceController = TextEditingController();

    _offerController = TextEditingController();
    _categoryController = TextEditingController();

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Column(
            children: [

              SizedBox(height: 16.0),


              TextField(
                controller: _nameController,
                decoration: InputDecoration(hintText: 'Enter name'),
              ),

              TextField(
                controller: _valuePriceController,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                decoration: InputDecoration(hintText: 'Enter Value Price'),
              ),
                
              TextField(
                controller: _categoryController,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                decoration: InputDecoration(hintText: 'Enter Value category'),
              ),

              Switch(
                value: isSwitched,
                
                onChanged: (value) {
                  setState(() {
                    
                    isSwitched = value;
                    
                  });
                  
                },

              ),
              
              SizedBox(height: 16.0),
              isCreating
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          isCreating = true;
                        });

                        if (_nameController.text != '' && _valuePriceController.text != '') {
                          PostProduto postproduto = PostProduto(
                            name: _nameController.text,
                            price: int.parse(_valuePriceController.text),
                            //file: ,
                            Offer: false,
                            categoryId: int.parse(_categoryController.text)
                          );

                          PostProduto? retrievedUser = await _dioClient
                              .createProduct(produto: postproduto);

                          if (retrievedUser != null) {
                            showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('ID: ${retrievedUser.id}'),
                                        Text('Name: ${retrievedUser.name}'),
                                        Text('path: ${retrievedUser.path}'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        }

                        setState(() {
                          isCreating = false;
                        });
                      },
                      child: Text(
                        'Create user',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
            ],
          ),
        ));
  }
}
