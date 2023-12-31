import 'package:amap_search/amap_search.dart';
import 'package:amap_search/model/models.dart';
import 'package:amap_search_example/utils/misc.dart';
import 'package:amap_search_example/utils/view.dart';
import 'package:amap_search_example/widgets/button.widget.dart';
import 'package:amap_search_example/widgets/dimens.dart';
import 'package:flutter/material.dart';

class DrivingRoutPlanScreen extends StatefulWidget {
  DrivingRoutPlanScreen();

  factory DrivingRoutPlanScreen.forDesignTime() => DrivingRoutPlanScreen();

  @override
  DrivingRoutPlanScreenState createState() => DrivingRoutPlanScreenState();
}

class DrivingRoutPlanScreenState extends State<DrivingRoutPlanScreen> {
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('驾车出行路线规划'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text('起点: 39.993291, 116.473188', style: TextStyle(color: Colors.white)),
            const Text('终点: 39.940474, 116.355426', style: TextStyle(color: Colors.white)),
            SPACE_NORMAL,
            Button(
              label: '开始规划',
              onPressed: (context) {
                loading<DriveRouteResult?>(
                  context,
                  AMapSearch.calculateDriveRoute(
                    RoutePlanParam(
                      from: const LatLng(39.993291, 116.473188),
                      to: const LatLng(39.940474, 116.355426),
                    ),
                  ),
                ).then((result) {
                  setState(() {
                    _result = result.toString();
                  });
                }).catchError((e) {
                  showError(context, e.toString());
                });
              },
            ),
            SPACE_NORMAL,
            Flexible(
              child: SingleChildScrollView(
                child: Text(
                  _result,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
