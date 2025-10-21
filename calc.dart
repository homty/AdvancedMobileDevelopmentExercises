import 'dart:io';
void main(){
  var numbersAndOperation = <String>[];
  print("Hello, welcome to calculator!");
      for(int i = 0; i <= 2; i++){
        if (i < 2){
          print('Provide value #${i + 1}: ');
          String? number = stdin.readLineSync();
          numbersAndOperation.add(number ?? '');
        } else if (i == 2) {
          print('Provide an operator (+, -, *, /): ');
          String? operators = stdin.readLineSync();
          numbersAndOperation.add(operators ?? '');
        }
      }
      var myCalc = Calculation.fromList(numbersAndOperation); 
      myCalc.Calculate();
//      print(numbersAndOperation); 
}

class Calculation {
    double num1;
    double num2;
    String operators;

    Calculation(this.num1, this.num2, this.operators){
      print("\x1B[2J\x1B[0;0H");
      print("Calculating...");
    }

    Calculation.fromList(List<String> list):this(
      double.tryParse(list[0]) ?? 0.0,
      double.tryParse(list[1]) ?? 0.0,
      list[2]
    );

    void Calculate() {
      print("\x1B[2J\x1B[0;0H");
      double res = 0.0;
      switch (operators) {
        case '+':
          res = num1 + num2;
          break;
        case '-':
          res = num1 - num2;
          break;
        case '*':
          res = num1 * num2;
          break;
        case '/':
          if (num2 == 0) {
            print("You can't divide by 0");
            return;
          }
          res = num1 / num2;
          break;
        default:
          print("Undefined operator: $operators");
          return;
      }
      return print("Your math equation: $num1 $operators $num2 = $res");
    } 
}