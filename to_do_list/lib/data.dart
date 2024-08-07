import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'data.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  String name = '';
  @HiveField(1)
  bool isCompleted = false;
  @HiveField(2)
  Priorety priorety = Priorety.low;
}

@HiveType(typeId: 1)
enum Priorety {
  @HiveField(0)
  low,
  @HiveField(1)
  normal,
  @HiveField(2)
  hight
}
