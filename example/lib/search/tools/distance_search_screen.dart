import 'package:amap_search/amap_search.dart';
import 'package:amap_search/common/log.dart';
import 'package:amap_search/model/models.dart';
import 'package:amap_search_example/utils/misc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DistanceSearchScreen extends StatefulWidget {
  @override
  _DistanceSearchScreenState createState() => _DistanceSearchScreenState();
}

class _DistanceSearchScreenState extends State<DistanceSearchScreen> {
  LatLng src1 = beijing;
  LatLng src2 = shanghai;
  LatLng target = guangzhou;

  String text = "";

  @override
  void initState() {
    super.initState();
    AMapSearch.distanceSearch(
      [src1, src2],
      target,
      DistanceSearchType.driver,
    ).then((distanceList) {
      text = "北京到广州的距离${distanceList[0]}\n"
          "上海到广州的距离${distanceList[1]}";
      setState(() {});
    }, onError: (e) {
      if (e is PlatformException) {
        L.p("发生错误,错误原因${e.code}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('距离测量'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(text),
          ],
        ),
      ),
    );
  }
}
