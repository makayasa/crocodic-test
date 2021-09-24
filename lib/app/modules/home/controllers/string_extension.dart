import 'package:crocodic_test/app/modules/home/controllers/string_extension.dart';
import 'package:flutter/material.dart';


extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach => replaceAll(RegExp(' +'), ' ').split(" ").map((str) => str.inCaps).join(" ");
}
