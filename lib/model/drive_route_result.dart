import 'dart:convert';

import 'package:amap_search/model/models.dart';

class DriveRouteResult {
  List<DrivePath>? paths;
  LatLng? startPos;
  LatLng? targetPos;
  num? taxiCost;

  DriveRouteResult({
    this.paths,
    this.startPos,
    this.targetPos,
    this.taxiCost,
  });

  DriveRouteResult.fromJson(Map<String, dynamic> json) {
    if (json['paths'] != null) {
      paths = <DrivePath>[];
      json['paths'].forEach((v) {
        paths!.add(DrivePath.fromJson(v as Map<String, dynamic>));
      });
    }
    startPos = json['startPos'] != null ? LatLng.fromJson(json['startPos']) : null;
    targetPos = json['targetPos'] != null ? LatLng.fromJson(json['targetPos']) : null;
    taxiCost = json['taxiCost'] as num;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (paths != null) {
      data['paths'] = paths!.map((v) => v.toJson()).toList();
    }
    if (startPos != null) {
      data['startPos'] = startPos!.toJson();
    }
    if (targetPos != null) {
      data['targetPos'] = targetPos!.toJson();
    }
    data['taxiCost'] = taxiCost;
    return data;
  }

  DriveRouteResult copyWith({
    List<DrivePath>? paths,
    LatLng? startPos,
    LatLng? targetPos,
    num? taxiCost,
  }) {
    return DriveRouteResult(
      paths: paths ?? this.paths,
      startPos: startPos ?? this.startPos,
      targetPos: targetPos ?? this.targetPos,
      taxiCost: taxiCost ?? this.taxiCost,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DriveRouteResult &&
          runtimeType == other.runtimeType &&
          paths == other.paths &&
          startPos == other.startPos &&
          targetPos == other.targetPos &&
          taxiCost == other.taxiCost;

  @override
  int get hashCode => paths.hashCode ^ startPos.hashCode ^ targetPos.hashCode ^ taxiCost.hashCode;

  @override
  String toString() {
    return const JsonEncoder.withIndent('  ').convert(toJson());
  }
}

class DrivePath {
  num? restriction;
  List<Steps>? steps;
  String? strategy;
  num? tollDistance;
  num? tolls;
  num? totalTrafficlights;

  DrivePath({
    this.restriction,
    this.steps,
    this.strategy,
    this.tollDistance,
    this.tolls,
    this.totalTrafficlights,
  });

  DrivePath.fromJson(Map<String, dynamic> json) {
    restriction = json['restriction'] as num;
    if (json['steps'] != null) {
      steps = <Steps>[];
      json['steps'].forEach((v) {
        steps!.add(Steps.fromJson(v as Map<String, dynamic>));
      });
    }
    strategy = json['strategy'] as String;
    tollDistance = json['tollDistance'] as num;
    tolls = json['tolls'] as num;
    totalTrafficlights = json['totalTrafficlights'] as num;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['restriction'] = restriction;
    if (steps != null) {
      data['steps'] = steps!.map((v) => v.toJson()).toList();
    }
    data['strategy'] = strategy;
    data['tollDistance'] = tollDistance;
    data['tolls'] = tolls;
    data['totalTrafficlights'] = totalTrafficlights;
    return data;
  }

  DrivePath copyWith({
    int? restriction,
    List<Steps>? steps,
    String? strategy,
    num? tollDistance,
    num? tolls,
    int? totalTrafficlights,
  }) {
    return DrivePath(
      restriction: restriction ?? this.restriction,
      steps: steps ?? this.steps,
      strategy: strategy ?? this.strategy,
      tollDistance: tollDistance ?? this.tollDistance,
      tolls: tolls ?? this.tolls,
      totalTrafficlights: totalTrafficlights ?? this.totalTrafficlights,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DrivePath &&
          runtimeType == other.runtimeType &&
          restriction == other.restriction &&
          steps == other.steps &&
          strategy == other.strategy &&
          tollDistance == other.tollDistance &&
          tolls == other.tolls &&
          totalTrafficlights == other.totalTrafficlights;

  @override
  int get hashCode =>
      restriction.hashCode ^
      steps.hashCode ^
      strategy.hashCode ^
      tollDistance.hashCode ^
      tolls.hashCode ^
      totalTrafficlights.hashCode;

  @override
  String toString() {
    return '''Paths{
		restriction: $restriction,
		steps: $steps,
		strategy: $strategy,
		tollDistance: $tollDistance,
		tolls: $tolls,
		totalTrafficlights: $totalTrafficlights}''';
  }
}

class Steps {
  List<TMC>? TMCs;
  String? action;
  String? assistantAction;
  num? distance;
  num? duration;
  String? instruction;
  String? orientation;
  List<LatLng>? polyline;
  String? road;
  List<RouteSearchCityList>? routeSearchCityList;
  num? tollDistance;
  String? tollRoad;
  num? tolls;

  Steps({
    this.TMCs,
    this.action,
    this.assistantAction,
    this.distance,
    this.duration,
    this.instruction,
    this.orientation,
    this.polyline,
    this.road,
    this.routeSearchCityList,
    this.tollDistance,
    this.tollRoad,
    this.tolls,
  });

  Steps.fromJson(Map<String, dynamic> json) {
    if (json['TMCs'] != null) {
      TMCs = <TMC>[];
      json['TMCs'].forEach((v) {
        TMCs!.add(TMC.fromJson(v as Map<String, dynamic>));
      });
    }
    action = json['action'] as String;
    assistantAction = json['assistantAction'] as String;
    distance = json['distance'] as num;
    duration = json['duration'] as num;
    instruction = json['instruction'] as String;
    orientation = json['orientation'] as String;
    if (json['polyline'] != null) {
      polyline = <LatLng>[];
      json['polyline'].forEach((v) {
        polyline!.add(LatLng.fromJson(v as Map<String, dynamic>));
      });
    }
    road = json['road'] as String;
    if (json['routeSearchCityList'] != null) {
      routeSearchCityList = <RouteSearchCityList>[];
      json['routeSearchCityList'].forEach((v) {
        routeSearchCityList!.add(RouteSearchCityList.fromJson(v as Map<String, dynamic>));
      });
    }
    tollDistance = json['tollDistance'] as num;
    tollRoad = json['tollRoad'] as String;
    tolls = json['tolls'] as num;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (TMCs != null) {
      data['TMCs'] = TMCs!.map((v) => v.toJson()).toList();
    }
    data['action'] = action;
    data['assistantAction'] = assistantAction;
    data['distance'] = distance;
    data['duration'] = duration;
    data['instruction'] = instruction;
    data['orientation'] = orientation;
    if (polyline != null) {
      data['polyline'] = polyline!.map((v) => v.toJson()).toList();
    }
    data['road'] = road;
    if (routeSearchCityList != null) {
      data['routeSearchCityList'] = routeSearchCityList!.map((v) => v.toJson()).toList();
    }
    data['tollDistance'] = tollDistance;
    data['tollRoad'] = tollRoad;
    data['tolls'] = tolls;
    return data;
  }

  Steps copyWith({
    List<TMC>? TMCs,
    String? action,
    String? assistantAction,
    num? distance,
    num? duration,
    String? instruction,
    String? orientation,
    List<LatLng>? polyline,
    String? road,
    List<RouteSearchCityList>? routeSearchCityList,
    num? tollDistance,
    String? tollRoad,
    num? tolls,
  }) {
    return Steps(
      TMCs: TMCs ?? this.TMCs,
      action: action ?? this.action,
      assistantAction: assistantAction ?? this.assistantAction,
      distance: distance ?? this.distance,
      duration: duration ?? this.duration,
      instruction: instruction ?? this.instruction,
      orientation: orientation ?? this.orientation,
      polyline: polyline ?? this.polyline,
      road: road ?? this.road,
      routeSearchCityList: routeSearchCityList ?? this.routeSearchCityList,
      tollDistance: tollDistance ?? this.tollDistance,
      tollRoad: tollRoad ?? this.tollRoad,
      tolls: tolls ?? this.tolls,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Steps &&
          runtimeType == other.runtimeType &&
          TMCs == other.TMCs &&
          action == other.action &&
          assistantAction == other.assistantAction &&
          distance == other.distance &&
          duration == other.duration &&
          instruction == other.instruction &&
          orientation == other.orientation &&
          polyline == other.polyline &&
          road == other.road &&
          routeSearchCityList == other.routeSearchCityList &&
          tollDistance == other.tollDistance &&
          tollRoad == other.tollRoad &&
          tolls == other.tolls;

  @override
  int get hashCode =>
      TMCs.hashCode ^
      action.hashCode ^
      assistantAction.hashCode ^
      distance.hashCode ^
      duration.hashCode ^
      instruction.hashCode ^
      orientation.hashCode ^
      polyline.hashCode ^
      road.hashCode ^
      routeSearchCityList.hashCode ^
      tollDistance.hashCode ^
      tollRoad.hashCode ^
      tolls.hashCode;

  @override
  String toString() {
    return '''Steps{
		TMCs: $TMCs,
		action: $action,
		assistantAction: $assistantAction,
		distance: $distance,
		duration: $duration,
		instruction: $instruction,
		orientation: $orientation,
		polyline: $polyline,
		road: $road,
		routeSearchCityList: $routeSearchCityList,
		tollDistance: $tollDistance,
		tollRoad: $tollRoad,
		tolls: $tolls}''';
  }
}

/// 道路拥堵情况
class TMC {
  num? distance;
  List<LatLng>? polyline;
  String? status;

  TMC({
    this.distance,
    this.polyline,
    this.status,
  });

  TMC.fromJson(Map<String, dynamic> json) {
    distance = json['distance'] as num;
    if (json['polyline'] != null) {
      polyline = <LatLng>[];
      json['polyline'].forEach((v) {
        polyline!.add(LatLng.fromJson(v as Map<String, dynamic>));
      });
    }
    status = json['status'] as String;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['distance'] = distance;
    if (polyline != null) {
      data['polyline'] = polyline!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }

  TMC copyWith({
    int? distance,
    List<LatLng>? polyline,
    String? status,
  }) {
    return TMC(
      distance: distance ?? this.distance,
      polyline: polyline ?? this.polyline,
      status: status ?? this.status,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TMC &&
          runtimeType == other.runtimeType &&
          distance == other.distance &&
          polyline == other.polyline &&
          status == other.status;

  @override
  int get hashCode => distance.hashCode ^ polyline.hashCode ^ status.hashCode;

  @override
  String toString() {
    return '''TMCs{
		distance: $distance,
		polyline: $polyline,
		status: $status}''';
  }
}

class RouteSearchCityList {
  List<Districts>? districts;

  RouteSearchCityList({
    this.districts,
  });

  RouteSearchCityList.fromJson(Map<String, dynamic> json) {
    if (json['districts'] != null) {
      districts = <Districts>[];
      json['districts'].forEach((v) {
        districts!.add(Districts.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (districts != null) {
      data['districts'] = districts!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  RouteSearchCityList copyWith({
    List<Districts>? districts,
  }) {
    return RouteSearchCityList(
      districts: districts ?? this.districts,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RouteSearchCityList && runtimeType == other.runtimeType && districts == other.districts;

  @override
  int get hashCode => districts.hashCode;

  @override
  String toString() {
    return '''RouteSearchCityList{
		districts: $districts}''';
  }
}

class Districts {
  String? districtAdcode;
  String? districtName;

  Districts({
    this.districtAdcode,
    this.districtName,
  });

  Districts.fromJson(Map<String, dynamic> json) {
    districtAdcode = json['districtAdcode'] as String;
    districtName = json['districtName'] as String;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['districtAdcode'] = districtAdcode;
    data['districtName'] = districtName;
    return data;
  }

  Districts copyWith({
    String? districtAdcode,
    String? districtName,
  }) {
    return Districts(
      districtAdcode: districtAdcode ?? this.districtAdcode,
      districtName: districtName ?? this.districtName,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Districts &&
          runtimeType == other.runtimeType &&
          districtAdcode == other.districtAdcode &&
          districtName == other.districtName;

  @override
  int get hashCode => districtAdcode.hashCode ^ districtName.hashCode;

  @override
  String toString() {
    return '''Districts{
		districtAdcode: $districtAdcode,
		districtName: $districtName}''';
  }
}
