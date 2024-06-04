import 'dart:math';
import 'package:flutter/material.dart';
import '../Toggle View/globle.dart';
import '../Toggle View/quotesModel.dart';

QuotesModel? quotesModel;

class ListToGrid extends StatefulWidget {
  const ListToGrid({super.key});

  @override
  State<ListToGrid> createState() => _ListToGridState();
}

class _ListToGridState extends State<ListToGrid> {
  @override
  void initState() {
    quotesModel = QuotesModel.toList(quotesList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          toolbarHeight: 65,
          centerTitle: true,
          backgroundColor: const Color(0xff01204E),
          title: Text(
            'Listview to Gridview',
            style: TextStyle(color: Colors.white, fontSize: width * 0.062),
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 8),
                    child: Text(
                      'Change View',
                      style: TextStyle(fontSize: width * 0.046),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.6,
                    child: SegmentedButton(
                      multiSelectionEnabled: false,
                      segments: [
                        ButtonSegment<String>(
                            value: 'ListView',
                            label: Text(
                              'ListView',
                              style: TextStyle(fontSize: width * 0.035),
                            ),
                            icon: const Icon(Icons.list_alt)),
                        ButtonSegment<String>(
                          value: 'GridView',
                          label: Text('GridView',
                              style: TextStyle(fontSize: width * 0.035)),
                          icon: const Icon(Icons.apps_rounded),
                        ),
                      ],
                      selected: selected,
                      onSelectionChanged: (Set<String> newSelected) {
                        setState(() {
                          selected = newSelected;
                          listToGrid = !listToGrid;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            (listToGrid)
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(8, 68, 8, 8),
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: quotesModel!.quoteModelList.length,
                      itemBuilder: (context, int index) => Card(
                        color: colorList[index % colorList.length],
                        child: ListTile(
                          title: Text(
                            '"${quotesModel!.quoteModelList[index].quote!}"',
                            style: TextStyle(
                                color: (index % 2 == 0)
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: width * 0.045),
                          ),
                          subtitle: Text(
                            '-- ${quotesModel!.quoteModelList[index].author!}',
                            style: TextStyle(
                                color: (index % 2 == 0)
                                    ? Colors.black
                                    : Colors.white,
                                fontStyle: FontStyle.italic,
                                fontSize: width * 0.042),
                          ),
                        ),
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 9 / 16,
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.fromLTRB(8, 68, 8, 8),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: quotesModel!.quoteModelList.length,
                      itemBuilder: (context, int index) => Card(
                        color: colorList[index % colorList.length],
                        child: ListTile(
                          title: Text(
                            '"${quotesModel!.quoteModelList[index].quote!}"',
                            style: TextStyle(
                                color: (index % 2 == 0)
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: width * 0.045),
                          ),
                          subtitle: Text(
                            '-- ${quotesModel!.quoteModelList[index].author!}',
                            style: TextStyle(
                                color: (index % 2 == 0)
                                    ? Colors.black
                                    : Colors.white,
                                fontStyle: FontStyle.italic,
                                fontSize: width * 0.042),
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
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

Set<String> selected = {'ListView'};
