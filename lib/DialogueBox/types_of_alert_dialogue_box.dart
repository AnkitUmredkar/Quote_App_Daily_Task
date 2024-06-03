import 'package:flutter/material.dart';

class TypesOfAlertDialogueBox extends StatefulWidget {
  const TypesOfAlertDialogueBox({super.key});

  @override
  State<TypesOfAlertDialogueBox> createState() =>
      _TypesOfAlertDialogueBoxState();
}

class _TypesOfAlertDialogueBoxState extends State<TypesOfAlertDialogueBox> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text(
            'All Type of Alert DialogueBox',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton.tonal(
                onPressed: () => _onCustomAlert(context),
                child: const Text('Simple Alert'),
              ),
              const SizedBox(height: 10),
              FilledButton.tonal(
                onPressed: () => _onConformationalAlert(context),
                child: const Text('Alert With Conformation'),
              ),
              const SizedBox(height: 10),
              FilledButton.tonal(
                onPressed: () => _onFullScreenAlert(context),
                child: const Text('Full-Screen Alert'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onCustomAlert(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            title: const Text('Simple Dialogue Title'),
            content: const Text('This is Custom Dialogue Box'),
          );
        });
  }

  _onConformationalAlert(context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            title: const Text(
              'Conformational Dialogue Box',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            content: const Text(
              'Do you really want to delete',
              style: TextStyle(fontSize: 18),
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Yes',
                    style: TextStyle(fontSize: 18),
                  )),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'No',
                    style: TextStyle(fontSize: 18),
                  )),
            ],
          );
        });
  }

  _onFullScreenAlert(context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog.fullscreen(
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.close,
                            size: 35,
                          )),
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Full Screen Dialog',
                        style: TextStyle(fontSize: 28),
                      ),
                    ),
                  ],
                ),
              ));
        });
  }
}
