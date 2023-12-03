// To parse this JSON data, do
//
//     final weatherForeCastHourlyModel = weatherForeCastHourlyModelFromJson(jsonString);

import 'dart:convert';

WeatherForeCastHourlyModel weatherForeCastHourlyModelFromJson(String str) => WeatherForeCastHourlyModel.fromJson(json.decode(str));

String weatherForeCastHourlyModelToJson(WeatherForeCastHourlyModel data) => json.encode(data.toJson());

class WeatherForeCastHourlyModel {
    final String? cityName;
    final String? countryCode;
    final List<Datum>? data;
    final num? lat;
    final num? lon;
    final String? stateCode;
    final String? timezone;

    WeatherForeCastHourlyModel({
        this.cityName,
        this.countryCode,
        this.data,
        this.lat,
        this.lon,
        this.stateCode,
        this.timezone,
    });

    factory WeatherForeCastHourlyModel.fromJson(Map<String, dynamic> json) => WeatherForeCastHourlyModel(
        cityName: json["city_name"],
        countryCode: json["country_code"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        lat: json["lat"],
        lon: json["lon"],
        stateCode: json["state_code"],
        timezone: json["timezone"],
    );

    Map<String, dynamic> toJson() => {
        "city_name": cityName,
        "country_code": countryCode,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "lat": lat,
        "lon": lon,
        "state_code": stateCode,
        "timezone": timezone,
    };
}

class Datum {
    final num? appTemp;
    final num? clouds;
    final num? cloudsHi;
    final num? cloudsLow;
    final num? cloudsMid;
    final String? datetime;
    final num? dewpt;
    final num? dhi;
    final num? dni;
    final num? ghi;
    final num? ozone;
    final String? pod;
    final num? pop;
    final num? precip;
    final num? pres;
    final num? rh;
    final num? slp;
    final num? snow;
    final num? snowDepth;
    final num? solarRad;
    final num? temp;
    final DateTime? timestampLocal;
    final DateTime? timestampUtc;
    final num? ts;
    final num? uv;
    final num? vis;
    final Weather? weather;
    final String? windCdir;
    final String? windCdirFull;
    final num? windDir;
    final num? windGustSpd;
    final num? windSpd;

    Datum({
        this.appTemp,
        this.clouds,
        this.cloudsHi,
        this.cloudsLow,
        this.cloudsMid,
        this.datetime,
        this.dewpt,
        this.dhi,
        this.dni,
        this.ghi,
        this.ozone,
        this.pod,
        this.pop,
        this.precip,
        this.pres,
        this.rh,
        this.slp,
        this.snow,
        this.snowDepth,
        this.solarRad,
        this.temp,
        this.timestampLocal,
        this.timestampUtc,
        this.ts,
        this.uv,
        this.vis,
        this.weather,
        this.windCdir,
        this.windCdirFull,
        this.windDir,
        this.windGustSpd,
        this.windSpd,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        appTemp: json["app_temp"],
        clouds: json["clouds"],
        cloudsHi: json["clouds_hi"],
        cloudsLow: json["clouds_low"],
        cloudsMid: json["clouds_mid"],
        datetime: json["datetime"],
        dewpt: json["dewpt"],
        dhi: json["dhi"],
        dni: json["dni"],
        ghi: json["ghi"],
        ozone: json["ozone"],
        pod: json["pod"],
        pop: json["pop"],
        precip: json["precip"],
        pres: json["pres"],
        rh: json["rh"],
        slp: json["slp"],
        snow: json["snow"],
        snowDepth: json["snow_depth"],
        solarRad: json["solar_rad"],
        temp: json["temp"],
        timestampLocal: json["timestamp_local"] == null ? null : DateTime.parse(json["timestamp_local"]),
        timestampUtc: json["timestamp_utc"] == null ? null : DateTime.parse(json["timestamp_utc"]),
        ts: json["ts"],
        uv: json["uv"],
        vis: json["vis"],
        weather: json["weather"] == null ? null : Weather.fromJson(json["weather"]),
        windCdir: json["wind_cdir"],
        windCdirFull: json["wind_cdir_full"],
        windDir: json["wind_dir"],
        windGustSpd: json["wind_gust_spd"],
        windSpd: json["wind_spd"],
    );

    Map<String, dynamic> toJson() => {
        "app_temp": appTemp,
        "clouds": clouds,
        "clouds_hi": cloudsHi,
        "clouds_low": cloudsLow,
        "clouds_mid": cloudsMid,
        "datetime": datetime,
        "dewpt": dewpt,
        "dhi": dhi,
        "dni": dni,
        "ghi": ghi,
        "ozone": ozone,
        "pod": pod,
        "pop": pop,
        "precip": precip,
        "pres": pres,
        "rh": rh,
        "slp": slp,
        "snow": snow,
        "snow_depth": snowDepth,
        "solar_rad": solarRad,
        "temp": temp,
        "timestamp_local": timestampLocal?.toIso8601String(),
        "timestamp_utc": timestampUtc?.toIso8601String(),
        "ts": ts,
        "uv": uv,
        "vis": vis,
        "weather": weather?.toJson(),
        "wind_cdir": windCdir,
        "wind_cdir_full": windCdirFull,
        "wind_dir": windDir,
        "wind_gust_spd": windGustSpd,
        "wind_spd": windSpd,
    };
}


class Weather {
    final String? icon;
    final String? description;
    final num? code;

    Weather({
        this.icon,
        this.description,
        this.code,
    });

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        icon: json["icon"],
        description: json["description"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "icon": icon,
        "description": description,
        "code": code,
    };
}





