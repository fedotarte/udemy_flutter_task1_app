import 'package:flutter/material.dart';

class TextApp extends StatelessWidget {
  final String enteredKey;
  final int counter;
  final Map<String, String> textMap = {
    "initial":"Hi, Bro!",
    "reflection":"You pressed the button!"
  };
  TextApp(
      this.counter,
      this.enteredKey);

  bool _isCounterMoreThanOne(counter){
    return counter>1;
  }

  bool _isEnteredKeyCorrect(enteredKey){
    return textMap.containsKey(enteredKey);
  }

  String get renderedPhraze {
    var resultText = "You did it!";
    if (_isCounterMoreThanOne(counter)&&_isEnteredKeyCorrect(enteredKey)) {
      resultText = "You pressed button again!";
    }
    else if (_isEnteredKeyCorrect(enteredKey)) {
      resultText = textMap[enteredKey];
    }
    else {
      resultText = "I think you invoked me with the wrong params...";
    }
    return resultText;
  }



  @override
  Widget build(BuildContext context) {
    return Text(
      renderedPhraze,
        style: Theme.of(context).textTheme.display1
    );
  }
}
