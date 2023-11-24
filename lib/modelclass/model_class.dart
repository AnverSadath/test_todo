import 'package:hive_flutter/adapters.dart';

part 'model_class.g.dart';

@HiveType(typeId: 1)
class todomodel {
  @HiveField(0)
  String title;
  @HiveField(1)
  bool iscompleted;

  todomodel({required this.title, required this.iscompleted});
}
