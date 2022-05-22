import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final double minWidth;

  const ButtonWidget(
      {Key? key, this.title = "Next", this.onPressed, required this.minWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(.5),
          padding:
              MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9.0),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Ink(
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.black),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Container(
            constraints: BoxConstraints(
                minWidth: minWidth,
                minHeight: 40.0), // min sizes for Material buttons
            alignment: Alignment.center,
            child: Text(
              title.toUpperCase(),
              style: const TextStyle(fontSize: 14, color: AppColors.black),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
