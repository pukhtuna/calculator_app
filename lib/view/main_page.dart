import 'package:calculator_app/controller/calculator_controller.dart';
import 'package:calculator_app/util/app_theme.dart';
import 'package:calculator_app/util/shared_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final calculatorController = Get.find<CalculatorController>();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(
            text: 'Calculator',
            fontSize: 22,
            letterSpacing: 1.5,
            color: Colors.white),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  Get.isDarkMode
                      ? box.write('theme', 'dark')
                      : box.write('theme', 'light');
                  box.read('theme') == 'dark'
                      ? Get.changeTheme(AppTheme.lightTheme)
                      : Get.changeTheme(AppTheme.darkTheme);
                });
              },
              icon: Icon(Get.isDarkMode ? Icons.light_mode : Icons.dark_mode)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Obx(() => Container(
                  alignment: Alignment.centerRight,
                  child: CustomText(
                    text: calculatorController.input.value,
                    fontSize: 30,
                  ),
                )),
            const SizedBox(height: 10),
            Obx(() => Container(
                  alignment: Alignment.centerRight,
                  child: SelectableText(
                    calculatorController.result.value,
                    style: GoogleFonts.aBeeZee(
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )),
            const Spacer(),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _buttonTexts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final buttonText = _buttonTexts[index];
                if (index == 18) {
                  return Container();
                }
                return ElevatedButton(
                  onPressed: () {
                    calculatorController.onButtonPressed(buttonText);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(23)))),
                  child: Center(
                    child: CustomText(
                        text: buttonText,
                        fontSize: 30,
                        textAlign: TextAlign.center,
                        color: Theme.of(context).colorScheme.background),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  final List<String> _buttonTexts = [
    'C',
    '%',
    '+',
    '⌫',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '',
    '='
  ];
}
