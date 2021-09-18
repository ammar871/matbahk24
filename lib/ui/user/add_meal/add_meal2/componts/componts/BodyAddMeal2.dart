import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:matbahk24/ui/user/add_meal/add_meal1/componts/BarAddMeal.dart';



import 'FormAddMeal2.dart';

class BodyAddMeal2 extends StatelessWidget {
  final String nameMeal,descMeal;
  final List<String> fields;


  BodyAddMeal2({required this.nameMeal, required this.descMeal, required this.fields});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BarAddMeal(2,'اضافة وجبة جديدة'),
          FormAddMeal2(nameMeal:nameMeal,descMeal:descMeal,fields:fields),
        ],
      ),
    );
  }
}


