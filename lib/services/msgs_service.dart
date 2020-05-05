import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:kmt/models/msgs-model.dart';

Future<dynamic> _loadMessageAsset() async {
  return await rootBundle.loadString('assets/kmt-msgs.json');
}

Future fetchMesages() async {
  String jsonMsgs = await _loadMessageAsset();
  final jsonResponse = json.decode(jsonMsgs);
  MessagesList messagesList = MessagesList.fromJson(jsonResponse);
  var records = messagesList.messages.toList();

  return records;
}
