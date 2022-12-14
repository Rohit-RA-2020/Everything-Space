// To parse this JSON data, do
//
//     final picOfTheDay = picOfTheDayFromJson(jsonString);

import 'dart:convert';

PicOfTheDay picOfTheDayFromJson(String str) =>
    PicOfTheDay.fromJson(json.decode(str));

String picOfTheDayToJson(PicOfTheDay data) => json.encode(data.toJson());

class PicOfTheDay {
  PicOfTheDay({
    required this.date,
    required this.explanation,
    required this.mediaType,
    required this.serviceVersion,
    required this.title,
    required this.url,
  });

  DateTime date;
  String explanation;
  String mediaType;
  String serviceVersion;
  String title;
  String url;

  factory PicOfTheDay.fromJson(Map<String, dynamic> json) => PicOfTheDay(
        date: DateTime.parse(json["date"]),
        explanation: json["explanation"],
        mediaType: json["media_type"],
        serviceVersion: json["service_version"],
        title: json["title"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "explanation": explanation,
        "media_type": mediaType,
        "service_version": serviceVersion,
        "title": title,
        "url": url,
      };
}
