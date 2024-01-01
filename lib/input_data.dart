import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'input_page.dart';

enum Gender{
  Male,
  Female,
}


class InputData extends GetxController{
  var Height = 180.obs;
  var Weight = 60.obs;
  var age = 18.obs;
  Rx<Gender>? SelectedGender = Gender.Male.obs;


  increaseHeight(){
    Height+=1;
  }
  decreaseHeight(){
    Height-=1;
  }
  increaseWeight(){
      Weight+=1;
    }
  decreaseWeight(){
    Weight-=1;
  }
increaseAge(){
      age+=1;
    }
  decreaseAge(){
    age-=1;
  }

}