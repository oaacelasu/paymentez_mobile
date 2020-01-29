import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class User extends Equatable {
  final String id;
  final String email;
  final String ipAddress;
  final String fiscalNumber;

  User({
    @required String id,
    @required String email,
    @required String ipAddress,
    @required String fiscalNumber,
  })  : id = id,
        email = email,
        ipAddress = ipAddress,
        fiscalNumber = fiscalNumber;

  User copyWith({
    String id,
    String email,
    String ipAddress,
    String fiscalNumber,
  }) =>
      User(
        id: id ?? this.id,
        email: email ?? this.email,
        ipAddress: ipAddress ?? this.ipAddress,
        fiscalNumber: fiscalNumber ?? this.fiscalNumber,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id ?? 'uid12345',
        'email': this.email ?? 'dev@paymentez.com',
      };

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      email: json['email'],
      ipAddress: json['ip_address'],
      fiscalNumber: json['fiscal_number']);

  @override
  String toString() {
    return 'User{id: $id, email: $email, ip_address: $ipAddress, fiscal_number: $fiscalNumber}';
  }

  @override
  List<Object> get props => [
        id,
        email,
        ipAddress,
        fiscalNumber,
      ];
}
