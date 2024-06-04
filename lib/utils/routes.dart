import 'package:flutter/material.dart';
import '../DialogueBox/types_of_alert_dialogue_box.dart';
import '../Show_Quotes/quotes.dart';
import '../SizedBox.expand/SizedBox.dart';
import '../Toggle View/quotes.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    //todo ---> Types of Alert Dialog Box
    // '/' : (context) => const TypesOfAlertDialogueBox(),

    //todo ---> Example of SizedBox.expand
    // '/': (context) => const sizedBox(),
    //
    // todo ---> Quotes App
    // '/': (context) => const Quotes(),

    // todo ---> List to Grid And Grid to List App
    '/': (context) => const ListToGrid(),
  };
}
