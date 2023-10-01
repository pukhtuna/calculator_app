import 'package:get/get.dart';

class CalculatorController extends GetxController {
  final input = ''.obs;
  final result = '0'.obs;
  final calculationPerformed = false.obs;

  void onButtonPressed(String buttonText) {
    if (buttonText == 'C') {
      input.value = '';
      result.value = '0';
      calculationPerformed.value = false;
    } else if (buttonText == '=') {
      try {
        result.value = _evaluateExpression(input.value).toString();
        calculationPerformed.value = true;
      } catch (e) {
        result.value = 'Error';
      }
    } else if (buttonText == '⌫') {
      removeLastDigit();
    } else {
      if (calculationPerformed.value) {
        input.value = '';
        result.value = '0';
        calculationPerformed.value = false;
      }
      input.value += buttonText;
    }
  }

  void removeLastDigit() {
    if (input.value.isNotEmpty) {
      input.value = input.value.substring(0, input.value.length - 1);
    }
  }

  double _evaluateExpression(String expression) {
    try {
      return _evaluate(expression);
    } catch (e) {
      throw Exception('Invalid expression');
    }
  }

  double _evaluate(String expression) {
    expression = expression.replaceAll(' ', ''); // Remove spaces
    final exp = RegExp(r'(\d+\.\d+|\d+|[-+x/%])');
    final tokens = exp.allMatches(expression).map((e) => e.group(0)).toList();

    final stack = <String>[];
    final output = <String>[];

    final precedence = {
      '+': 1,
      '-': 1,
      'x': 2,
      '/': 2,
      '%': 3,
    };

    for (final token in tokens) {
      if (double.tryParse(token!) != null) {
        output.add(token);
      } else if (token == '(') {
        stack.add(token);
      } else if (token == ')') {
        while (stack.isNotEmpty && stack.last != '(') {
          output.add(stack.removeLast());
        }
        stack.removeLast(); // Remove the '('
      } else {
        while (
            stack.isNotEmpty && precedence[stack.last]! >= precedence[token]!) {
          output.add(stack.removeLast());
        }
        stack.add(token);
      }
    }

    while (stack.isNotEmpty) {
      output.add(stack.removeLast());
    }

    final values = <double>[];

    for (final token in output) {
      if (double.tryParse(token) != null) {
        values.add(double.parse(token));
      } else if (precedence.containsKey(token)) {
        if (values.length < 2) {
          throw Exception('Invalid expression');
        }
        final b = values.removeLast();
        final a = values.removeLast();
        switch (token) {
          case '+':
            values.add(a + b);
            break;
          case '-':
            values.add(a - b);
            break;
          case 'x':
            values.add(a * b);
            break;
          case '/':
            values.add(a / b);
            break;
          case '%':
            values.add(a % b);
            break;
        }
      }
    }

    if (values.length != 1) {
      throw Exception('Invalid expression');
    }

    return values[0];
  }
}
