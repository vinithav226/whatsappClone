part of 'theme_bloc.dart';

class ThemeEvent extends Equatable {
  final ThemeData appTheme;
  const ThemeEvent({
    required this.appTheme,
  });
  @override
  List<Object> get props => [];

  ThemeEvent copyWith({
    ThemeData? appTheme,
  }) {
    return ThemeEvent(
      appTheme: appTheme ?? this.appTheme,
    );
  }
}
