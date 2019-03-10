import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


import 'package:flutterlogin/models/models.dart';

class ChangeQuoteAction {
  String author;
  String authorQuote;
  ChangeQuoteAction({this.author, this.authorQuote});
}

ThunkAction<AppState> changeQuoteThunkAction = (Store<AppState> store) async{
  var response = await http.get(
      'http://quotesondesign.com/wp-json/posts?filter[orderby]=rand&filter[posts_per_page]=1');

  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    String _quote = jsonResponse[0]['content']
        .replaceAll(new RegExp('[(<p>)(</p>)]'), '')
        .replaceAll(new RegExp('&#8217;'), '\'');
    String _author = jsonResponse[0]['title'];
    store.dispatch(ChangeQuoteAction(author: _author, authorQuote: _quote));
  }

};