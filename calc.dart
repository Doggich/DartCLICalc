import 'dart:math' as math;

// Base math operations
double add(double a, double b) => a + b;
double sub(double a, double b) => a - b;
double div(double a, double b) => a / b;
double mul(double a, double b) => a * b;

// Advanced math operations
double pow_(double base, int exponent) {
  double result = 1;
  for (int i = 0; i < exponent; i++) {
    result *= base;
  }
  return result;
}

double cosine(double x) {
  double radians = x * math.pi / 180;
  double sum = 0;
  double term = 1;
  int n = 0;
  int sign = 1;

  while (term.abs() > 1e-6) {
    sum += sign * term;
    n += 2;
    term *= radians * radians / (n * (n - 1));
    sign *= -1;
  }
  return sum;
}

double sine(double x) {
  double radians = x * math.pi / 180;
  double sum = 0;
  double term = radians;
  int k = 0;

  while (term.abs() > 1e-6) {
    sum += term;
    k++;
    term *= -radians * radians / ((2 * k) * (2 * k + 1));
  }
  return sum;
}

double tangence(double x) {
  return sine(x) / cosine(x);
}

double cotangence(double x) {
  return cosine(x) / sine(x);
}

void main(List<String> args) {
  if (args.isEmpty) {
    print(
      'Usage: dart \x1B[1;4mscript.dart\x1B[0m <\x1B[3m\x1B[38;2;125;60;152mcommand\x1B[0m> [\x1B[38;2;26;188;156marguments\x1B[0m]',
    );
    print('Available commands:');
    print('┌──────────────────────────────────────────────────────┐');
    print(
      '│ \x1B[3m\x1B[38;2;125;60;152madd\x1B[0m <\x1B[38;2;245;176;65ma\x1B[0m> <\x1B[38;2;230;126;34mb\x1B[0m>      │ \x1B[1;3mAdd two numbers\x1B[0m                   │',
    );
    print(
      '│ \x1B[3m\x1B[38;2;125;60;152msub\x1B[0m <\x1B[38;2;245;176;65ma\x1B[0m> <\x1B[38;2;230;126;34mb\x1B[0m>      │ \x1B[1;3mSubtract b from a\x1B[0m                 │',
    );
    print(
      '│ \x1B[3m\x1B[38;2;125;60;152mmul\x1B[0m <\x1B[38;2;245;176;65ma\x1B[0m> <\x1B[38;2;230;126;34mb\x1B[0m>      │  \x1B[1;3mMultiply two numbers\x1B[0m             │',
    );
    print(
      '│ \x1B[3m\x1B[38;2;125;60;152mdiv\x1B[0m <\x1B[38;2;245;176;65ma\x1B[0m> <\x1B[38;2;230;126;34mb\x1B[0m>      │  \x1B[1;3mDivide a by b\x1B[0m                    │',
    );
    print(
      '│ \x1B[3m\x1B[38;2;125;60;152mpow\x1B[0m <\x1B[38;2;26;188;156mbase\x1B[0m> <\x1B[38;2;88;214;141mexp\x1B[0m> │ \x1B[1;3mRaise base to integer exponent\x1B[0m    │',
    );
    print(
      '│ \x1B[3m\x1B[38;2;125;60;152msin\x1B[0m <\x1B[38;2;84;153;199mdegrees\x1B[0m>    │ \x1B[1;3mCalculate sine of angle\x1B[0m           │',
    );
    print(
      '│ \x1B[3m\x1B[38;2;125;60;152mcos\x1B[0m <\x1B[38;2;84;153;199mdegrees\x1B[0m>    │ \x1B[1;3mCalculate cosine of angle\x1B[0m         │',
    );
    print(
      '│ \x1B[3m\x1B[38;2;125;60;152mtg\x1B[0m <\x1B[38;2;84;153;199mdegrees\x1B[0m>     │ \x1B[1;3mCalculate tangence of angle\x1B[0m       │',
    );
    print(
      '│ \x1B[3m\x1B[38;2;125;60;152mctg\x1B[0m <\x1B[38;2;84;153;199mdegrees\x1B[0m>    │ \x1B[1;3mCalculate cotangence of angle\x1B[0m     │',
    );
    print(
      '│ \x1B[3m\x1B[38;2;125;60;152msqrt\x1B[0m <\x1B[38;2;245;176;65ma\x1B[0m>         │ \x1B[1;3mCalculate root of number\x1B[0m          │',
    );
    print('└──────────────────────────────────────────────────────┘');
    return;
  }

  final command = args[0].toLowerCase();

  try {
    switch (command) {
      case 'add':
        _validateArgumentsCount(args, 3);
        print(add(double.parse(args[1]), double.parse(args[2])));
        break;

      case 'sub':
        _validateArgumentsCount(args, 3);
        print(sub(double.parse(args[1]), double.parse(args[2])));
        break;

      case 'mul':
        _validateArgumentsCount(args, 3);
        print(mul(double.parse(args[1]), double.parse(args[2])));
        break;

      case 'div':
        _validateArgumentsCount(args, 3);
        print(div(double.parse(args[1]), double.parse(args[2])));
        break;

      case 'pow':
        _validateArgumentsCount(args, 3);
        print(pow_(double.parse(args[1]), int.parse(args[2])));
        break;

      case 'sin':
        _validateArgumentsCount(args, 2);
        print(sine(double.parse(args[1])));
        break;

      case 'cos':
        _validateArgumentsCount(args, 2);
        print(cosine(double.parse(args[1])));
        break;

      case 'tg':
        _validateArgumentsCount(args, 2);
        print(tangence(double.parse(args[1])));
        break;

      case 'ctg':
        _validateArgumentsCount(args, 2);
        print(cotangence(double.parse(args[1])));
        break;

      case 'sqrt':
        _validateArgumentsCount(args, 2);
        print(math.sqrt(double.parse(args[1])));
        break;

      default:
        throw ArgumentError('Unknown command: $command');
    }
  } on FormatException {
    print('Error: Invalid number format');
  } on ArgumentError catch (e) {
    print('Error: ${e.message}');
  } catch (e) {
    print('Error: $e');
  }
}

void _validateArgumentsCount(List<String> args, int expected) {
  if (args.length < expected) {
    throw ArgumentError(
      'Not enough arguments for ${args[0]} command. '
      'Expected ${expected - 1}, got ${args.length - 1}',
    );
  }
}
