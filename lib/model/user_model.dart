import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final DateTime date;
  const User({
    required this.id,
    required this.name,
    required this.date,
  });

  @override
  List<Object?> get props => [id, name, date];
}
