import 'package:flutter/material.dart';
import 'package:list_filtring/widget/form_input_filed.dart';

class MapFunction extends StatefulWidget {
  const MapFunction({Key? key}) : super(key: key);

  @override
  State<MapFunction> createState() => _MapFunctionState();
}

class _MapFunctionState extends State<MapFunction> {
  List<Item> items = [];
  bool sort = false;

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
    super.dispose();
    _priceController.dispose();
    _itemController.dispose();
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
                      if (_formkey.currentState!.validate()) {
                        items.add(Item(
                            itemName: _itemController.text,
                            itemPrice: _priceController.text),);
                        setState(() {
                          _itemController.clear();
                          _priceController.clear();
                        });
                      }
                    },
                    child: const Text(
                      'Enter',
                      style: TextStyle(fontSize: 20),
                    )),
                const SizedBox(
                  height: 20,
                ),
                DataTable(
                  sortColumnIndex: 1,
                  sortAscending: sort,
                  columns: [
                    const DataColumn(
                      label: Text('Item'),
                    ),
                    DataColumn(
                      numeric: true,
                      onSort: (int index, bool ascending) {
                        if (ascending) {
                          items.sort(
                              (a, b) => b.itemPrice!.compareTo(a.itemPrice!));
                        } else {
                          items.sort(
                              (a, b) => a.itemPrice!.compareTo(b.itemPrice!));
                        }
                        setState(() {
                          sort = ascending;
                        });
                      },
                      label: const Text('Price'),
                    ),
                  ],
                  rows:
                      // TODO: Create a row for each item's name and item's price in the table

                      mapItemToDataRows(items).toList(),
                )
              ],
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
  String? itemPrice;
  Item({this.itemName, this.itemPrice});
}
