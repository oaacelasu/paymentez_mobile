import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class ErrorModel extends Equatable {
  final String type;
  final String description;
  final String help;


  ErrorModel({
    @required String type,
    @required String description,
    @required String help,
  })  : type = type,
        description = description,
        help = help;

  ErrorModel copyWith(
          {String type,
          String description,
          String help}) =>
      ErrorModel(
        type: type ?? this.type,
        description: description ?? this.description,
        help: help ?? this.help,

      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'type': type,
        'description': description,
        'help': help
      };

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
    type: json['type'],
    description: json['description'],
      help: json['help'],
  );

  @override
  String toString() {
    return 'ErrorModel{type : $type,description: $description, help: $help}';
  }

  @override
  List<Object> get props => [
    type,
    description,
    help
      ];
}
