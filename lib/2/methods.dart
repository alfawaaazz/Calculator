class Methods {
  String result;
  String parenthesis;
  bool toggle;

  Methods({this.result, this.parenthesis, this.toggle});

  buttonPress(String buttonString) {
    print(buttonString);

    if (buttonString == "C") {
      result = "0";
    } else if (buttonString == "<-") {
      result = result.substring(0, result.length - 1);
      toggleFunction();
      if (result == "") {
        result = "0";
      }
    } else {
      if (buttonString == "()") {
        if (toggle == null) {
          toggle = false;
        } else if (toggle != null) {
          if (toggle == false) {
            parenthesis = "(";
            buttonString = parenthesis;
            toggle = true;
          } else {
            parenthesis = ")";
            buttonString = parenthesis;
            toggle = false;
          }
        }
        if (result == "0") {
          result = buttonString;
        } else {
          result = result + buttonString;
        }
      } else if (result == "0") {
        result = buttonString;
      } else {
        result = "$result$buttonString";
      }
    }
  }

  toggleFunction() {}
}
