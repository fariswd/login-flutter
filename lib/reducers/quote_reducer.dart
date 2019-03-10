import 'package:redux/redux.dart';

import 'package:flutterlogin/models/quote_model.dart';
import 'package:flutterlogin/actions/quote_action.dart';

Reducer<Quote> quoteReducer =combineReducers([
  TypedReducer<Quote, ChangeQuoteAction>(changeQuoteReducer),
]);

Quote changeQuoteReducer(Quote quotes, ChangeQuoteAction action){
  return quotes.copyWith(
    author: action.author,
    authorQuote: action.authorQuote,
  );
}