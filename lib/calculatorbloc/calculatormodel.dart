class CalculatorModel {
  CalculatorModel({
    this.parenthesis = "",
    this.expression = "",
    this.toggle = false,
    this.answer = "",
    this.result = "",
    this.isFinished = false,
  });
  final String result;
  final String parenthesis;
  final String expression;
  final bool toggle;
  final bool isFinished;
  final String answer;

  CalculatorModel copyWith({
    String result,
    String parenthesis,
    String expression,
    bool toggle,
    bool isFinished,
    String answer,
  }) {
    return CalculatorModel(
      result: result ?? this.result,
      parenthesis: parenthesis ?? this.parenthesis,
      expression: expression ?? this.expression,
      toggle: toggle ?? this.toggle,
      isFinished: isFinished ?? this.isFinished,
      answer: answer ?? this.answer,
    );
  }
}
