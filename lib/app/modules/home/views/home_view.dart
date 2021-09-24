import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../../../data/model.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Traveloka'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        children: [
          DropdownSearch<ModelFlight>(
            mode: Mode.BOTTOM_SHEET,
            label: 'Pilih Bandara',
            hint: 'Bandara',
            showClearButton: true,
            showSearchBox: true,
            searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
                hintText: 'Cari Bandara',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            scrollbarProps: ScrollbarProps(
              thickness: 5,
              interactive: true,
              showTrackOnHover: true,
            ),
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            itemAsString: (ModelFlight? item) {
              if (item == null) {
                return '';
              }

              return '${item.airportName}, ${item.countryName}';
            },
            onFind: (String? filter) async {
              Uri url =
                  Uri.parse('https://api.nuryazid.com/dummy_/station.json');

              try {
                final get = await http.get(url);

                var data = json.decode(get.body) as Map<String, dynamic>;

                var listData = data['all_flight'] as List<dynamic>;

                var models = ModelFlight.fromJsonList(listData);
                return models;
              } catch (err) {
                print(err);
                return List<ModelFlight>.empty();
              }
            },
          ),
        ],
      ),
    );
  }
}
