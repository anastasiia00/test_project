// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class AppState {
  final Color backgroundColor;
  final Color textColor;
  final String text;
  AppState({
    required this.backgroundColor,
    required this.textColor,
    required this.text,
  });

  AppState copyWith({
    Color? backgroundColor,
    Color? textColor,
    String? text,
  }) {
    return AppState(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      text: text ?? this.text,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'backgroundColor': backgroundColor.value,
      'textColor': textColor.value,
      'text': text,
    };
  }

  factory AppState.fromMap(Map<String, dynamic> map) {
    return AppState(
      backgroundColor: Color(map['backgroundColor'] as int),
      textColor: Color(map['textColor'] as int),
      text: map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppState.fromJson(String source) =>
      AppState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AppState(backgroundColor: $backgroundColor, textColor: $textColor, text: $text)';

  @override
  bool operator ==(covariant AppState other) {
    if (identical(this, other)) return true;

    return other.backgroundColor == backgroundColor &&
        other.textColor == textColor &&
        other.text == text;
  }

  @override
  int get hashCode =>
      backgroundColor.hashCode ^ textColor.hashCode ^ text.hashCode;
}
