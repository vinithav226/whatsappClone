part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final ThemeData themeData;
  const ThemeState({
    required this.themeData,
  });
  @override
  List<Object> get props => [];

  ThemeState copyWith({
    ThemeData? themeData,
  }) {
    return ThemeState(
      themeData: themeData ?? this.themeData,
    );
  }
}
