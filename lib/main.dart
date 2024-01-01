import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'input_data.dart';
import 'input_page.dart';

void main() {
  runApp(BMIcalculator());
}

class BMIcalculator extends StatelessWidget {
  BMIcalculator({Key? key}) : super(key: key);

  final InputData inputdata = Get.put(InputData());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0E0F20),
        primaryColor: Color(0xFF0E0F20)
      ),
      home: InputPage(),

    );
  }
}
