import 'package:amap_search/amap_search.dart';
import 'package:amap_search_example/utils/misc.dart';
import 'package:amap_search_example/utils/view.dart';
import 'package:amap_search_example/widgets/button.widget.dart';
import 'package:amap_search_example/widgets/dimens.dart';
import 'package:flutter/material.dart';

class SearchBusStationScreen extends StatefulWidget {
  SearchBusStationScreen();

  factory SearchBusStationScreen.forDesignTime() => SearchBusStationScreen();

  @override
  _SearchBusStationScreenState createState() => _SearchBusStationScreenState();
}

class _SearchBusStationScreenState extends State<SearchBusStationScreen> {
  String _result = '';

  TextEditingController _busLineController = TextEditingController(text: '湖海塘');
  TextEditingController _cityController = TextEditingController(text: '金华');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('获取公交数据')),
      backgroundColor: Theme.of(context).primaryColor,
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(hintText: '输入路线名称', border: OutlineInputBorder()),
                style: TextStyle(color: Colors.white),
                controller: _busLineController,
                validator: (dynamic value) {
                  if (value.isEmpty) {
                    return '输入路线名称';
                  }
                  return null;
                },
              ),
              SPACE_NORMAL,
              TextFormField(
                decoration: const InputDecoration(hintText: '输入所在城市', border: OutlineInputBorder()),
                style: const TextStyle(color: Colors.white),
                controller: _cityController,
                validator: (dynamic value) {
                  if (value.isEmpty) {
                    return '输入所在城市';
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
                    AMapSearch.searchBusStation(
                      _busLineController.text,
                      _cityController.text,
                    ),
                  ).then((result) {
                    setState(() => _result = result.toString());
                  }).catchError((e) {
                    showError(context, e.toString());
                  });
                },
              ),
              SPACE_NORMAL,
              Flexible(
                child: ListView(
                  padding: const EdgeInsets.all(8.0),
                  shrinkWrap: true,
                  children: <Widget>[Text(_result, style: const TextStyle(color: Colors.white))],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _busLineController.dispose();
    _cityController.dispose();
    super.dispose();
  }
}
