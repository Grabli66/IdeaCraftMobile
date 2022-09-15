import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_app_ideas/mobile_app_ideas.dart';

void main() async {
  await GetStorage.init();
  runApp(const MobileAppIdeas());
}
