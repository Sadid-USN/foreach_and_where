import 'package:hive/hive.dart';
import 'package:list_filtring/Hive/item.dart';

class Boxes{
 static Box<ItemBudget> getItemBudget() =>
 Hive.box<ItemBudget>('budget');

}