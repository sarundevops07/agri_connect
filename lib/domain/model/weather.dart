// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  @JsonKey(name: 'location')
  LocationModel? location;

  @JsonKey(name: 'current')
  CurrentWeatherModel? currentWeather;

  ForecastData? forecastData;

  Weather({
    this.location,
    this.currentWeather,
    this.forecastData,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return _$WeatherFromJson(json);
  }

  Map<String, dynamic> tojson() => _$WeatherToJson(this);
}

class CityWeather {
  final String name;
  final String temperature;
  final String weatherText;

  CityWeather({
    required this.name,
    required this.temperature,
    required this.weatherText,
  });
}

@JsonSerializable()
class LocationModel {
  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'region')
  String? region;

  @JsonKey(name: 'country')
  String? country;

  @JsonKey(name: 'lat')
  double? latitude;

  @JsonKey(name: 'lon')
  double? longitude;

  LocationModel({
    this.name,
    this.region,
    this.country,
    this.latitude,
    this.longitude,
  });
  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return _$LocationModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}

@JsonSerializable()
class CurrentWeatherModel {
  @JsonKey(name: 'temp_c')
  double? tempC;

  @JsonKey(name: 'is_day')
  int? isDay;

  @JsonKey(name: 'condition')
  ConditionModel? condition;

  @JsonKey(name: 'cloud')
  double? cloud;

  @JsonKey(name: 'precip_in')
  double? precipInches;

  @JsonKey(name: 'gust_kph')
  double? gustKph;

  CurrentWeatherModel({
    this.tempC,
    this.isDay,
    this.condition,
    this.cloud,
    this.precipInches,
    this.gustKph,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return _$CurrentWeatherModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CurrentWeatherModelToJson(this);
}

@JsonSerializable()
class ConditionModel {
  @JsonKey(name: 'text')
  String text;

  @JsonKey(name: 'icon')
  String icon;

  ConditionModel({
    required this.text,
    required this.icon,
  });
  factory ConditionModel.fromJson(Map<String, dynamic> json) {
    return _$ConditionModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ConditionModelToJson(this);
}

@JsonSerializable()
class ForecastData {
  List<ForecastDay> forecastDays;

  ForecastData({
    required this.forecastDays,
  });
  factory ForecastData.fromJson(Map<String, dynamic> json) {
    return _$ForecastDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ForecastDataToJson(this);
}

@JsonSerializable()
class ForecastDay {
  @JsonKey(name: 'date')
  String date;

  @JsonKey(name: 'astro')
  AstronomicalInfo astro;

  ForecastDay({
    required this.date,
    required this.astro,
  });
  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    return _$ForecastDayFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ForecastDayToJson(this);
}

@JsonSerializable()
class AstronomicalInfo {
  @JsonKey(name: 'sunrise')
  String sunrise;

  @JsonKey(name: 'sunset')
  String sunset;

  @JsonKey(name: 'moonrise')
  String moonrise;

  @JsonKey(name: 'moonset')
  String moonset;

  AstronomicalInfo({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
  });
  factory AstronomicalInfo.fromJson(Map<String, dynamic> json) {
    return _$AstronomicalInfoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AstronomicalInfoToJson(this);
}
