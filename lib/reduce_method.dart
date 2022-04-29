

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:list_filtring/Hive/box.dart';
import 'package:list_filtring/Hive/item.dart';
import 'package:list_filtring/widget/form_input_filed.dart';

class ReduceMethod extends StatefulWidget {
  const ReduceMethod({Key? key}) : super(key: key);

  @override
  State<ReduceMethod> createState() => _ReduceMethodState();
}

class _ReduceMethodState extends State<ReduceMethod> {
  List<ItemBudget> items = [];
  Box ? box;
  final _formkey = GlobalKey<FormState>();
  TextEditingController _itemController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _itemController = TextEditingController();
    _priceController = TextEditingController();
   

  }


  @override
  void dispose() {
    _priceController.dispose();
    _itemController.dispose();
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Map Function'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FormInputField(
                    itemController: _itemController,
                    hintText: 'Item',
                    validateMessage: 'Please provide the item name',
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FormInputField(
                    itemController: _priceController,
                    hintText: 'Price',
                    validateMessage: 'Please provide the price',
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                    
                        setState(() {
                          if (_formkey.currentState!.validate()) {
                            items.add(
                              ItemBudget()
                              ..itemName = _itemController.text
                              ..itemPrice = double.parse(_priceController.text),
                              
                            );
                            final box = Boxes.getItemBudget();
                            // box.add(item);
                         
                         
                          }
                            
                          _itemController.clear();
                          _priceController.clear();
                        });
                      },
                      child: const Text(
                        'Enter',
                        style: TextStyle(fontSize: 20),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  DataTable(
                    columns: const [
                      DataColumn(
                        label: Text('Item'),
                      ),
                      DataColumn(
                        label: Text('Price'),
                      ),
                    ],
                    rows: [
                      ...items.map(
                        (element) => DataRow(
                          cells: [
                            DataCell(
                              Text(element.itemName!),
                            ),
                            DataCell(
                              Text('${element.itemPrice!} \$'),
                            ),
                          ],
                        ),
                      ),
                      DataRow(cells: [
                        const DataCell(
                          Text('Total Expenses'),
                        ),
                        DataCell(
                          //TODO Calculate the total expenses
                          Text(items.isNotEmpty
                              ? '${items
                                  .map((e) => e.itemPrice)
                                  .reduce((value, element) => value! + element!)} \$'
                              : '0'),
                        ),
                      ]),
                      DataRow(
                        cells: [
                        
                           const DataCell(
                            //TODO Calculate the rest budget with an init budget of 500$
                            Text('Rest Budget'),
                          ),
                          DataCell(
                         
                            Text(
                              
                              '${items.fold<double>(500, (previousValue, element) => previousValue - element.itemPrice!)} \$'
                              
                              )
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Iterable<DataRow> mapItemToDataRows(List<Item> items) {
    Iterable<DataRow> dataRows = items.map((item) {
      return DataRow(cells: [
        DataCell(
          Text(item.itemName!),
        ),
        DataCell(
          Text(
            item.itemPrice.toString(),
          ),
        ),
      ]);
    });
    return dataRows;
  }
}

class Item {
  String? itemName;
  double? itemPrice;
  Item({this.itemName, this.itemPrice});
}
