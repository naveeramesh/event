// To parse this JSON data, do
//
//     final eventClass = eventClassFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

EventClass eventClassFromJson(String str) =>
    EventClass.fromJson(json.decode(str));

String eventClassToJson(EventClass data) => json.encode(data.toJson());

class EventClass {
  EventClass({
    required this.id,
    this.title,
    this.description,
    this.startAt,
    this.endAt,
  });

  int id;

  String? title;
  String? description;
  String? startAt;
  String? endAt;

  factory EventClass.fromJson(Map<String, dynamic> json) => EventClass(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        startAt: json["start_at"],
        endAt: json["end_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "start_at": startAt,
        "end_at": endAt,
      };
}
