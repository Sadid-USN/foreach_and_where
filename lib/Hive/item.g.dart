// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemBudgetAdapter extends TypeAdapter<ItemBudget> {
  @override
  final int typeId = 1;

  @override
  ItemBudget read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemBudget()
      ..itemName = fields[0] as String?
      ..itemPrice = fields[1] as double?;
  }

  @override
  void write(BinaryWriter writer, ItemBudget obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.itemName)
      ..writeByte(1)
      ..write(obj.itemPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemBudgetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
