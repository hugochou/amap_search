import 'package:amap_search/amap_search.dart';
import 'package:amap_search_example/search/search.screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AMapSearch.updatePrivacyShow(true, true);
  AMapSearch.updatePrivacyAgree(true);
  await AMapSearch.setApiKey('androidKey', 'iosKey');
  runApp(MaterialApp(
    home: SearchDemo(),
    theme: ThemeData(primaryColor: const Color(0xff292c36)),
  ));
}
