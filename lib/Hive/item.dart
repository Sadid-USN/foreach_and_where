import 'package:hive/hive.dart';
part 'item.g.dart';

@HiveType(typeId: 1)
class ItemBudget {
  @HiveField(0)
 String ?itemName;

 @HiveField(1)
 double ?itemPrice;
}