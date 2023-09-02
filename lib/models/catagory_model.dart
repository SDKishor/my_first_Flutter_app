import 'package:flutter/material.dart';

class CatagoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CatagoryModel({
    required this.boxColor,
    required this.name,
    required this.iconPath,
  });

  static List<CatagoryModel> getCatagoryModel() {
    List<CatagoryModel> catagories = [];

    catagories.add(CatagoryModel(
        name: 'Salad',
        iconPath: 'assets/images/plate.svg',
        boxColor: const Color(0xff9DCEFF)));

    catagories.add(CatagoryModel(
        name: 'Cake',
        iconPath: 'assets/images/pancakes.svg',
        boxColor: const Color(0xffEEA4CE)));

    catagories.add(CatagoryModel(
        name: 'Pie',
        iconPath: 'assets/images/pie.svg',
        boxColor: const Color(0xff9DCEFF)));

    catagories.add(CatagoryModel(
        name: 'Smoothies',
        iconPath: 'assets/images/orange-snacks.svg',
        boxColor: const Color(0xffEEA4CE)));

    return catagories;
  }
}
