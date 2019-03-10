import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as convert;
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutterlogin/models/models.dart';
import 'package:flutterlogin/models/quote_model.dart';
import 'package:flutterlogin/actions/quote_action.dart';


class QuoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) => _ViewModel.create(store),
      builder: (BuildContext context, _ViewModel model) => Scaffold(
            appBar: AppBar(
              title: Text('Quote'),
            ),
            body: Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    model.quotes.author ?? '',
                    style: TextStyle(fontSize: 25.0),
                  ),
                  Text(
                    model.quotes.authorQuote ?? '',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  RaisedButton(
                    onPressed: () {
                      // _fetchApi();
                      model.onChangeQuote();
                    },
                    child: Text('New Quote!'),
                  )
                ],
              ),
            ),
          ),
    );
  }
}

class _ViewModel {
  Quote quotes;
  Function() onChangeQuote;

  _ViewModel({this.quotes, this.onChangeQuote});

  factory _ViewModel.create(Store<AppState> store) {

    _onChangeQuote(){
      store.dispatch(changeQuoteThunkAction);
    }

    return _ViewModel(
      quotes: store.state.quotes,
      onChangeQuote: _onChangeQuote,
    );
  }
}
