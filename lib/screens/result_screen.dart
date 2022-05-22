import 'package:assignment/constants/available_data.dart';
import 'package:assignment/constants/colors.dart';
import 'package:assignment/constants/text_styles.dart';
import 'package:assignment/models/input_data.dart';
import 'package:flutter/material.dart';

import '../widgets/responsive.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool isMatch = true;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Results"),
        centerTitle: true,
        backgroundColor: AppColors.logoColor,
        elevation: 0.0,
      ),
      body: Container(
        margin: EdgeInsets.only(
            top: Responsive.isMobile(context) ? screenSize.height * 0.05 : 20,
            left: Responsive.isMobile(context) ? 10 : 30,
            right: Responsive.isMobile(context) ? 10 : 30),
        child: Column(
          children: [
            tabButtons(screenSize: screenSize),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: inputData.length,
                  itemBuilder: (context, index) =>
                      (inputData[index].selectedCount == 0 && isMatch) ||
                              (inputData[index].selectedCount == 3 && !isMatch)
                          ? const SizedBox()
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    inputData[index].trueOption,
                                    style: headingStyleBold(),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Wrap(
                                    children: [
                                      rowText(
                                        inputData[index].option1,
                                      ),
                                      rowText(
                                        inputData[index].option2,
                                      ),
                                      rowText(
                                        inputData[index].option3,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
            )
          ],
        ),
      ),
    );
  }

  Widget rowText(
    Option option,
  ) =>
      (!isMatch && !option.isSelected) || (isMatch && option.isSelected)
          ? Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Chip(
                elevation: 2,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                backgroundColor: AppColors.white,
                shadowColor: Colors.black,
                //CircleAvatar
                label: Text(
                  option.optionValue,
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : const SizedBox();

  tabButtons({required Size screenSize}) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () => setState(() {
                    isMatch = true;
                  }),
              child: Container(
                height: 50,
                width: Responsive.isMobile(context)
                    ? screenSize.width * 0.4
                    : screenSize.width * 0.2,
                decoration: BoxDecoration(
                    color: isMatch
                        ? AppColors.logoColor
                        : AppColors.btnHintBgColor,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    "Matches",
                    style: isMatch
                        ? whiteHeadingStyleBold(color: AppColors.white)
                        : whiteHeadingStyleBold(),
                  ),
                ),
              )),
          GestureDetector(
              onTap: () => setState(() {
                    isMatch = false;
                  }),
              child: Container(
                height: 50,
                width: Responsive.isMobile(context)
                    ? screenSize.width * 0.4
                    : screenSize.width * 0.2,
                decoration: BoxDecoration(
                    color: !isMatch
                        ? AppColors.logoColor
                        : AppColors.btnHintBgColor,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    "MisMatches",
                    style: !isMatch
                        ? whiteHeadingStyleBold(color: AppColors.white)
                        : whiteHeadingStyleBold(),
                  ),
                ),
              )),
        ],
      );
}
