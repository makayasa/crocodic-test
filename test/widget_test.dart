import 'package:http/http.dart' as http;
import 'package:collection/collection.dart';
import 'dart:convert';


void main() async {
  Uri url = Uri.parse('https://api.nuryazid.com/dummy_/station.json');

  final get = await http.get(url);

  var data = json.decode(get.body) as Map<String, dynamic>;

  var listData = data['all_flight'] as List<dynamic>;

  Map<String, List<dynamic>> abc = groupBy(listData, (group) => group['country_name']);

  var aaa = json.encode(abc);

  var bbb = json.decode(aaa) as Map<String, dynamic>;


  // var listData = data['all_flight'] as List<Map<String, dynamic>>;

  print(bbb);
}