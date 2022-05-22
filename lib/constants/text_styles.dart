import 'package:assignment/constants/colors.dart';
import 'package:flutter/cupertino.dart';


  TextStyle headingStyle() => const TextStyle(
      color: AppColors.black, fontSize: 18, );
  TextStyle headingStyleBold() => const TextStyle(
      color: AppColors.black, fontSize: 20, fontWeight: FontWeight.bold);
TextStyle whiteHeadingStyleBold({Color color=AppColors.black}) =>  TextStyle(
      color: color, fontSize: 16, fontWeight: FontWeight.w500);

  TextStyle optionStyle({bool isSelected=false}) =>const TextStyle(
      color: AppColors.black, fontSize:16, fontWeight:FontWeight.w200);

