import 'dart:convert';
import 'dart:io';

import 'wiki_launch.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) async {
  while (true) {
    http.Response response = await http.get(
        Uri.parse("https://en.wikipedia.org/api/rest_v1/page/random/summary"));
    final data = jsonDecode(response.body);
    print(data["title"]);
    print("do you want to see this page ? yes / no");
    String? answer = stdin.readLineSync();
    if (answer == "yes") {
      LaunchUrl.launchUrl(data["content_urls"]["desktop"]["page"]);
      print("press Ctr + c to quit");
    } else if (answer == "no") {
      print("press Ctr + c to quit");
    } else {
      print("choose yes or no");
    }
  }
}
