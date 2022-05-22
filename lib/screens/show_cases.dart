import 'dart:developer';

import 'package:assignment/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:showcaseview/showcaseview.dart';

import '../constants/colors.dart';
import '../constants/text_styles.dart';
import '../widgets/button_widget.dart';
import '../widgets/responsive.dart';

class ShowCasesScreen extends StatelessWidget {
  const ShowCasesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      onStart: (index, key) {
        log('onStart: $index, $key');
      },
      onComplete: (index, key) {
        log('onComplete: $index, $key');
        if (index == 4) {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle.light.copyWith(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: Colors.white,
            ),
          );
        }
      },
      blurValue: 1,
      builder: Builder(builder: (context) => const ShowCaseQuestion()),
      autoPlayDelay: const Duration(seconds: 3),
    );
  }
}

class ShowCaseQuestion extends StatefulWidget {
  const ShowCaseQuestion({Key? key}) : super(key: key);

  @override
  _ShowCaseQuestionState createState() => _ShowCaseQuestionState();
}

class _ShowCaseQuestionState extends State<ShowCaseQuestion> {
  final GlobalKey _one = GlobalKey();
  final GlobalKey _two = GlobalKey();
  final GlobalKey _three = GlobalKey();
  final GlobalKey _four = GlobalKey();
  final GlobalKey _five = GlobalKey();
  final GlobalKey _six = GlobalKey();

  @override
  void initState() {
    super.initState();
    //Start showcase view after current widget frames are drawn.
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) => ShowCaseWidget.of(context)!
          .startShowCase([_one, _two, _three, _four, _five, _six]),
    );
  }

  bool option1 = false, option2 = false, option3 = false;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("User Guides"),
        centerTitle: true,
        backgroundColor: AppColors.logoColor,
        elevation: 0.0,
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          margin: EdgeInsets.only(
              top: Responsive.isMobile(context)
                  ? screenSize.height * 0.05
                  : screenSize.height * 0.15,
              left: Responsive.isMobile(context) ? 10 : 30,
              right: Responsive.isMobile(context) ? 10 : 30),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              Showcase(
                key: _one,
                description: 'select the matches for the given word',
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text.rich(TextSpan(
                      style: headingStyle(),
                      text: 'Select the matching strings for the word \t',
                      children: <InlineSpan>[
                        TextSpan(
                          text: '"pepper-flavouring".',
                          style: headingStyleBold(),
                        )
                      ])),
                ),
              ),
              verticalSpace(),

              Showcase(
                  key: _two,
                  description: 'Tap to select the match',
                  child: GestureDetector(
                    onTap: () => setState(() {
                      option1 = !option1;
                    }),
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
                            value: option1,
                            onChanged: (value) {
                              option1 = value!;
                              setState(() {});
                            },
                          ),
                        ),
                        Text("peppermint-flavouring", style: optionStyle()),
                      ],
                    ),
                  )),
              verticalSpace(),
              GestureDetector(
                onTap: () => setState(() {
                  option2 = !option2;
                }),
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
                        value: option2,
                        onChanged: (value) {
                          option2 = value!;
                          setState(() {});
                        },
                      ),
                    ),
                    Text("peppermint-flavouring", style: optionStyle()),
                  ],
                ),
              ),
              verticalSpace(),

              GestureDetector(
                onTap: () => setState(() {
                  option3 = !option3;
                }),
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
                        value: option3,
                        onChanged: (value) {
                          option3 = value!;
                          setState(() {});
                        },
                      ),
                    ),
                    Text("pepper-flavouring", style: optionStyle()),
                  ],
                ),
              ),
              SizedBox(
                height: Responsive.isMobile(context) ? 20 : 50,
              ),
              Row(
                mainAxisAlignment: Responsive.isMobile(context)
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.center,
                children: [
                  Showcase(
                      key: _three,
                      description: 'Tap to view previous string',
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ButtonWidget(
                          title: "Prev",
                          minWidth: Responsive.isMobile(context)
                              ? screenSize.width * 0.3
                              : 100,
                        ),
                      )),
                  Showcase(
                      key: _four,
                      description:
                          'you attempted question and the remaining left',
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Responsive.isMobile(context)
                                  ? 0
                                  : screenSize.width * 0.015),
                          child: const Text("1 / 5"),
                        ),
                      )),
                  Showcase(
                      key: _five,
                      description:
                          'Tap to view Next string until you get Submit button',
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ButtonWidget(
                          title: "Next",
                          minWidth: Responsive.isMobile(context)
                              ? screenSize.width * 0.3
                              : 100,
                        ),
                      )),
                ],
              ),
              SizedBox(height: screenSize.height*0.2,),
              SizedBox(
                width: Responsive.isMobile(context)?screenSize.width:screenSize.width*0.4,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:AppColors.logoColor,
                    minimumSize: const Size.fromHeight(50), // NEW
                  ),
                  onPressed: ()=> Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen())),
                  child:  Text(
                    'Start',
                    style: whiteHeadingStyleBold(color: AppColors.white),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
      floatingActionButton: Showcase(
        key: _six,
        description: 'Click here to view guidelines',
        shapeBorder: const CircleBorder(),
        child: FloatingActionButton(
          backgroundColor: AppColors.logoColor,
          onPressed: () {
            setState(() {
              ShowCaseWidget.of(context)!
                  .startShowCase([_one, _two, _three, _four, _five, _six]);
            });
          },
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
  Widget verticalSpace()=>SizedBox(height: Responsive.isMobile(context)?0:10,);
}
