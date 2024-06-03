class QuotesModel {
  String? quote;
  String? author;
  List<QuotesModel> quoteModelList = [];

  QuotesModel({this.author, this.quote});

  factory QuotesModel.fromQuote(Map data) {
    return QuotesModel(
      author: data['author'],
      quote: data['quote'],
    );
  }

  QuotesModel.toList(List q1) {
    for (int i = 0; i < q1.length; i++) {
      quoteModelList.add(QuotesModel.fromQuote(q1[i]));
    }
  }
}
