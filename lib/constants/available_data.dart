import '../models/input_data.dart';

List<InputData> inputData= List<InputData>.from([
{
"1": "cornflower",
"2": "cornflowers",
"3": "cornflours",
"4": "",
"true string": "corn-flour"
},
{
"1": "whole grain corn masa flour",
"2": "whole grain corn masa flours",
"3": "Whole grain corn masa flour",
"4": "",
"true string": "Whole grain corn masa flour"
},
{
"1": "melk",
"2": "melk",
"3": "goat milk",
"4": "",
"true string": "milk"
},
{
"1": "breaded with",
"2": "breaded with",
"3": "cured with",
"4": "",
"true string": "cured with"
},
{
"1": "peppermint-flavouring",
"2": "peppermint-flavouring",
"3": "pepper-flavouring",
"4": "",
"true string": "pepper-flavouring"
},
{
"1": "capsicum oleoresin",
"2": "capsicum oleoresin",
"3": "oleoresin capsicum",
"4": "",
"true string": "oleoresin capsicum"
},
{
"1": "brandy vinegar",
"2": "brandy vinegar",
"3": "and vinegar",
"4": "",
"true string": "and vinegar"
},
{
"1": "rye chops",
"2": "rye chops",
"3": "hops",
"4": "",
"true string": "hops"
},
{
"1": "natural oil blend",
"2": "natural oil blend",
"3": "natural lemon oil",
"4": "",
"true string": "natural lemon oil"
},
{
"1": "zinc-lactate",
"2": "zinc",
"3": "citrate",
"4": "",
"true string": "zinc-citrate"
},
{
"1": "sweet potato starch",
// "2": "sweet-potato-starches",
"3": "potatos",
"4": "",
"true string": "potato-starch"
},
{
"1": "pasteurized grade a nonfat milk",
"2": "pasteurized milk",
"3": "Pasteurized  nonfat milk",
"4": "",
"true string": "Pasteurized grade a nonfat milk"
},
{
"1": "grape-seed",
"2": "grape seed",
"3": "seeds",
"4": "",
"true string": "grape-seeds"
},
{
"1": "horseradish root",
"2": "horseradish-root",
"3": "horseradish roots pulver",
"4": "",
"true string": "horseradish roots"
},
{
"1": "carp",
"2": "carps",
"3": "chards",
"4": "",
"true string": "chard"
},
{
"1": "carottes",
"2": "carottes",
"3": "marriet",
"4": "",
"true string": "carrot"
},
{
"1": "calcium lactate pentahydrate",
"2": "calcium pentahydrate",
"3": "calcium stearoyl",
"4": "",
"true string": "calcium stearoyl lactylate"
},
{
"1": "smoked-pork-belly",
"2": "pork-bellyies",
"3": "smoked-pork",
"4": "",
"true string": "pork-belly"
},
{
"1": "invert evaporated cane syrup",
"2": "cane syrup",
"3": "invert cane syrup",
"4": "",
"true string": "evaporated cane syrup"
}
].map((inputJsonData) => InputData.fromJson(inputJsonData)).toList());