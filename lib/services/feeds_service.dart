import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:kmt/models/feeds-post-model.dart';

Future<dynamic> _loadFeedsAsset() async {
  return await rootBundle.loadString('assets/feeds-post.json');
}
Future fetchAllFeeds() async {
  String jsonFeeds= await _loadFeedsAsset();
  final jsonResponse = json.decode(jsonFeeds);
  FeedsList feedsList = FeedsList.fromJson(jsonResponse);
   var records = feedsList.allfeeds.toList();
  return records;

}

Future getByID(int feedId) async {
  List<Feeds> postcomments = await fetchAllFeeds();
  for (var i = 0; i < postcomments.length; i++) {
    if (postcomments[i].id == feedId) {
      return postcomments[i];
    }
  }
  return null;
}
