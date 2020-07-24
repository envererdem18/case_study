import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:profe_case_study/core/constants/app_constants.dart';
import 'package:profe_case_study/core/extensions/x_enum.dart';
import 'package:profe_case_study/core/extensions/x_string.dart';

class Task {
  final String id;
  final String description;
  final Role role;
  final Category category;
  final DateTime time;
  Task({
    @required this.id,
    @required this.description,
    @required this.role,
    @required this.category,
    @required this.time,
  });

  Task copyWith({
    String id,
    String description,
    Role role,
    Category category,
    DateTime time,
  }) {
    return Task(
      id: id ?? this.id,
      description: description ?? this.description,
      role: role ?? this.role,
      category: category ?? this.category,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'role': role?.str,
      'category': category?.str,
      'time': time?.millisecondsSinceEpoch,
    };
  }

  static Task fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Task(
      id: map['id'],
      description: map['description'],
      role: map['role'].toString().role,
      category: map['category'].toString().category,
      time: DateTime.fromMillisecondsSinceEpoch(map['time']),
    );
  }

  String toJson() => json.encode(toMap());

  static Task fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Task(id: $id, description: $description, role: $role, category: $category, time: $time)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Task &&
        o.id == id &&
        o.description == description &&
        o.role == role &&
        o.category == category &&
        o.time == time;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        description.hashCode ^
        role.hashCode ^
        category.hashCode ^
        time.hashCode;
  }
}
