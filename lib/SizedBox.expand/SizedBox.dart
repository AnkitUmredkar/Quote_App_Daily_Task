import 'package:flutter/material.dart';

class sizedBox extends StatefulWidget {
  const sizedBox({super.key});

  @override
  State<sizedBox> createState() => _sizedBoxState();
}

class _sizedBoxState extends State<sizedBox> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          toolbarHeight: 70,
          title: const Text(
            'Example of SizedBox.Expand',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Container(
            height: 300,
            width: 300,
            decoration: const BoxDecoration(color: Colors.red),
            child: const SizedBox.expand(
              child: Center(
                child: Text(
                  'Hello Flutter',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
