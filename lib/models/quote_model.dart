class Quote {
  final String author;
  final String authorQuote;

  Quote({this.author = '', this.authorQuote = ''});

  Quote copyWith({String author, String authorQuote}) {
    return Quote(
      author: author ?? this.author,
      authorQuote: authorQuote ?? this.authorQuote,
    );
  }

  Map toJson() => {
    'author': author,
    'authorQuote': authorQuote,
  };

  static Quote fromJson(json) {
    return Quote(
      author: json['author'],
      authorQuote: json['authorQuote'],
    );
  }

  @override
  String toString() {
    return toJson().toString();
  }
  
}