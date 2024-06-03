import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quote_app_daily_task/Show_Quotes/quotesModel.dart';
import 'globle.dart';

QuotesModel? quotesModel;

class Quotes extends StatefulWidget {
  const Quotes({super.key});

  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  @override
  void initState() {
    quotesModel = QuotesModel.toList(quotesList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          toolbarHeight: 70,
          centerTitle: true,
          backgroundColor: const Color(0xff01204E),
          title: Text(
            'Quotes App',
            style: TextStyle(color: Colors.white, fontSize: width * 0.062),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: List.generate(
                quotesModel!.quoteModelList.length,
                (index) => Card(
                  color: colorList[index % colorList.length],
                  child: ListTile(
                    title: Text(
                      '"${quotesModel!.quoteModelList[index].quote!}"',
                      style: TextStyle(
                          color: (index % 2 == 0) ? Colors.black : Colors.white,
                          fontSize: width * 0.045),
                    ),
                    subtitle: Text(
                      '-- ${quotesModel!.quoteModelList[index].author!}',
                      style: TextStyle(
                          color: (index % 2 == 0) ? Colors.black : Colors.white,
                          fontStyle: FontStyle.italic,
                          fontSize: width * 0.042),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Random random = Random();
            int a = random.nextInt(quotesModel!.quoteModelList.length);
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      backgroundColor: colorList[a % colorList.length],
                      title: Text(
                        quotesModel!.quoteModelList[a].author!,
                        style: TextStyle(
                            color: (a % 2 == 0) ? Colors.black : Colors.white),
                      ),
                      content: Text(
                        '"${quotesModel!.quoteModelList[a].quote!}"',
                        style: TextStyle(
                            color: (a % 2 == 0) ? Colors.black : Colors.white),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Save',
                              style: TextStyle(
                                  color: (a % 2 == 0)
                                      ? Colors.black
                                      : Colors.white),
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Back',
                              style: TextStyle(
                                  color: (a % 2 == 0)
                                      ? Colors.black
                                      : Colors.white),
                            ))
                      ],
                    ));
          },
          child: const Icon(Icons.notification_add),
        ),
      ),
    );
  }
}
