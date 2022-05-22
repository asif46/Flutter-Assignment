import 'dart:convert';

List<InputData> inputDataFromJson(String str) =>
    List<InputData>.from(json.decode(str).map((x) => InputData.fromJson(x)));

class Option {
  String optionValue;
  bool isSelected;
  Option({
    this.isSelected = false,
    required this.optionValue,
  });
}

class InputData {
  InputData({
    this.selectedCount=0,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    required this.trueOption,
  });
  int selectedCount;
  Option option1;
  Option option2;
  Option option3;
  Option option4;
  String trueOption;

  factory InputData.fromJson(Map<String, dynamic> json) => InputData(
        option1: Option(optionValue: json["1"] ?? ''),
        option2: Option(optionValue: json["2"] ?? ''),
        option3: Option(optionValue: json["3"] ?? ''),
        option4: Option(optionValue: json["4"] ?? ''),
        trueOption: json["true string"] ?? '',
      );
}
