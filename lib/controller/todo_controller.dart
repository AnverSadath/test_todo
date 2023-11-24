//import 'package:flutter/material.dart';
import 'package:flutter_application_7/modelclass/model_class.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Todolistcontroller {
  var box = Hive.box<todomodel>("todobox");

  addelementToBox(dynamic name) {
    box.add(todomodel(title: name, iscompleted: false));

    print(box.keys);
    print(box.get(25)?.title);
  }
}
