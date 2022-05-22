import 'package:assignment/constants/colors.dart';
import 'package:assignment/screens/result_screen.dart';
import 'package:assignment/widgets/button_widget.dart';
import 'package:flutter/material.dart';

import '../constants/available_data.dart';
import '../constants/text_styles.dart';
import '../models/input_data.dart';
import '../widgets/responsive.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController controller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Matches"),
        centerTitle: true,
        backgroundColor: AppColors.logoColor,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(
              top: Responsive.isMobile(context)
                  ? screenSize.height * 0.05
                  : screenSize.height * 0.15,
              left: Responsive.isMobile(context) ? 10 : 30,
              right: Responsive.isMobile(context) ? 10 : 30),
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: inputData.length,
            controller: controller,
            itemBuilder: (context, position) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text.rich(TextSpan(
                      style: headingStyle(),
                      text: 'Select the matching strings for the word \t',
                      children: <InlineSpan>[
                        TextSpan(
                          text: '"${inputData[position].trueOption}".',
                          style: headingStyleBold(),
                        )
                      ])),
                  const SizedBox(
                    height: 10,
                  ),
                  optionRow(
                    inputData[position].option1,
                    position,
                  ),
                  optionRow(inputData[position].option2, position),
                  optionRow(inputData[position].option3, position),
                  SizedBox(
                    height: Responsive.isMobile(context) ? 20 : 50,
                  ),
                  Row(
                    mainAxisAlignment: Responsive.isMobile(context)
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.start,
                    children: [
                      ButtonWidget(
                        onPressed: () => currentPage >= 1
                            ? setState(() {
                                currentPage--;
                                controller.jumpToPage(currentPage);
                              })
                            : null,
                        title: "Prev",
                        minWidth: Responsive.isMobile(context)
                            ? screenSize.width * 0.3
                            : 100,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Responsive.isMobile(context)
                                ? 0
                                : screenSize.width * 0.015),
                        child: Text("${position + 1} / ${inputData.length}"),
                      ),
                      currentPage == inputData.length - 1
                          ? ButtonWidget(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ResultScreen()));
                              },
                              title: "Submit",
                              minWidth: Responsive.isMobile(context)
                                  ? screenSize.width * 0.3
                                  : 100)
                          : ButtonWidget(
                              onPressed: () {
                                currentPage < inputData.length - 1
                                    ? setState(() {
                                        currentPage++;
                                        controller.jumpToPage(currentPage);
                                      })
                                    : null;
                              },
                              title: "Next",
                              minWidth: Responsive.isMobile(context)
                                  ? screenSize.width * 0.3
                                  : 100),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget optionRow(Option option, int index) => GestureDetector(
        onTap: () => setState(() {
          option.isSelected = !option.isSelected;
          if (option.isSelected) {
            inputData[index].selectedCount++;
          } else {
            inputData[index].selectedCount--;
          }
        }),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: Responsive.isMobile(context) ? 0 : 5),
          child: Row(
            children: [
              Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor: AppColors.logoColor,
                ),
                child: Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  activeColor: AppColors.logoColor,
                  checkColor: AppColors.white,
                  value: option.isSelected,
                  onChanged: (value) {
                    option.isSelected = value!;
                    if (option.isSelected) {
                      inputData[index].selectedCount++;
                    } else {
                      inputData[index].selectedCount--;
                    }
                    setState(() {});
                  },
                ),
              ),
              Text(option.optionValue,
                  style: optionStyle(isSelected: option.isSelected)),
            ],
          ),
        ),
      );
}
