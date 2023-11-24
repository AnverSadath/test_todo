import 'package:flutter/material.dart';
// import 'package:flutter_application_7/controller/homescreencontroller.dart';
import 'package:flutter_application_7/homescreen/homescreen.dart';
import 'package:flutter_application_7/modelclass/model_class.dart';
import 'package:hive_flutter/hive_flutter.dart';

// import 'package:hive_flutter/adapters.dart';
// import 'package:provider/provider.dart';
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(todomodelAdapter());

  var box = await Hive.openBox<todomodel>("todobox");
  runApp(const ApiIntegration());
}

class ApiIntegration extends StatefulWidget {
  const ApiIntegration({super.key});

  @override
  State<ApiIntegration> createState() => _ApiIntegrationState();
}

class _ApiIntegrationState extends State<ApiIntegration> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home_screen(),
    );
  }
}
