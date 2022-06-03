part of 'colors_bloc.dart';

class ColorsState extends Equatable {
  Color selectedColor;
  ColorsState({
    required this.selectedColor,
  });

  @override
  List<Object> get props => [];

  ColorsState copyWith({
    Color? selectedColor,
  }) {
    return ColorsState(
      selectedColor: selectedColor ?? this.selectedColor,
    );
  }
}
