import 'package:amap_search/amap_search.dart';
import 'package:amap_search/model/models.dart';
import 'package:amap_search_example/utils/misc.dart';
import 'package:amap_search_example/utils/view.dart';
import 'package:amap_search_example/widgets/button.widget.dart';
import 'package:amap_search_example/widgets/dimens.dart';
import 'package:flutter/material.dart';

class PolygonPoiSearchScreen extends StatefulWidget {
  PolygonPoiSearchScreen();

  factory PolygonPoiSearchScreen.forDesignTime() => PolygonPoiSearchScreen();

  @override
  _PolygonPoiSearchScreenState createState() => _PolygonPoiSearchScreenState();
}

class _PolygonPoiSearchScreenState extends State<PolygonPoiSearchScreen> {
  String _result = '';

  TextEditingController _keywordController = TextEditingController(text: '厕所');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('多边形内检索的POI'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            const Text(
              '多边形区域:\nLatLng(39.941711, 116.382248),\nLatLng(39.884882, 116.359566),\nLatLng(39.878120, 116.437630),\nLatLng(39.941711, 116.382248)',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            SPACE_NORMAL,
            TextFormField(
              decoration: const InputDecoration(hintText: '输入关键字', border: OutlineInputBorder()),
              controller: _keywordController,
              style: const TextStyle(color: Colors.white),
              validator: (dynamic value) {
                if (value.isEmpty) {
                  return '请输入关键字';
                }
                return null;
              },
            ),
            SPACE_NORMAL,
            Button(
              label: '开始搜索',
              onPressed: (context) async {
                if (!Form.of(context).validate()) {
                  return;
                }

                loading(
                  context,
                  AMapSearch.searchPoiPolygon(
                    PoiSearchQuery(
                      query: _keywordController.text,
                      searchBound: SearchBound(
                        polyGonList: [
                          const LatLng(39.941711, 116.382248),
                          const LatLng(39.884882, 116.359566),
                          const LatLng(39.878120, 116.437630),
                          const LatLng(39.941711, 116.382248),
                        ],
                      ),
                    ),
                  ),
                ).then((poiResult) {
                  setState(() {
                    _result = jsonFormat(poiResult.toJson());
                  });
                }).catchError((e) {
                  showError(context, e.toString());
                });
              },
            ),
            SPACE_NORMAL,
            Text(_result, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _keywordController.dispose();
    super.dispose();
  }
}
