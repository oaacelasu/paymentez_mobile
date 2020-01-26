import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class AddCardEvent extends Equatable {
  const AddCardEvent();

  @override
  List<Object> get props => [];
}

class NameChanged extends AddCardEvent {
  final String name;

  const NameChanged({@required this.name});

  @override
  List<Object> get props => [name];

  @override
  String toString() => 'NameChanged { number :$name }';
}

class NumberChanged extends AddCardEvent {
  final String number;

  const NumberChanged({@required this.number});

  @override
  List<Object> get props => [number];

  @override
  String toString() => 'NumberChanged { number :$number }';
}

class DateExpChanged extends AddCardEvent {
  final String dateExp;

  const DateExpChanged({@required this.dateExp});

  @override
  List<Object> get props => [dateExp];

  @override
  String toString() => 'DateExpChanged { dateExp :$dateExp }';
}

class Submitted extends AddCardEvent {
  final String number;

  const Submitted({
    @required this.number,
  });

  @override
  List<Object> get props => [number];

  @override
  String toString() {
    return 'Submitted { number: $number}';
  }
}
