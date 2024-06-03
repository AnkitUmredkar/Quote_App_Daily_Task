import 'package:flutter/material.dart';
import '../DialogueBox/types_of_alert_dialogue_box.dart';
import '../Show_Quotes/quotes.dart';
import '../SizedBox.expand/SizedBox.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    //todo ---> Types of Alert Dialog Box
    // '/' : (context) => const TypesOfAlertDialogueBox(),

    //todo ---> Example of SizedBox.expand
    // '/': (context) => const sizedBox(),
    //
    // todo ---> Quotes App
    '/': (context) => const Quotes(),
  };
}
