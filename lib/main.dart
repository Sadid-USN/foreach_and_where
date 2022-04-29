import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:list_filtring/Hive/item.dart';
import 'package:list_filtring/reduce_method.dart';

void main() async{
 WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
   
  Hive.registerAdapter(ItemBudgetAdapter());
  await Hive.openBox<ItemBudget>('budget');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ReduceMethod(),
    );
  }
}




